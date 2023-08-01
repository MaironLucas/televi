import 'package:domain/entities/movie_detail.dart';
import 'package:hive/hive.dart';
import 'package:televi/data/remote/models/movie_detail_rm.dart';

part 'movie_detail_cm.g.dart';

@HiveType(typeId: 1)
class MovieDetailCm {
  MovieDetailCm({
    required this.backdropUrl,
    required this.genres,
    required this.id,
    required this.overview,
    required this.posterUrl,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
  });

  factory MovieDetailCm.fromRemoteModel(MovieDetailRm movieDetail) =>
      MovieDetailCm(
        id: movieDetail.id,
        posterUrl: movieDetail.posterUrl,
        title: movieDetail.title,
        genres: movieDetail.genres,
        releaseDate: movieDetail.releaseDate,
        voteAverage: movieDetail.voteAverage,
        overview: movieDetail.overview,
        backdropUrl: movieDetail.backdropUrl,
      );

  factory MovieDetailCm.fromEntity(MovieDetail movieDetail) => MovieDetailCm(
        id: movieDetail.id,
        posterUrl: movieDetail.posterUrl,
        title: movieDetail.title,
        genres: movieDetail.genres,
        releaseDate: movieDetail.releaseDate,
        voteAverage: movieDetail.voteAverage,
        overview: movieDetail.overview,
        backdropUrl: movieDetail.backdropUrl,
      );

  MovieDetail toEntity() => MovieDetail(
        id: id,
        posterUrl: posterUrl,
        title: title,
        genres: genres,
        releaseDate: releaseDate,
        voteAverage: voteAverage,
        overview: overview,
        backdropUrl: backdropUrl,
      );

  @HiveField(0)
  String backdropUrl;

  @HiveField(1)
  List<String> genres;

  @HiveField(2)
  int id;

  @HiveField(3)
  String overview;

  @HiveField(4)
  String posterUrl;

  @HiveField(5)
  DateTime releaseDate;

  @HiveField(6)
  String title;

  @HiveField(7)
  double voteAverage;
}
