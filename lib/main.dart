import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

import 'package:weather_app/pages/aqi_details_page.dart';
import 'package:weather_app/pages/city_weather_details_page.dart';
import 'package:weather_app/pages/five_days_forecast_page.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/pages/search_location_page.dart';

Future main() async {
  await DotEnv.load(fileName: ".env");
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue.shade200,
        textTheme: TextTheme(
          body1: TextStyle(
            color: Colors.white,
          ),
          title: TextStyle(
            color: Colors.white,
          ),
        ),
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.blue.shade400,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      home: HomePage(),
      routes: {
        AqiDetailsPage.routeName: (ctx) => AqiDetailsPage(),
        SearchLocationPage.routeName: (ctx) => SearchLocationPage(),
        CityWeatherDetailsPage.routeName: (ctx) => CityWeatherDetailsPage(),
        FiveDaysForecastPage.routeName: (ctx) => FiveDaysForecastPage(),
      },
    );
  }
}
