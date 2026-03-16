class Movie {
  Movie({
    required this.title,
    required this.year,
    required this.imdbID,
    required this.type,
    required this.poster,
  });

  final String title;
  final String year;
  final String imdbID;
  final String type;
  final String poster;

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'] ?? 'No Title',
      year: json['Year'] ?? '',
      imdbID: json['imdbID'] ?? '',
      type: json['Type'] ?? '',
      poster: (json['Poster'] != null && json['Poster'] != 'N/A')
          ? json['Poster']
          : 'https://via.placeholder.com/500x750?text=No+Image',
    );
  }
}
