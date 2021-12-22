import 'dart:convert';

import 'package:tokenlab/core/api.settings.dart';
import 'package:tokenlab/model/movieDetail.model.dart';
import 'package:http/http.dart' as http;

class MovieDetailRepository {
  Future<MovieDetail> fetchMovie(int id) async {
    final response = await http.get(Uri.parse(baseUrl + '/' + id.toString()));
    final decoded = jsonDecode(response.body);
    MovieDetail result = MovieDetail.fromJson(decoded);
    return result;
  }
}
