import 'package:flutter/material.dart';

class WeatherDetailsItem extends StatelessWidget {
  final String title;
  final String data;

  WeatherDetailsItem({
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(
            height: 5,
          ),
          FittedBox(
            child: Text(
              data,
              style: TextStyle(fontSize: 21),
            ),
          ),
        ],
      ),
    );
  }
}
