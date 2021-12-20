import 'dart:convert';

Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));

class Movie {
    int id;
    double voteAverage;
    String title;
    String posterUrl;
    List<String> genres;
    DateTime releaseDate;

    Movie({
        required this.id,
        required this.voteAverage,
        required this.title,
        required this.posterUrl,
        required this.genres,
        required this.releaseDate,
    });

    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["id"],
        voteAverage: json["vote_average"].toDouble(),
        title: json["title"],
        posterUrl: json["poster_url"],
        genres: List<String>.from(json["genres"].map((x) => x)),
        releaseDate: DateTime.parse(json["release_date"]),
    );
}