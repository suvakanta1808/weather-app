import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:weather_app/widgets/weather_details_item.dart';

class SunriseSunsetWidget extends StatelessWidget {
  final String srTime;
  final String ssTime;

  SunriseSunsetWidget({
    required this.srTime,
    required this.ssTime,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: 15),
          height: 300,
          width: 350,
          child: CircularPercentIndicator(
            radius: 300,
            backgroundColor: Colors.white,
            percent: 1,
            progressColor: Colors.yellow.shade400,
            lineWidth: 30,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 150),
          color: Colors.blue.shade800,
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              WeatherDetailsItem(
                title: 'Sunrise',
                data: srTime,
              ),
              SizedBox(
                width: 20,
              ),
              WeatherDetailsItem(
                title: 'Sunset',
                data: ssTime,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
