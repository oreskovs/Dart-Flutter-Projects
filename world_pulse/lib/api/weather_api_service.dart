import 'dart:convert';

import 'package:world_pulse/models/weather.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherApiService {
  final String apiKey = dotenv.env['OPENWEATHER_API_KEY'] ?? '';

  Future<Weather> fetchWeather(String cityName) async {
    final queryParameters = {
      'q': cityName,
      'appid': apiKey.trim(),
      'units': 'metric',
    };

    final uri = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/weather',
      queryParameters,
    );

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return Weather.fromJson(data);
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(errorData['message'] ?? 'Unknown Error');
      }
    } catch (e) {
      throw Exception('Connection Error: $e');
    }
  }

  Future<List<Weather>> fetchForecast(String cityName) async {
    final url =
        'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=$apiKey&units=metric';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final List list = data['list'];

        return list
            .where((item) => item['dt_txt'].contains("12:00:00"))
            .map((item) => Weather.fromJson(item))
            .toList();
      } else {
        throw Exception('Failed to load forecast');
      }
    } catch (e) {
      throw Exception('Some error occured during data fetching: $e');
    }
  }
}
