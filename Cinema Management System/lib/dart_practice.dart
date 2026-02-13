import 'dart:convert';
import 'package:dart_practice/cast.dart';
import 'package:dart_practice/data.dart';
import 'package:dart_practice/movie.dart';
import 'package:dart_practice/review.dart';
import 'package:http/http.dart' as http;

void main() async {
  List<Movie> movies = await fetchMovies();
  List<dynamic> rawReviews = jsonDecode(reviewsData);
  List<Review> reviews = rawReviews.map((rev) => Review.fromJson(rev)).toList();

  print('\n' + '=' * 50);
  print('📊 MOVIE REPORT AND REVIEWS');
  print('=' * 50);

  for (var movie in movies) {
    print('\n🎬 Title: ${movie.title.toUpperCase()}');
    print('   Genre: ${movie.genre} | Rating: ${movie.rating}');

    var movieReviews = reviews.where((r) => r.movieId == movie.id).toList();

    if (movieReviews.isEmpty) {
      print('   ℹ️ There are no reviews available for this movie..');
    } else {
      print('   💬 Reviews:');
      for (var rev in movieReviews) {
        print('     ⭐ [${rev.score}/10] - ${rev.comment}');
      }

      double sum = movieReviews.fold(0, (prev, curr) => prev + curr.score);
      double average = sum / movieReviews.length;
      print('   📈 Average fan rating: ${average.toStringAsFixed(1)} / 10');
    }
    print('   ' + '-' * 30);
  }

  print('\n' + '*' * 50);
  print('🚀 DATA TRANSMISSION SIMULATION');
  print('*' * 50);

  Movie myMovie = Movie(
    id: 7,
    title: 'Rocky IV',
    genre: 'Action',
    rating: 9.5,
    isAvailable: true,
    cast: [Cast(name: 'Silvester Stallone', role: 'Rocky')],
  );

  await sendMovie(myMovie);
}

Future<List<Movie>> fetchMovies() async {
  print('⏳ Loading movies from database...');
  await Future.delayed(Duration(seconds: 3));

  try {
    List<dynamic> rawData = jsonDecode(data);
    List<Movie> movies = rawData.map((movie) => Movie.fromJson(movie)).toList();
    return movies;
  } catch (e) {
    print('⚠️ Error during fetching: $e');
    return [];
  }
}

Future<void> sendMovie(Movie newMovie) async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

  try {
    // Користиме .toJson() за сигурна серијализација
    final body = jsonEncode(newMovie.toJson());
    final response = await http.post(url, body: body);

    if (response.statusCode == 201) {
      print('✅ Movie sent successfully: ${newMovie.title}');
      print('📡 Response from the server (ID): ${response.body}');
    } else {
      print('❌ The server rejected the order. Status: ${response.statusCode}');
    }
  } catch (e) {
    print('⚠️ Network error: $e');
  }
}
