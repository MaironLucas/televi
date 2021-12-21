import 'package:dartz/dartz.dart';
import 'package:tokenlab/errors/movie.error.dart';
import 'package:tokenlab/model/movie.model.dart';
import 'package:tokenlab/model/movieList.model.dart';
import 'package:tokenlab/repositories/movie.repository.dart';

class HomeController{
  final _repository = MovieRepository();
  late List<Movie> movieList = <Movie>[];
  late MovieError movieError;
  bool loading = true;

  // Future<Either<MovieError, MovieList>> fetchAll() async{
  //   final result = await _repository.fetchAll();
  //   return result;
  // }

  Future fetchAll() async{
    final result = await _repository.fetchAll();
    movieList = result;
  }
}