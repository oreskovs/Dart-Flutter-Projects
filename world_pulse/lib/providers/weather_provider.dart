import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../api/weather_api_service.dart';
import '../models/weather.dart';

final weatherApiProvider = Provider((ref) => WeatherApiService());
final citySearchProvider = StateProvider<String>((ref) => 'Skopje');

final weatherProvider = FutureProvider<Weather>((ref) async {
  final cityName = ref.watch(citySearchProvider);
  final apiService = ref.watch(weatherApiProvider);
  return apiService.fetchWeather(cityName);
});

final forecastProvider = FutureProvider<List<Weather>>((ref) async {
  final cityName = ref.watch(citySearchProvider);
  final apiService = ref.watch(weatherApiProvider);
  return apiService.fetchForecast(cityName);
});
