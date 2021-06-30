import 'package:flutter/material.dart';
import 'package:weather_app/widgets/weather_forecast_item.dart';

class WeatherForecastPanel extends StatelessWidget {
  final List<List<String>> forecastData;

  WeatherForecastPanel(this.forecastData);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          WeatherForecastItem(
            weather: forecastData[0][0],
            temp: forecastData[0][1],
          ),
          WeatherForecastItem(
            weather: forecastData[1][0],
            temp: forecastData[1][1],
          ),
          WeatherForecastItem(
            weather: forecastData[2][0],
            temp: forecastData[2][1],
          ),
        ],
      ),
    );
  }
}
