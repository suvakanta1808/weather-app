import 'package:flutter/material.dart';

class WeatherForecastItem extends StatelessWidget {
  final String weather;
  final String temp;

  WeatherForecastItem({
    required this.weather,
    required this.temp,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.star_border_outlined,
        size: 35,
        color: Colors.white,
      ),
      title: Text(
        weather,
        style: Theme.of(context).textTheme.title,
      ),
      trailing: Text(
        temp,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}
