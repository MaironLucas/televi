import 'package:domain/data_repositories/movie_data_repository.dart';
import 'package:domain/entities/movie.dart';
import 'package:domain/entities/movie_detail.dart';
import 'package:televi/core/exceptions.dart';
import 'package:televi/data/cache/data_source/movie_cds.dart';
import 'package:televi/data/cache/models/movie_cm.dart';
import 'package:televi/data/cache/models/movie_detail_cm.dart';
import 'package:televi/data/remote/data_source/movie_rds.dart';

class MovieRepository extends MovieDataRepository {
  MovieRepository({
    required this.remoteDataSource,
    required this.cacheDataSource,
  });

  final MovieRds remoteDataSource;
  final MovieCds cacheDataSource;

  @override
  Future<MovieDetail> fetchMovieDetails(int id) async {
    final isOnCache = await cacheDataSource.isMovieOnCache(id);
    if (!isOnCache) {
      final result = await remoteDataSource.fetchMovie(id);
      final movieDetailCm = MovieDetailCm.fromRemoteModel(result);
      await cacheDataSource.insertMovieDetail(
        movieDetailCm,
      );
      return movieDetailCm.toEntity();
    } else {
      final cacheResult = await cacheDataSource.fetchMovieDetails(id);
      return cacheResult.toEntity();
    }
  }

  @override
  Future<List<Movie>> fetchMovieList() async {
    var movieCmList = <MovieCm>[];
    final isEmpty = await cacheDataSource.isBoxEmpty();
    if (isEmpty) {
      final remoteMovieList = await remoteDataSource.fetchAll();
      remoteMovieList
          .map(
            (remoteMovie) =>
                movieCmList.add(MovieCm.fromRemoteModel(remoteMovie)),
          )
          .toList();
      await cacheDataSource.insertMovieList(movieCmList);
    } else {
      movieCmList = await cacheDataSource.fetchMovieList();
    }
    return movieCmList
        .map(
          (movieCm) => movieCm.toEntity(),
        )
        .toList();
  }

  @override
  Future<void> saveOnFavorites(int movieId) async {
    try {
      await cacheDataSource.insertFavorite(movieId);
    } catch (_) {
      throw FavoriteException(FavoriteErrorType.snackbarFavoriteChangeError);
    }
  }

  @override
  Future<void> removeFromFavorites(int movieId) async {
    try {
      await cacheDataSource.removeFromFavorite(movieId);
    } catch (_) {
      throw FavoriteException(FavoriteErrorType.snackbarFavoriteChangeError);
    }
  }

  @override
  Future<bool> checkIsFavorite(int id) async {
    try {
      return cacheDataSource.isFavorite(id);
    } catch (_) {
      throw FavoriteException(FavoriteErrorType.snackbarFavoriteFetchError);
    }
  }

  @override
  Future<List<Movie>> fetchAllFavorites() async {
    try {
      final favoriteIdListData = await cacheDataSource.fetchAllFavorites();
      final favoriteIdList = favoriteIdListData.whereType<int>().toList();
      if (favoriteIdList.isEmpty) {
        return <Movie>[];
      } else {
        final movieList = await cacheDataSource.fetchMovieList();
        final favoriteMovieList = movieList.map((movie) {
          if (favoriteIdList.contains(movie.id)) {
            return movie.toEntity();
          }
        }).toList();
        return favoriteMovieList.whereType<Movie>().toList();
      }
    } catch (e) {
      throw MyException(MyErrorType.responseError);
    }
  }
}
