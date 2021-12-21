import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tokenlab/core/api.settings.dart';
import 'package:tokenlab/errors/movie.error.dart';
import 'package:tokenlab/model/movie.model.dart';
import 'package:tokenlab/model/movieList.model.dart';
import 'package:http/http.dart' as http;

class MovieRepository{
  final Dio _dio = Dio(dioOptions);
  // Future <Either<MovieError,MovieList>> fetchAll() async{
  //   try{
  //     final response = await _dio.get('');
  //     final model = movieListFromJson(response.data);
  //     return Right(model);
  //   } on DioError catch (e){
  //     if (e.response != null){
  //       return Left(MovieRepositoryError(e.response.data['status-message']));
  //     } else{
  //       return Left(MovieRepositoryError(serverError));
  //     }
  //   } on Exception catch(e){
  //     return Left(MovieRepositoryError(e.toString()));
  //   }
  // }
  Future <List<Movie>> fetchAll() async{
    try{
      //final response = await _dio.get('');
      final response = await http.get("https://desafio-mobile.nyc3.digitaloceanspaces.com/movies");
      final decoded = jsonDecode(response.body).cast<Map<String, dynamic>>();
      List<Movie> result = decoded.map<Movie>((x)=> Movie.fromJson(x)).toList();
      return result;
    } on Exception catch(e){
      throw new Exception(e.toString());
    }
  }
}