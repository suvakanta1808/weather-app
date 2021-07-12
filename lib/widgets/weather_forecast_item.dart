import 'package:flutter/material.dart';
import 'package:weather_app/widgets/temperature.dart';

class WeatherForecastItem extends StatelessWidget {
  final String weather;
  final String maxTemp;
  final String minTemp;
  final IconData weatherIcon;

  WeatherForecastItem({
    required this.weather,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherIcon,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(onPressed: () {}, icon: Icon(weatherIcon)),
      title: Text(
        weather,
        style: Theme.of(context).textTheme.title,
      ),
      trailing: Container(
        width: 85,
        height: 60,
        child: Row(
          children: [
            Temperature(temp: maxTemp, tempFontSize: 20, degreeFontSize: 10),
            Text(' / '),
            Temperature(temp: minTemp, tempFontSize: 20, degreeFontSize: 10),
          ],
        ),
      ),
    );
  }
}
