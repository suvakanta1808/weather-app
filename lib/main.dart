import 'package:flutter/material.dart';
import 'package:weather_app/pages/aqi_details_page.dart';
import 'package:weather_app/pages/home_page.dart';

void main() {
  runApp(MyApp());
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
      },
    );
  }
}
