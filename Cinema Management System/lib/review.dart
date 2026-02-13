class Review {
  Review({required this.movieId, required this.comment, required this.score});

  final int movieId;
  final String comment;
  final int score;

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      movieId: json['movieId'] as int,
      comment: json['comment'] as String,
      score: json['score'] as int,
    );
  }
}
