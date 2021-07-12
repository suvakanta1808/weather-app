import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:weather_icons/weather_icons.dart';

class WeatherHelper {
  IconData selectWeatherIcon(String weatherCondition) {
    if (weatherCondition == 'Clear') {
      return WeatherIcons.day_sunny;
    } else if (weatherCondition == 'Clouds') {
      return WeatherIcons.cloudy;
    } else if (weatherCondition == 'Rain') {
      return WeatherIcons.rain;
    } else if (weatherCondition == 'Drizzle') {
      return WeatherIcons.raindrops;
    } else if (weatherCondition == 'Snow') {
      return WeatherIcons.snow;
    } else if (weatherCondition == 'Thunderstorm') {
      return WeatherIcons.thunderstorm;
    } else if (weatherCondition == 'Smoke') {
      return WeatherIcons.smoke;
    } else if (weatherCondition == 'Haze') {
      return WeatherIcons.day_haze;
    } else if (weatherCondition == 'Dust') {
      return WeatherIcons.dust;
    } else if (weatherCondition == 'Fog') {
      return WeatherIcons.fog;
    } else if (weatherCondition == 'Sand') {
      return WeatherIcons.sandstorm;
    } else if (weatherCondition == 'Tornado') {
      return WeatherIcons.tornado;
    } else {
      return WeatherIcons.raindrop;
    }
  }

  String weekDay(int n) {
    if (n == 1) {
      return 'Monday';
    } else if (n == 2) {
      return 'Tuesday';
    } else if (n == 3) {
      return 'Wednessday';
    } else if (n == 4) {
      return 'Thursday';
    } else if (n == 5) {
      return 'Friday';
    } else if (n == 6) {
      return 'Saturday';
    } else {
      return 'Sunday';
    }
  }
}
