import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/cubit/weather_state.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherService weatherService;

  WeatherCubit(this.weatherService) : super(WeatherInitial());

  Future<void> getWeather(String city) async {
    emit(WeatherLoading());

    try {
      final List<Weather> weatherList =
      await weatherService.getWeatherList();
      final List<Weather> result = city.isEmpty
          ? weatherList
          : weatherList
          .where((w) =>
      w.location.toLowerCase() ==
          city.toLowerCase())
          .toList();

      if (result.isEmpty) {
        emit(WeatherError("City not found"));
      } else {
        emit(WeatherLoaded(result));
      }
    } catch (e) {
      emit(WeatherError("Error loading weather data"));
    }
  }

}
