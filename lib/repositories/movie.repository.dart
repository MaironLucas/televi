import 'dart:async';
import 'dart:convert';

import 'package:tokenlab/core/api.settings.dart';
import 'package:tokenlab/model/movie.model.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  Future<List<Movie>> fetchAll() async {
    final response =
        await http.get(Uri.parse(baseUrl)).timeout(const Duration(seconds: 7));
    final decoded = jsonDecode(response.body).cast<Map<String, dynamic>>();
    List<Movie> result = decoded.map<Movie>((x) => Movie.fromJson(x)).toList();
    return result;
  }
}
