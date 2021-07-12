import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// ignore: import_of_legacy_library_into_null_safe
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:weather_app/models/city_names.dart';
import 'package:weather_app/pages/city_weather_details_page.dart';

class SearchLocationPage extends StatefulWidget {
  static const routeName = 'search-location';

  @override
  _SearchLocationPageState createState() => _SearchLocationPageState();
}

class _SearchLocationPageState extends State<SearchLocationPage> {
  GlobalKey<AutoCompleteTextFieldState<String>> _key = new GlobalKey();
  TextEditingController _controller = TextEditingController();
  Map<String, dynamic> weatherData = {};
  String placeToBeSearched = '';

  Future<void> fetchWeatherDetailsForEnteredCity(String cityName) async {
    final url = Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=4f03aed2d15f16b6a0023fc5d2a7ad57');
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
          AutoCompleteTextField<String>(
            key: _key,
            clearOnSubmit: false,
            controller: _controller,
            suggestions: CityNames().cities,
            style: TextStyle(color: Colors.white, fontSize: 16.0),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.blue.shade200,
              labelText: 'Enter City Name',
              labelStyle: TextStyle(
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 40.0),
              // hintText: "Search Name",
              hintStyle: TextStyle(color: Colors.white),
            ),
            itemFilter: (item, query) {
              return item.toLowerCase().startsWith(query.toLowerCase());
            },
            itemSorter: (a, b) {
              return a.compareTo(b);
            },
            itemSubmitted: (item) {
              setState(() {
                _controller.text = item;
                placeToBeSearched = item;
              });
              print(placeToBeSearched);
            },
            itemBuilder: (context, item) {
              // ui for the autocomplete row
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _controller.text = item;
                  });
                },
                child: Container(
                  color: Colors.grey.shade300,
                  height: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                ),
              );
            },
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
