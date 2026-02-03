import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Widgets/location_bar.dart';
import 'package:weather_app/Widgets/location_part.dart';
import 'package:weather_app/Widgets/search_bar_widget.dart';
import 'package:weather_app/Widgets/temparature_widget.dart';
import 'package:weather_app/Widgets/time_uv_rain_aq.dart';
import 'package:weather_app/Widgets/top_indicator.dart';
import 'package:weather_app/Widgets/sunset_sunrise.dart';
import 'package:weather_app/Widgets/warning_widget.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/cubit/weather_state.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/services/weather_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherCubit weatherCubit = WeatherCubit(WeatherService());
  late PageController _pageController;
  final ValueNotifier<int> currentPage = ValueNotifier(0);

  List<Weather> filteredWeather = [];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.98);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      weatherCubit.getWeather("");
    });
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
      body: BlocBuilder<WeatherCubit, WeatherState>(
        bloc: weatherCubit,
        builder: (context, state) {
          if (state is WeatherLoading || state is WeatherInitial) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is WeatherError) {
            return Center(child: Text(state.message));
          }

          if (state is WeatherLoaded) {
            filteredWeather = state.weatherList;

            return Column(
              children: [
                const SizedBox(height: 20),

                SearchBarWidget(
                  onTap: () async {
                    final Weather? selectedWeather = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SearchPage()),
                    );

                    if (selectedWeather != null) {
                      filteredWeather = [selectedWeather];
                      currentPage.value = 0;
                      _pageController.jumpToPage(0);
                      setState(() {});
                    }
                  },
                ),

                const SizedBox(height: 20),

                ValueListenableBuilder<int>(
                  valueListenable: currentPage,
                  builder: (context, index, _) {
                    return TopIndicator(
                      currentIndex: index % filteredWeather.length,
                      totalPages: filteredWeather.length,
                    );
                  },
                ),

                const SizedBox(height: 20),

                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: filteredWeather.length,
                    onPageChanged: (index) {
                      currentPage.value = index;
                    },
                    itemBuilder: (context, index) {
                      final weather = filteredWeather[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              LocationPart(location: weather.location),
                              const SizedBox(height: 16),

                              TemparatureWidget(
                                temparature: weather.temperature,
                              ),
                              const SizedBox(height: 16),

                              if (weather.warnings != null)
                                WarningWidget(
                                  rain: weather.warnings!.rainPercentage,
                                  expTime: weather.warnings!.expectedTime,
                                  warningTitle: weather.warnings!.warningTitle,
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
          }

          return const Center(child: Text("Search for a city"));
        },
      ),
    );
  }
}
