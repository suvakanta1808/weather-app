import 'package:flutter/material.dart';
import 'package:weather_app/widgets/weather_details_item.dart';

class WeatherDetails extends StatelessWidget {
  final String temperature;
  final String humidity;
  final String chanceOfRain;
  final String pressure;
  final String speed;
  final String uvIndex;

  WeatherDetails({
    required this.temperature,
    required this.humidity,
    required this.chanceOfRain,
    required this.pressure,
    required this.speed,
    required this.uvIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.blue.shade800,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Text('PlaceHolder_Image'),
            height: 100,
            width: double.infinity,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('Sunrise 05:09'),
              Text('Sunset 18:30'),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              WeatherDetailsItem(
                title: 'Real feel',
                data: '$temperature dg.',
              ),
              WeatherDetailsItem(
                title: 'Humidity',
                data: '$humidity %',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              WeatherDetailsItem(
                title: 'Chance of rain',
                data: '$chanceOfRain %',
              ),
              WeatherDetailsItem(
                title: 'Pressure',
                data: '$pressure mbar',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              WeatherDetailsItem(
                title: 'Wind speed',
                data: '$speed km/h',
              ),
              WeatherDetailsItem(
                title: 'UV index',
                data: '$uvIndex',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
