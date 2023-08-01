import 'package:domain/entities/movie.dart';
import 'package:televi/core/exceptions.dart';

abstract class FavoritesViewState {}

class FavoritesViewLoading implements FavoritesViewState {}

class FavoritesViewSuccess implements FavoritesViewState {
  FavoritesViewSuccess(this.favoritesMovies);
  final List<Movie> favoritesMovies;
}

class FavoritesViewError implements FavoritesViewState, GenericError {
  FavoritesViewError(this.errorType);

  @override
  final MyErrorType errorType;
}
