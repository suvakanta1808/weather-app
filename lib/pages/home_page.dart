import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:weather_app/widgets/air_quality_index.dart';
import 'package:weather_app/widgets/weather_details.dart';
import 'package:weather_app/widgets/weather_details_item.dart';
import 'package:weather_app/widgets/weather_forecast_panel.dart';
import 'package:weather_app/widgets/weather_item.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<List<String>> _forecastData = [
    ['Today.Clear', '34 / 27 oC'],
    ['Tomorrow.Clear', '35 / 26 oC'],
    ['Wednessday.Clear', '34 / 24 oC'],
  ];
  Map<String, dynamic> _details = {};
  Map<String, dynamic> aqiData = {};
  String _aqi = '';

  static const API_KEY = '4f03aed2d15f16b6a0023fc5d2a7ad57';

  @override
  void initState() {
    fetchDetails();
    super.initState();
  }

  Future<void> fetchDetails() async {
    final loc = await Location().getLocation();

    final url = Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?lat=${loc.latitude}&lon=${loc.longitude}&units=metric&appid=$API_KEY');
    final wet = await http.get(url);
    final wetData = convert.jsonDecode(wet.body);

    final aqiUrl = Uri.parse(
        'http://api.openweathermap.org/data/2.5/air_pollution?lat=${loc.latitude}&lon=${loc.longitude}&appid=$API_KEY');

    final aqi = await http.get(aqiUrl);
    final aqiDoc = convert.jsonDecode(aqi.body) as Map<String, dynamic>;

    print(wetData);

    setState(() {
      _details = wetData;
      aqiData = aqiDoc;
      _aqi = aqiDoc['list'][0]['main']['aqi'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _details.isEmpty
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              color: Colors.red,
              onRefresh: fetchDetails,
              semanticsLabel: 'Updating...',
              strokeWidth: 2.0,
              child: Stack(
                children: [
                  Container(
                    color: Colors.blue.shade700,
                  ),
                  SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      width: double.infinity,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                                Text(
                                  _details['name'],
                                  style: TextStyle(fontSize: 20),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.more_vert,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 60,
                              bottom: 90,
                            ),
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      (_details['main']['temp'])
                                          .toStringAsFixed(0),
                                      style: TextStyle(fontSize: 110),
                                    ),
                                    Text('o'),
                                    Text('C'),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  _details['weather'][0]['main'],
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                RaisedButton.icon(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.masks,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    'AQI $_aqi',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          WeatherForecastPanel(_forecastData),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () {},
                                child: Text(
                                  '5-day forecast',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Card(
                            elevation: 5,
                            color: Colors.blue.shade800,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Container(
                              margin: EdgeInsets.only(top: 25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Column(
                                    children: [
                                      WeatherDetailsItem(
                                        title: 'Sea Level',
                                        data: '1262 km',
                                      ),
                                      WeatherDetailsItem(
                                        title: 'Ground Level',
                                        data: '1067 km',
                                      ),
                                    ],
                                  ),
                                  WeatherItem(),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          // Container(
                          //   height: 150,
                          //   child: ListView.builder(
                          //     scrollDirection: Axis.horizontal,
                          //     itemBuilder: (ctx, i) => WeatherItem(),
                          //     itemCount: 23,
                          //   ),
                          // ),
                          WeatherDetails(
                            temperature: (_details['main']['feels_like'])
                                .toStringAsFixed(0),
                            humidity: (_details['main']['humidity'])
                                .toStringAsFixed(0),
                            chanceOfRain: '40',
                            pressure: (_details['main']['pressure'])
                                .toStringAsFixed(0),
                            speed: _details['wind']['speed'].toString(),
                            uvIndex: '4',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          AirQualityIndex(
                            _aqi,
                            aqiData,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text('Data provided in part by OpenWeatherMap'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
