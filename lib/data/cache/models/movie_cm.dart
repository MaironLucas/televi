import 'package:domain/entities/movie.dart';
import 'package:hive/hive.dart';
import 'package:televi/data/remote/models/movie_rm.dart';

part 'movie_cm.g.dart';

@HiveType(typeId: 0)
class MovieCm {
  MovieCm({
    required this.id,
    required this.title,
    required this.posterUrl,
  });

  factory MovieCm.fromRemoteModel(MovieRm movie) => MovieCm(
        id: movie.id,
        title: movie.title,
        posterUrl: movie.posterUrl,
      );

  Movie toEntity() => Movie(id: id, title: title, posterUrl: posterUrl);

  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String posterUrl;
}
