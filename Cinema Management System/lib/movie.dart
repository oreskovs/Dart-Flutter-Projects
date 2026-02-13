import 'package:dart_practice/cast.dart';

class Movie {
  Movie({
    required this.id,
    required this.title,
    required this.genre,
    required this.rating,
    required this.isAvailable,
    required this.cast,
  });

  final int id;
  final String title;
  final String genre;
  final double rating;
  final bool isAvailable;
  final List<Cast> cast;

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as int,
      title: json['title'] as String,
      genre: json['genre'] as String,
      rating: (json['rating'] as num).toDouble(),
      isAvailable: json['isAvailable'] as bool,
      cast: (json['cast'] as List).map((c) => Cast.fromJson(c)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "genre": genre,
      "rating": rating,
      "isAvailable": isAvailable,
      "cast": cast.map((c) => c.toJson()).toList(),
    };
  }
}
