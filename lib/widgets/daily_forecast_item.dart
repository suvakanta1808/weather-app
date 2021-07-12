import 'package:flutter/material.dart';
import 'package:weather_app/widgets/temperature.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:weather_icons/weather_icons.dart';

class DailyForecastItem extends StatelessWidget {
  final String dayName;
  final String date;
  final IconData dayIcon;
  final IconData nightIcon;
  final String maxTemp;
  final String minTemp;
  final String windSpeed;
  final int windDirection;
  final int index;

  DailyForecastItem({
    required this.dayName,
    required this.date,
    required this.index,
    required this.dayIcon,
    required this.nightIcon,
    required this.maxTemp,
    required this.minTemp,
    required this.windSpeed,
    required this.windDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 100,
      decoration: BoxDecoration(
        border: index == 0
            ? Border.all(width: 2, color: Colors.blue.shade400)
            : null,
        borderRadius: index == 0 ? BorderRadius.circular(20) : null,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Text(dayName.substring(0, 3)),
          Text(date),
          SizedBox(
            height: 10,
          ),
          BoxedIcon(
            dayIcon,
            color: Colors.white,
          ),
          SizedBox(
            height: 30,
          ),
          Temperature(
            temp: maxTemp,
            tempFontSize: 22,
            degreeFontSize: 12,
          ),
          SizedBox(
            height: 65,
          ),
          Temperature(
            temp: minTemp,
            tempFontSize: 22,
            degreeFontSize: 12,
          ),
          SizedBox(
            height: 30,
          ),
          BoxedIcon(
            nightIcon,
            color: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              WindIcon(
                degree: windDirection,
                color: Colors.white,
                size: 20,
              ),
              FittedBox(
                  child: Text(
                '$windSpeed km/h',
                style: TextStyle(fontSize: 13),
              ))
            ],
          )
        ],
      ),
    );
  }
}
