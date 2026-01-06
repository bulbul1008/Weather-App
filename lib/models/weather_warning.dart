class WeatherWarning {
  final String weatherEmoji;
  final String rainPercentage;
  final String expectedTime;
  final String warningTitle;

  WeatherWarning({
    required this.weatherEmoji,
    required this.rainPercentage,
    required this.expectedTime,
    required this.warningTitle,
  });

  factory WeatherWarning.fromJson(Map<String, dynamic> json) {
    return WeatherWarning(
      weatherEmoji: json['weather_emoji'],
      rainPercentage: json['rain_percentage'],
      expectedTime: json['expected_time'],
      warningTitle: json['warning_title'],
    );
  }
}
