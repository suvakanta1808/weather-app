import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:location/location.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/pages/five_days_forecast_page.dart';
import 'package:weather_app/pages/search_location_page.dart';
import 'package:weather_app/widgets/air_quality_index.dart';
import 'package:weather_app/widgets/hourly_forecast_panel.dart';
import 'package:weather_app/widgets/splash_item.dart';
import 'package:weather_app/widgets/weather_details.dart';
import 'package:weather_app/widgets/weather_forecast_panel.dart';
import 'package:http/http.dart' as http;
// ignore: import_of_legacy_library_into_null_safe

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //API_KEY for data fetching
  var API_KEY = env['WEATHER_API_KEY'];

  //data initialized with null
  Map<String, dynamic> _details = {};
  Map<String, dynamic> aqiData = {};
  Map<String, dynamic> hourlyForecastData = {};
  Map<String, dynamic> dailyForecastData = {};
  DateTime srt = DateTime.now();
  DateTime sst = DateTime.now();
  String _aqi = '';

  @override
  void initState() {
    _getUserCurrentLocationAndWeatherInfo();
    super.initState();
  }

  //Fecth the current location of user and pass it to the fetchDetails method to retrive current weather conditions
  Future<void> _getUserCurrentLocationAndWeatherInfo() async {
    final locData = await Location().getLocation();
    await fetchDetails(locData);
  }

  //fetch weather conditions data of given cordinates
  Future<void> fetchDetails(LocationData loc) async {
    print(API_KEY);
    final url = Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?lat=${loc.latitude}&lon=${loc.longitude}&units=metric&appid=$API_KEY');
    final wet = await http.get(url);
    final wetData = convert.jsonDecode(wet.body);

    final aqiUrl = Uri.parse(
        'http://api.openweathermap.org/data/2.5/air_pollution?lat=${loc.latitude}&lon=${loc.longitude}&appid=$API_KEY');

    final aqi = await http.get(aqiUrl);
    final aqiDoc = convert.jsonDecode(aqi.body) as Map<String, dynamic>;

    final hfUrl = Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=${loc.latitude}&lon=${loc.longitude}&exclude=daily&units=metric&appid=$API_KEY');

    final hfrData = await http.get(hfUrl);
    final hForecastDocs =
        convert.jsonDecode(hfrData.body) as Map<String, dynamic>;

    final dfUrl = Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=${loc.latitude}&lon=${loc.longitude}&exclude=hourly&units=metric&appid=$API_KEY');

    final dfrData = await http.get(dfUrl);
    final dForecastDocs =
        convert.jsonDecode(dfrData.body) as Map<String, dynamic>;

    print(wetData);

    setState(() {
      _details = wetData;
      aqiData = aqiDoc;
      hourlyForecastData = hForecastDocs;
      dailyForecastData = dForecastDocs;
      _aqi = aqiDoc['list'][0]['main']['aqi'].toString();
      srt = new DateTime.fromMillisecondsSinceEpoch(
        hourlyForecastData['current']['sunrise'] * 1000,
        isUtc: false,
      );
      sst = new DateTime.fromMillisecondsSinceEpoch(
        hourlyForecastData['current']['sunset'] * 1000,
        isUtc: false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _details.isEmpty
          ? SplashItem()
          : RefreshIndicator(
              color: Colors.red,
              onRefresh: _getUserCurrentLocationAndWeatherInfo,
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
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.search,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                        SearchLocationPage.routeName);
                                  },
                                ),
                                Text(
                                  _details['name'],
                                  style: TextStyle(fontSize: 22),
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
                                    Container(
                                      padding: EdgeInsets.only(bottom: 65),
                                      child: Text(
                                        'o',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(bottom: 62),
                                      child: Text(
                                        'C',
                                        style: TextStyle(fontSize: 17),
                                      ),
                                    ),
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
                          WeatherForecastPanel(
                            dailyForecastData,
                          ),
                          // BoxedIcon(
                          //   WeatherIcons.fromString('wi-hail',
                          //       fallback: WeatherIcons.na),
                          // ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                    FiveDaysForecastPage.routeName,
                                    arguments: dailyForecastData,
                                  );
                                },
                                child: Text(
                                  '7-day forecast',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          HourlyForecastPanel(hourlyForecastData),
                          SizedBox(
                            height: 30,
                          ),

                          // SunriseSunsetWidget(),
                          WeatherDetails(
                            sunrise: srt.toString().substring(11, 16),
                            sunset: sst.toString().substring(11, 16),
                            temperature: (_details['main']['feels_like'])
                                .toStringAsFixed(0),
                            humidity: (_details['main']['humidity'])
                                .toStringAsFixed(0),
                            chanceOfRain: _details['clouds']['all'].toString(),
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
