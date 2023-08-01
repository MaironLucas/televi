import 'package:dio/dio.dart';
import 'package:televi/core/api_settings.dart';
import 'package:televi/data/remote/models/movie_detail_rm.dart';
import 'package:televi/data/remote/models/movie_rm.dart';

class MovieRds {
  MovieRds({required this.dio});

  final Dio dio;

  Future<MovieDetailRm> fetchMovie(int id) async {
    final responseData = await dio.get('$baseUrl/${id.toString()}');
    final result = MovieDetailRm.fromJson(responseData.data);
    return result;
  }

  Future<List<MovieRm>> fetchAll() async {
    final result = <MovieRm>[];
    final responseData = await dio.get(baseUrl);
    (responseData.data as List<dynamic>).forEach(
      (movieJson) => result.add(MovieRm.fromJson(movieJson)),
    );
    return result;
  }
}
