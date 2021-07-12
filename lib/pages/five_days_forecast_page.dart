import 'package:flutter/material.dart';
import 'package:weather_app/helpers/weather_helper.dart';
import 'package:weather_app/widgets/daily_forecast_item.dart';

class FiveDaysForecastPage extends StatelessWidget {
  static const routeName = 'five-day-forecast';

  final weatherIconHandler = WeatherHelper().selectWeatherIcon;
  final dayNameHandler = WeatherHelper().weekDay;

  @override
  Widget build(BuildContext context) {
    final forecastData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_sharp,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        height: 600,
        width: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '7-day forecast',
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 400,
              width: 400,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, i) {
                  var d = new DateTime.fromMillisecondsSinceEpoch(
                    forecastData['daily'][i]['dt'] * 1000,
                    isUtc: false,
                  );
                  var dName = dayNameHandler((DateTime.now().weekday + i) % 7);
                  return DailyForecastItem(
                    index: i,
                    dayName: dName,
                    date: d.toString().substring(5, 7) +
                        '/' +
                        d.toString().substring(8, 10),
                    dayIcon: weatherIconHandler(
                        forecastData['daily'][i]['weather'][0]['main']),
                    nightIcon: weatherIconHandler(
                        forecastData['daily'][i]['weather'][0]['main']),
                    maxTemp: forecastData['daily'][i]['temp']['max']
                        .toString()
                        .substring(0, 2),
                    minTemp: forecastData['daily'][i]['temp']['min']
                        .toString()
                        .substring(0, 2),
                    windSpeed:
                        forecastData['daily'][i]['wind_speed'].toString(),
                    windDirection: forecastData['daily'][i]['wind_deg'],
                  );
                },
                itemCount: 7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
