import 'package:domain/entities/movie.dart';
import 'package:domain/entities/movie_detail.dart';

abstract class MovieDataRepository {
  const MovieDataRepository();

  Future<MovieDetail> fetchMovieDetails(int id);

  Future<List<Movie>> fetchMovieList();

  Future<void> saveOnFavorites(int movieId);

  Future<void> removeFromFavorites(int movieId);

  Future<bool> checkIsFavorite(int id);

  Future<List<Movie>> fetchAllFavorites();
}
