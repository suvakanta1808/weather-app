import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_dotenv/flutter_dotenv.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:weather_app/pages/city_weather_details_page.dart';

class SearchLocationPage extends StatefulWidget {
  static const routeName = 'search-location';

  @override
  _SearchLocationPageState createState() => _SearchLocationPageState();
}

class _SearchLocationPageState extends State<SearchLocationPage> {
  var API_KEY = env['WEATHER_API_KEY'];

  GlobalKey<AutoCompleteTextFieldState<String>> _key = new GlobalKey();
  TextEditingController _controller = TextEditingController();
  Map<String, dynamic> weatherData = {};
  String placeToBeSearched = '';

  Future<void> fetchWeatherDetailsForEnteredCity(String cityName) async {
    print(env['WEATHER_API_KEY']);
    final url = Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=$API_KEY');
    final response = await http.get(url);
    final wData = json.decode(response.body) as Map<String, dynamic>;

    setState(() {
      weatherData = wData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 30,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Search for popular cities',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Enter city name e.g Mumbai,Delhi,etc.',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 5,
                color: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Enter the name of any city in the world and hit the search button.Wait for result.',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          RaisedButton(
            color: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            onPressed: () {
              fetchWeatherDetailsForEnteredCity(_controller.text).then((_) {
                Navigator.of(context).pushNamed(
                    CityWeatherDetailsPage.routeName,
                    arguments: weatherData);
              });
            },
            child: Text('Search'),
          ),
        ],
      ),
    );
  }
}
