import 'package:hive/hive.dart';
import 'package:televi/data/cache/models/movie_cm.dart';
import 'package:televi/data/cache/models/movie_detail_cm.dart';

class MovieCds {
  Future<bool> isBoxEmpty() async =>
      Hive.openBox('movie-list').then((box) => box.isEmpty);

  Future<bool> isMovieOnCache(int movieId) async =>
      Hive.openBox('movie-detail').then(
        (box) => box.containsKey(movieId),
      );

  Future<List<MovieCm>> fetchMovieList() async => Hive.openBox('movie-list')
      .then((box) => List<MovieCm>.from(box.getAt(0)));

  Future<void> insertMovieList(List<MovieCm> movieList) async =>
      Hive.openBox('movie-list').then((box) => box.putAll({0: movieList}));

  Future<MovieDetailCm> fetchMovieDetails(int id) async =>
      Hive.openBox('movie-detail').then((box) => box.get(id));

  Future<void> insertMovieDetail(MovieDetailCm movie) async =>
      Hive.openBox('movie-detail').then((box) => box.put(movie.id, movie));

  Future<bool> isFavorite(int id) async =>
      Hive.openBox('favorites').then((box) {
        if (box.containsKey(id)) {
          return true;
        } else {
          return false;
        }
      });

  Future<List<int>> fetchAllFavorites() async {
    final box = await Hive.openBox('favorites');
    final favoriteList =
        box.values.map((favoriteData) => favoriteData as int).toList();
    await box.close();
    return favoriteList;
  }

  Future<void> removeFromFavorite(int movieId) async =>
      Hive.openBox('favorites').then(
        (box) => box.delete(movieId),
      );

  Future<void> insertFavorite(int movieId) async =>
      Hive.openBox('favorites').then(
        (box) => box.put(movieId, movieId),
      );
}
