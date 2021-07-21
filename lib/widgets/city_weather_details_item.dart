import 'package:flutter/material.dart';

class CityWeatherDeatilsItem extends StatelessWidget {
  final String title;
  final String data;

  CityWeatherDeatilsItem({
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.blue.shade800,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        alignment: Alignment.center,
        height: 80,
        width: 140,
        // decoration: BoxDecoration(
        //   border: Border.all(
        //     color: Colors.blue.shade200,
        //   ),
        //   borderRadius: BorderRadius.circular(15),
        // ),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              data,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
