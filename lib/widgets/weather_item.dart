import 'package:flutter/material.dart';
import 'package:weather_app/helpers/weather_helper.dart';
import 'package:weather_app/widgets/temperature.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherItem extends StatelessWidget {
  final String time;
  final String weatherName;
  final String temperature;
  final String windSpeed;
  final int windDirection;

  WeatherItem({
    required this.time,
    required this.weatherName,
    required this.temperature,
    required this.windSpeed,
    required this.windDirection,
  });

  var weatherHandler = WeatherHelper().selectWeatherIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      height: 200,
      width: 115,
      child: Column(
        children: <Widget>[
          FittedBox(child: Text(time)),
          SizedBox(
            height: 5,
          ),
          Temperature(
            temp: temperature,
            tempFontSize: 15,
            degreeFontSize: 7,
          ),
          SizedBox(
            height: 5,
          ),
          IconButton(
            onPressed: () {},
            icon: BoxedIcon(
              weatherHandler(weatherName),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: WindIcon(
                  degree: windDirection,
                  color: Colors.white,
                ),
              ),
              FittedBox(child: Text('$windSpeed km/h')),
            ],
          ),
        ],
      ),
    );
  }
}
