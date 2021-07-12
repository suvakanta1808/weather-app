import 'package:flutter/material.dart';
import 'package:weather_app/widgets/air_component.dart';

class AqiDetailsPage extends StatelessWidget {
  static const routeName = 'aqi-detail';

  @override
  Widget build(BuildContext context) {
    final aqiData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var d = new DateTime.fromMillisecondsSinceEpoch(
      aqiData['list'][0]['dt'] * 1000,
      isUtc: true,
    );
    var date = d.toString().substring(11, 16);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Air Quality Index',
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Details Published at $date',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  aqiData['list'][0]['main']['aqi'].toString(),
                  style: TextStyle(
                    fontSize: 37,
                    color: aqiData['list'][0]['main']['aqi'] < 100
                        ? Colors.greenAccent.shade400
                        : Colors.deepOrangeAccent,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  aqiData['list'][0]['main']['aqi'] < 100
                      ? 'Good'
                      : 'Very unhealthy.Stay safe',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.greenAccent.shade400,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Air quality is good.A perfect day for a walk!',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  AirComponent(
                    label: 'PM2.5',
                    data: '${aqiData['list'][0]['components']['pm2_5']}',
                  ),
                  AirComponent(
                    label: 'PM10',
                    data: '${aqiData['list'][0]['components']['pm10']}',
                  ),
                  AirComponent(
                    label: 'SO2',
                    data: '${aqiData['list'][0]['components']['so2']}',
                  ),
                  AirComponent(
                    label: 'NO2',
                    data: '${aqiData['list'][0]['components']['no2']}',
                  ),
                  AirComponent(
                    label: 'O3',
                    data: '${aqiData['list'][0]['components']['o3']}',
                  ),
                  AirComponent(
                    label: 'CO',
                    data: '${aqiData['list'][0]['components']['co']}',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              color: Colors.white38,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'More on air quality',
                  style: TextStyle(fontSize: 15),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.navigate_next_sharp,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'OpenWeatherMap',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
