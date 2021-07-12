import 'package:flutter/material.dart';
import 'package:weather_app/widgets/weather_item.dart';

class HourlyForecastPanel extends StatelessWidget {
  final Map<String, dynamic> forecastData;

  HourlyForecastPanel(this.forecastData);

  @override
  Widget build(BuildContext context) {
    print(forecastData);

    return SingleChildScrollView(
      child: Container(
        width: 400,
        height: 210,
        decoration: BoxDecoration(
          color: Colors.blue.shade800,
          borderRadius: BorderRadius.circular(25),
        ),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: forecastData['hourly'].length,
            itemBuilder: (ctx, i) {
              var d = new DateTime.fromMillisecondsSinceEpoch(
                forecastData['hourly'][i]['dt'] * 1000,
                isUtc: true,
              );
              return WeatherItem(
                time: d.toString().substring(11, 16),
                weatherName: forecastData['hourly'][i]['weather'][0]['main'],
                temperature: forecastData['hourly'][i]['temp'].toString(),
                windSpeed: forecastData['hourly'][i]['wind_speed'].toString(),
                windDirection: forecastData['hourly'][i]['wind_deg'],
              );
            }),
      ),
    );
  }
}
