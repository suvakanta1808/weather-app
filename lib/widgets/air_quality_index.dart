import 'package:flutter/material.dart';
import 'package:weather_app/pages/aqi_details_page.dart';

class AirQualityIndex extends StatelessWidget {
  final String aqi;
  final Map<String, dynamic> aqiData;

  AirQualityIndex(
    this.aqi,
    this.aqiData,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          AqiDetailsPage.routeName,
          arguments: aqiData,
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Container(
          height: 60,
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Air Quality Index'),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.masks,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        aqi,
                        style: TextStyle(fontSize: 21),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Full air quality details'),
                      Icon(
                        Icons.navigate_next_sharp,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        color: Colors.blue.shade800,
      ),
    );
  }
}
