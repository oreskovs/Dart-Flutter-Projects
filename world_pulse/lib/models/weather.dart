class Weather {
  const Weather({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.icon,
  });

  final String cityName;
  final double temperature;
  final String description;
  final String icon;

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'] ?? '',
      temperature: (json['main']['temp'] as num).toDouble(),
      description: json['weather'][0]['description'] as String,
      icon: json['weather'][0]['icon'] as String,
    );
  }
}
