import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:world_pulse/ui/widgets/city_search_field.dart';
import 'package:world_pulse/ui/widgets/loading_overlay.dart';
import 'package:world_pulse/ui/widgets/weather_display.dart';
import '../../providers/weather_provider.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  Color _getBackgroundColor(String condition) {
    condition = condition.toLowerCase();
    if (condition.contains('clear')) return Colors.orangeAccent;
    if (condition.contains('cloud')) return Colors.blueGrey;
    if (condition.contains('rain')) return Colors.indigo;
    if (condition.contains('snow')) return Colors.lightBlue.shade100;
    return Colors.blueAccent;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherAsync = ref.watch(weatherProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'WORLD PULSE',
          style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 2),
        ),
        bottom: CitySearchField(),
      ),
      body: Stack(
        children: [
          Center(
            child: weatherAsync.when(
              data: (weather) {
                final bgColor = _getBackgroundColor(weather.description);
                return WeatherDisplay(weather: weather, bgColor: bgColor);
              },
              error: (error, stack) => Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'We couldn`t find any data. Check the city name.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              ),
              loading: () =>
                  CircularProgressIndicator(color: Colors.blueAccent),
            ),
          ),
          if (weatherAsync.isLoading && weatherAsync.hasValue)
            const LoadingOverlay(),
        ],
      ),
    );
  }
}
