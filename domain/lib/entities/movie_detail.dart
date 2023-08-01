class MovieDetail {
  MovieDetail({
    required this.backdropUrl,
    required this.genres,
    required this.id,
    required this.overview,
    required this.posterUrl,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
  });

  String backdropUrl;

  List<String> genres;

  int id;

  String overview;

  String posterUrl;

  DateTime releaseDate;

  String title;

  double voteAverage;
}
