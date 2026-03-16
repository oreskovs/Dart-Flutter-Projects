import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MovieApiService {
  final String apiKey = dotenv.env['OMDB_API_KEY'] ?? '';
  final String baseUrl = 'https://www.omdbapi.com/';

  Future<List<Movie>> searchMovies(String query) async {
    final url = Uri.parse('$baseUrl?s=$query&apikey=$apiKey');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);

        if (data['Response'] == 'True') {
          final List results = data['Search'];
          return results.map((json) => Movie.fromJson(json)).toList();
        } else {
          return [];
        }
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (err) {
      throw Exception('Some error occured: $err');
    }
  }

  Future<Map<String, dynamic>> fetchMovieDetails(String imdbID) async {
    final url = Uri.parse('$baseUrl?i=$imdbID&plot=full&apikey=$apiKey');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load details');
      }
    } catch (e) {
      throw Exception('Some error occured: $e');
    }
  }
}
