import 'weather_warning.dart';

class Weather {
  final String location;
  final String weatherEmoji;
  final String temperature;
  final int uvIndex;
  final String rainPercentage;
  final String airQuality;
  final String sunrise;
  final String sunset;
  final String dayLength;
  final WeatherWarning? warnings;

  Weather({
    required this.location,
    required this.weatherEmoji,
    required this.temperature,
    required this.uvIndex,
    required this.rainPercentage,
    required this.airQuality,
    required this.sunrise,
    required this.sunset,
    required this.dayLength,
    this.warnings,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      location: json['location'],
      weatherEmoji: json['weather_emoji'],
      temperature: json['temperature'],
      uvIndex: json['uv_index'],
      rainPercentage: json['rain_percentage'],
      airQuality: json['air_quality'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      dayLength: json['day_length'],
      warnings: json['warnings'] != null
          ? WeatherWarning.fromJson(json['warnings'])
          : null,
    );
  }
}
