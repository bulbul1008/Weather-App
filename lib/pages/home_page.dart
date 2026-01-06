import 'package:flutter/material.dart';
import 'package:weather_app/Widgets/location_bar.dart';
import 'package:weather_app/Widgets/location_part.dart';
import 'package:weather_app/Widgets/search_bar_widget.dart';
import 'package:weather_app/Widgets/time_uv_rain_aq.dart';
import 'package:weather_app/Widgets/top_indicator.dart';
import 'package:weather_app/Widgets/sunset_sunrise.dart';
import 'package:weather_app/Widgets/warning_widget.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/weather_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  final ValueNotifier<int> currentPage = ValueNotifier(1);

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.98,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    currentPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Weather App")),
      body: FutureBuilder<List<Weather>>(
        future: WeatherService().getWeatherList(),
        builder: (context, snapshot) {

          final weatherList = snapshot.data!;
          return Column(
            children: [
              const SizedBox(height: 20),
              const SearchBarWidget(),
              const SizedBox(height: 20),

              ValueListenableBuilder<int>(
                valueListenable: currentPage,
                builder: (context, index, _) {
                  return TopIndicator(
                    currentIndex: index % 4,
                    totalPages: 4,
                  );
                },
              ),

              const SizedBox(height: 20),

              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: weatherList.length,
                  onPageChanged: (index) {
                    currentPage.value = index;
                  },
                  itemBuilder: (context, index) {
                    final weather = weatherList[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            LocationPart(location: weather.location),

                            const SizedBox(height: 16),

                            if (weather.warnings != null)
                              WarningWidget(
                                rain: weather.warnings!.rainPercentage,
                                expTime: weather.warnings!.expectedTime,
                                warningTitle:
                                weather.warnings!.warningTitle,
                              ),

                            const SizedBox(height: 16),

                            TimeUvRainAq(
                              time: "Now",
                              uv: weather.uvIndex.toString(),
                              rain: weather.rainPercentage,
                              aq: weather.airQuality,
                            ),

                            const SizedBox(height: 20),

                            SunsetSunrise(
                              sunrise: weather.sunrise,
                              sunset: weather.sunset,
                              day_length: weather.dayLength,
                            ),

                            const SizedBox(height: 20),

                            LocationBar(
                              location: weather.location,
                              temperature: weather.temperature,
                              iconPath: weather.weatherEmoji,
                              warningTitle:
                              weather.warnings?.warningTitle ?? "",
                            ),

                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
