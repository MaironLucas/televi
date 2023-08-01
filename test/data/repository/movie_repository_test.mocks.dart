

import 'dart:async' as _i6;

import 'package:dio/dio.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeMovieDetailCm_0 extends _i1.Fake implements _i2.MovieDetailCm {}

class _FakeDio_1 extends _i1.Fake implements _i3.Dio {}

class _FakeMovieDetailRm_2 extends _i1.Fake implements _i4.MovieDetailRm {}

/// A class which mocks [MovieCds].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieCds extends _i1.Mock implements _i5.MovieCds {
  MockMovieCds() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<bool> isBoxEmpty() =>
      (super.noSuchMethod(Invocation.method(#isBoxEmpty, []),
          returnValue: Future<bool>.value(false)) as _i6.Future<bool>);
  @override
  _i6.Future<bool> isMovieOnCache(int? movieId) =>
      (super.noSuchMethod(Invocation.method(#isMovieOnCache, [movieId]),
          returnValue: Future<bool>.value(false)) as _i6.Future<bool>);
  @override
  _i6.Future<List<_i7.MovieCm>> fetchMovieList() =>
      (super.noSuchMethod(Invocation.method(#fetchMovieList, []),
              returnValue: Future<List<_i7.MovieCm>>.value(<_i7.MovieCm>[]))
          as _i6.Future<List<_i7.MovieCm>>);
  @override
  _i6.Future<void> insertMovieList(List<_i7.MovieCm>? movieList) =>
      (super.noSuchMethod(Invocation.method(#insertMovieList, [movieList]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<_i2.MovieDetailCm> fetchMovieDetails(int? id) =>
      (super.noSuchMethod(Invocation.method(#fetchMovieDetails, [id]),
              returnValue:
                  Future<_i2.MovieDetailCm>.value(_FakeMovieDetailCm_0()))
          as _i6.Future<_i2.MovieDetailCm>);
  @override
  _i6.Future<void> insertMovieDetail(_i2.MovieDetailCm? movie) =>
      (super.noSuchMethod(Invocation.method(#insertMovieDetail, [movie]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<bool> isFavorite(int? id) =>
      (super.noSuchMethod(Invocation.method(#isFavorite, [id]),
          returnValue: Future<bool>.value(false)) as _i6.Future<bool>);
  @override
  _i6.Future<List<int>> fetchAllFavorites() => (super.noSuchMethod(
      Invocation.method(#fetchAllFavorites, []),
      returnValue: Future<List<int>>.value(<int>[])) as _i6.Future<List<int>>);
  @override
  _i6.Future<void> removeFromFavorite(int? movieId) =>
      (super.noSuchMethod(Invocation.method(#removeFromFavorite, [movieId]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> insertFavorite(int? movieId) =>
      (super.noSuchMethod(Invocation.method(#insertFavorite, [movieId]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
}

/// A class which mocks [MovieRds].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRds extends _i1.Mock implements _i8.MovieRds {
  MockMovieRds() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Dio get dio =>
      (super.noSuchMethod(Invocation.getter(#dio), returnValue: _FakeDio_1())
          as _i3.Dio);
  @override
  _i6.Future<_i4.MovieDetailRm> fetchMovie(int? id) => (super.noSuchMethod(
          Invocation.method(#fetchMovie, [id]),
          returnValue: Future<_i4.MovieDetailRm>.value(_FakeMovieDetailRm_2()))
      as _i6.Future<_i4.MovieDetailRm>);
  @override
  _i6.Future<List<_i9.MovieRm>> fetchAll() =>
      (super.noSuchMethod(Invocation.method(#fetchAll, []),
              returnValue: Future<List<_i9.MovieRm>>.value(<_i9.MovieRm>[]))
          as _i6.Future<List<_i9.MovieRm>>);
}
