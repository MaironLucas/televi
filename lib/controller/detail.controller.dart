import 'package:tokenlab/errors/movie.error.dart';
import 'package:tokenlab/model/movieDetail.model.dart';
import 'package:tokenlab/repositories/movieDetail.repository.dart';

class DetailController {
  final _repository = MovieDetailRepository();
  late MovieDetail movie;
  late MovieError movieError;
  bool loading = true;

  Future fetchMovie(int id) async {
    final result = await _repository.fetchMovie(id);
    movie = result;
  }
}
