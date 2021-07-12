import 'package:flutter/material.dart';
import 'package:weather_app/helpers/weather_helper.dart';
import 'package:weather_app/widgets/weather_forecast_item.dart';

class WeatherForecastPanel extends StatelessWidget {
  final Map<String, dynamic> forecastData;

  WeatherForecastPanel(this.forecastData);

  var weatherIconHandler = WeatherHelper().selectWeatherIcon;
  var dayNameHandler = WeatherHelper().weekDay;

  @override
  Widget build(BuildContext context) {
    var dayAfter = dayNameHandler((DateTime.now().weekday + 2) % 7);

    return Container(
      child: Column(
        children: <Widget>[
          WeatherForecastItem(
            weather: 'Today.${forecastData['daily'][0]['weather'][0]['main']}',
            maxTemp: forecastData['daily'][0]['temp']['max']
                .toString()
                .substring(0, 2),
            minTemp: forecastData['daily'][0]['temp']['min']
                .toString()
                .substring(0, 2),
            weatherIcon: weatherIconHandler(
                forecastData['daily'][0]['weather'][0]['main']),
          ),
          WeatherForecastItem(
            weather:
                'Tomorrow.${forecastData['daily'][1]['weather'][0]['main']}',
            maxTemp: forecastData['daily'][1]['temp']['max']
                .toString()
                .substring(0, 2),
            minTemp: forecastData['daily'][1]['temp']['min']
                .toString()
                .substring(0, 2),
            weatherIcon: weatherIconHandler(
                forecastData['daily'][1]['weather'][0]['main']),
          ),
          WeatherForecastItem(
            weather:
                '$dayAfter.${forecastData['daily'][2]['weather'][0]['main']}',
            maxTemp: forecastData['daily'][2]['temp']['max']
                .toString()
                .substring(0, 2),
            minTemp: forecastData['daily'][2]['temp']['min']
                .toString()
                .substring(0, 2),
            weatherIcon: weatherIconHandler(
                forecastData['daily'][2]['weather'][0]['main']),
          ),
        ],
      ),
    );
  }
}
