import 'package:flutter/material.dart';

class WeatherItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 1,
        left: 5,
        right: 5,
      ),
      height: 200,
      width: 100,
      child: Column(
        children: <Widget>[
          Text('08:00'),
          SizedBox(
            height: 10,
          ),
          Text(
            '30 oC',
            style: TextStyle(fontSize: 23),
          ),
          SizedBox(
            height: 13,
          ),
          Icon(
            Icons.star_border_purple500,
            size: 30,
            color: Colors.yellow,
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.near_me,
                color: Colors.white,
              ),
              Text('5.6km/h'),
            ],
          )
        ],
      ),
    );
  }
}
