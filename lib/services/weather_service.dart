import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:weather_app/models/weather.dart';



class WeatherService {

  Future<List<Weather>> getWeatherList() async {
    final String jsonString =
    await rootBundle.loadString('assets/data/weather.json');

    final Map<String, dynamic> decodedJson =
    jsonDecode(jsonString);

    final List weatherList = decodedJson['weatherData'];

    return weatherList
        .map((item) => Weather.fromJson(item))
        .toList();
  }
}
