import 'package:domain/entities/movie_detail.dart';
import 'package:televi/core/exceptions.dart';

abstract class MovieDetailState {}

class MovieDetailSuccess implements MovieDetailState {
  MovieDetailSuccess(this.movie);

  final MovieDetail movie;
}

class MovieDetailLoading implements MovieDetailState {}

class MovieDetailError implements MovieDetailState, GenericError {
  MovieDetailError(this.errorType);

  @override
  final MyErrorType errorType;
}
