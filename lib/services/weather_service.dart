import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:weather_app/models/weather.dart';

class WeatherService {
  Future<List<Weather>> getWeatherList() async {
    try {
      // Load local JSON from assets
      final String jsonString =
      await rootBundle.loadString('assets/data/weather.json');

      // Decode JSON
      final Map<String, dynamic> decodedJson =
      jsonDecode(jsonString);

      // Extract weather list
      final List weatherList = decodedJson['weatherData'];

      // Convert JSON map to Weather model
      return weatherList
          .map<Weather>((item) => Weather.fromJson(item))
          .toList();
    } catch (e) {
      throw Exception('Failed to load weather data');
    }
  }
}
