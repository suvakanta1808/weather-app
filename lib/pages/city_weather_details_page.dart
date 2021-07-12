import 'package:flutter/material.dart';
import 'package:weather_app/helpers/weather_helper.dart';
import 'package:weather_app/models/forecast_data.dart';
import 'package:weather_app/widgets/city_weather_details_item.dart';

class CityWeatherDetailsPage extends StatelessWidget {
  static const routeName = 'city-weather-details';

  final dayNameHandler = WeatherHelper().weekDay;
  final weatherIconHandler = WeatherHelper().selectWeatherIcon;

  @override
  Widget build(BuildContext context) {
    final forecastData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    // final statusCode = int.parse(forecastData['cod']);
    // print(statusCode);

    if (forecastData['sys'] != null) {
      final srt = new DateTime.fromMillisecondsSinceEpoch(
        forecastData['sys']['sunrise'] * 1000,
        isUtc: false,
      );
      final sst = new DateTime.fromMillisecondsSinceEpoch(
        forecastData['sys']['sunset'] * 1000,
        isUtc: false,
      );

      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            forecastData['name'],
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
        ),
        body: forecastData.isEmpty
            ? Center(
                child: Text('No such place found'),
              )
            : SingleChildScrollView(
                child: Card(
                  margin: EdgeInsets.all(25),
                  elevation: 5,
                  color: Colors.black,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CityWeatherDeatilsItem(
                            title: 'Sunrise',
                            data: srt.toString().substring(11, 16),
                          ),
                          // SizedBox(
                          //   width: 20,
                          // ),
                          CityWeatherDeatilsItem(
                            title: 'Sunset',
                            data: sst.toString().substring(11, 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CityWeatherDeatilsItem(
                            title: 'Weather',
                            data: forecastData['weather'][0]['main'],
                          ),
                          // SizedBox(
                          //   width: 20,
                          // ),
                          CityWeatherDeatilsItem(
                            title: 'Description',
                            data: forecastData['weather'][0]['description'],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CityWeatherDeatilsItem(
                            title: 'Temperature(in celcius max/min)',
                            data: forecastData['main']['temp_max']
                                    .toString()
                                    .substring(0, 2) +
                                ' / ' +
                                forecastData['main']['temp_min']
                                    .toString()
                                    .substring(0, 2),
                          ),
                          // SizedBox(
                          //   width: 40,
                          // ),
                          CityWeatherDeatilsItem(
                            title: 'Feels-Like',
                            data:
                                forecastData['main']['feels_like'].toString() +
                                    ' dg.',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CityWeatherDeatilsItem(
                            title: 'Pressure',
                            data: forecastData['main']['pressure'].toString() +
                                ' mbar',
                          ),
                          // SizedBox(
                          //   width: 20,
                          // ),
                          CityWeatherDeatilsItem(
                            title: 'Humidity',
                            data: forecastData['main']['humidity'].toString() +
                                '%',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CityWeatherDeatilsItem(
                            title: 'Sea-Level',
                            data: forecastData['main']['sea_level'].toString() +
                                ' mbar',
                          ),
                          // SizedBox(
                          //   width: 20,
                          // ),
                          CityWeatherDeatilsItem(
                            title: 'Ground-Level',
                            data:
                                forecastData['main']['grnd_level'].toString() +
                                    ' mbar',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CityWeatherDeatilsItem(
                            title: 'Wind-Speed',
                            data: forecastData['wind']['speed'].toString() +
                                ' km/h',
                          ),
                          // SizedBox(
                          //   width: 20,
                          // ),
                          CityWeatherDeatilsItem(
                            title: 'Wind-Direction',
                            data:
                                forecastData['wind']['deg'].toString() + ' dg.',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Error occured!',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(
            top: 150,
            left: 80,
          ),
          child: ListTile(
            leading: Icon(
              Icons.error,
              size: 30,
              color: Colors.white,
            ),
            title: Text(
              'City not Found',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              'Error' + forecastData['cod'],
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    }
  }
}
