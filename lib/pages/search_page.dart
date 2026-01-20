import 'package:flutter/material.dart';
import 'package:weather_app/Widgets/location_bar.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  List<Weather> allWeather = [];
  List<Weather> filteredWeather = [];

  @override
  void initState() {
    super.initState();
    _loadWeather();
  }

  void _loadWeather() async {
    final data = await WeatherService().getWeatherList();
    setState(() {
      allWeather = data;
      filteredWeather = [];
    });
  }

  void _filterLocations(String query) {
    if (query.isEmpty) {
      filteredWeather = [];
    } else {
      filteredWeather = allWeather.where((weather) {
        return weather.location.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search local")),
      body: Expanded(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _searchController,
                onChanged: _filterLocations,
                decoration: const InputDecoration(
                  hintText: 'Search location',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
        
            Expanded(
              child: filteredWeather.isEmpty
                  ? const Center(child: Text("Type to search locations"))
                  : ListView.builder(
                      itemCount: filteredWeather.length,
                      itemBuilder: (context, index) {
                        final weather = filteredWeather[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: LocationBar(
                            location: weather.location,
                            temperature: weather.temperature,
                            iconPath: weather.weatherEmoji,
                            warningTitle: weather.warnings?.warningTitle,
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
