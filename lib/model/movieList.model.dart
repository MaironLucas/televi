import 'dart:convert';

import 'package:tokenlab/model/Movie.model.dart';

MovieList movieListFromJson(String str) => MovieList.fromJson(json.decode(str));

class MovieList {
    List<Movie> movies;

    MovieList({
        required this.movies,
    });

    factory MovieList.fromJson(Iterable json) => MovieList(
        movies: List<Movie>.from(json.map((x)=> Movie.fromJson(x)))
    );
}