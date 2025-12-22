import 'package:flutter/material.dart';
import 'package:weather_app/Widgets/location_part.dart';
import 'package:weather_app/Widgets/search_bar_widget.dart';
import 'package:weather_app/Widgets/time_uv_rain_aq.dart';
import 'package:weather_app/Widgets/top_indicator.dart';
import 'package:weather_app/Widgets/sunset_sunrise.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text("Weather App")),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20,),
            SearchBarWidget(),
            SizedBox(height: 20),
            TopIndicator(),
            SizedBox(height: 20),
            LocationPart(cityName: "Cumilla"),
            SizedBox(height: 20),
            TimeUvRainAq(time: "21:00PM", uv: "4", rain: "58%", aq: "22"),
            SizedBox(height: 20,),
            SunsetSunrise(sunrise: "5:00 AM", sunset: "9:00 pm",day_length: "13H 12M",),
          ],
        ),
      ),
    );
  }
}
