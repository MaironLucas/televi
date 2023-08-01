import 'package:dio/dio.dart';
import 'package:domain/use_cases/add_on_favorites_uc.dart';
import 'package:domain/use_cases/get_favorite_list_uc.dart';
import 'package:domain/use_cases/get_is_favorite.dart';
import 'package:domain/use_cases/get_movie_detail_uc.dart';
import 'package:domain/use_cases/get_movie_list_uc.dart';
import 'package:domain/use_cases/remove_from_favorites_uc.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:televi/data/cache/data_source/movie_cds.dart';
import 'package:televi/data/remote/data_source/movie_rds.dart';
import 'package:televi/data/remote/infrastructure/my_dio.dart';
import 'package:televi/data/repository/movie_repository.dart';

List<SingleChildWidget> globalProviders = [
  ..._googleServices,
  ..._dioProviders,
  ...independentServices,
  ...dependentServices,
];

List<SingleChildWidget> independentServices = [
  Provider.value(value: MovieCds()),
];

List<SingleChildWidget> dependentServices = [
  ..._remoteDataSourceProvider,
  ..._repositoryProviders,
  ..._useCaseProviders,
];

List<SingleChildWidget> _googleServices = [
  Provider<FirebaseAnalytics>(
    create: (_) => FirebaseAnalytics.instance,
  ),
];

List<SingleChildWidget> _dioProviders = [
  Provider<Dio>(
    create: (_) {
      final options = BaseOptions(
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 5000),
      );
      return MyDio(options);
    },
  ),
];

List<SingleChildWidget> _remoteDataSourceProvider = [
  ProxyProvider<Dio, MovieRds>(
    update: (_, dio, __) => MovieRds(
      dio: dio,
    ),
  ),
];

List<SingleChildWidget> _repositoryProviders = [
  ProxyProvider2<MovieCds, MovieRds, MovieRepository>(
    update: (_, cacheDataSource, remoteDataSource, __) => MovieRepository(
      cacheDataSource: cacheDataSource,
      remoteDataSource: remoteDataSource,
    ),
  )
];

List<SingleChildWidget> _useCaseProviders = [
  ProxyProvider<MovieRepository, AddOnFavoritesUc>(
    update: (_, movieRepository, __) =>
        AddOnFavoritesUc(repository: movieRepository),
  ),
  ProxyProvider<MovieRepository, GetFavoriteListUc>(
    update: (_, movieRepository, __) =>
        GetFavoriteListUc(repository: movieRepository),
  ),
  ProxyProvider<MovieRepository, GetIsFavoriteUc>(
    update: (_, movieRepository, __) =>
        GetIsFavoriteUc(repository: movieRepository),
  ),
  ProxyProvider<MovieRepository, GetMovieDetailUc>(
    update: (_, movieRepository, __) =>
        GetMovieDetailUc(repository: movieRepository),
  ),
  ProxyProvider<MovieRepository, GetMovieListUc>(
    update: (_, movieRepository, __) =>
        GetMovieListUc(repository: movieRepository),
  ),
  ProxyProvider<MovieRepository, RemoveFromFavoritesUc>(
    update: (_, movieRepository, __) =>
        RemoveFromFavoritesUc(repository: movieRepository),
  ),
];
