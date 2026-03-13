import 'package:flutter/material.dart';
import 'package:world_pulse/models/weather.dart';

class ForecastItem extends StatelessWidget {
  const ForecastItem({super.key, required this.weather});

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text('Next Day', style: TextStyle(fontSize: 12, color: Colors.white)),
          Image.network(
            'https://openweathermap.org/img/wn/${weather.icon}.png',
            width: 50,
          ),
          Text(
            '${weather.temperature.round()}°C',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
