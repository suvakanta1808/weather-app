import 'package:flutter/material.dart';

class Temperature extends StatelessWidget {
  final String temp;
  final double tempFontSize;
  final double degreeFontSize;

  Temperature({
    required this.temp,
    required this.tempFontSize,
    required this.degreeFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            temp,
            style: TextStyle(
              fontSize: tempFontSize,
            ),
          ),
          SizedBox(
            width: 3,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: Text(
              'o',
              style: TextStyle(
                fontSize: degreeFontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
