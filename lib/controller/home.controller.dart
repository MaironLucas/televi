import 'dart:async';
import 'dart:io';

import 'package:tokenlab/model/movie.model.dart';
import 'package:tokenlab/repositories/movie.repository.dart';

class HomeController {
  final _repository = MovieRepository();
  late List<Movie> movieList = <Movie>[];
  late String movieError;
  bool loading = true;

  Future fetchAll() async {
    try {
      movieError = '';
      final result = await _repository.fetchAll();
      movieList = result;
    } on TimeoutException catch (e) {
      movieError = "Server is not responding!";
    } on SocketException catch (e2) {
      movieError = e2.message.toString();
    }
  }
}
