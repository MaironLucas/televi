import 'dart:async';
import 'dart:io';

import 'package:tokenlab/model/movieDetail.model.dart';
import 'package:tokenlab/repositories/movieDetail.repository.dart';

class DetailController {
  final _repository = MovieDetailRepository();
  late MovieDetail movie;
  late String movieError;
  bool loading = true;

  Future fetchMovie(int id) async {
    movieError = '';
    try {
      final result = await _repository.fetchMovie(id);
      movie = result;
    } on TimeoutException catch (e) {
      movieError = 'Server is not responding!';
    } on SocketException catch (e) {
      movieError = e.message;
    }
  }
}
