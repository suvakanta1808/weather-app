import 'package:flutter/material.dart';
import 'package:weather_app/widgets/temperature.dart';

class UserSelectedCitiesOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 500,
        width: double.infinity,
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (ctx, i) => Card(
            margin: EdgeInsets.only(bottom: 15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 2,
            color: Colors.blue.shade300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Kolkata',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text('AQI 17  '),
                        Temperature(
                          temp: '32',
                          tempFontSize: 15,
                          degreeFontSize: 5,
                        ),
                        Text('/'),
                        Temperature(
                          temp: '27',
                          tempFontSize: 15,
                          degreeFontSize: 5,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Temperature(
                  temp: '32',
                  tempFontSize: 30,
                  degreeFontSize: 13,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
