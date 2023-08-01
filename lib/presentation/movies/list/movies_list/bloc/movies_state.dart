import 'package:domain/entities/movie.dart';
import 'package:televi/core/exceptions.dart';

abstract class MoviesState {}

class MoviesSuccess implements MoviesState {
  MoviesSuccess(this.movies);

  final List<Movie> movies;
}

class MoviesLoading implements MoviesState {}

class MoviesError implements MoviesState, GenericError {
  MoviesError(this.errorType);

  @override
  final MyErrorType errorType;
}
