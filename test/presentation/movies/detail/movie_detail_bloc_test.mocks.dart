

import 'dart:async' as _i5;

import 'package:domain/data_repositories/movie_data_repository.dart' as _i2;
import 'package:domain/entities/movie_detail.dart' as _i3;
import 'package:domain/use_cases/add_on_favorites_uc.dart' as _i7;
import 'package:domain/use_cases/get_is_favorite.dart' as _i6;
import 'package:domain/use_cases/get_movie_detail_uc.dart' as _i4;
import 'package:domain/use_cases/remove_from_favorites_uc.dart' as _i8;
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

class _FakeMovieDataRepository_0 extends _i1.Fake
    implements _i2.MovieDataRepository {}

class _FakeMovieDetail_1 extends _i1.Fake implements _i3.MovieDetail {}

/// A class which mocks [GetMovieDetailUc].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetMovieDetailUc extends _i1.Mock implements _i4.GetMovieDetailUc {
  MockGetMovieDetailUc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.MovieDataRepository get repository => (super.noSuchMethod(
      Invocation.getter(#repository),
      returnValue: _FakeMovieDataRepository_0()) as _i2.MovieDataRepository);
  @override
  _i5.Future<_i3.MovieDetail> getRawFuture(
          {_i4.GetMovieDetailUcParams? params}) =>
      (super.noSuchMethod(
              Invocation.method(#getRawFuture, [], {#params: params}),
              returnValue: Future<_i3.MovieDetail>.value(_FakeMovieDetail_1()))
          as _i5.Future<_i3.MovieDetail>);
  @override
  _i5.Future<_i3.MovieDetail> getFuture({_i4.GetMovieDetailUcParams? params}) =>
      (super.noSuchMethod(Invocation.method(#getFuture, [], {#params: params}),
              returnValue: Future<_i3.MovieDetail>.value(_FakeMovieDetail_1()))
          as _i5.Future<_i3.MovieDetail>);
}

/// A class which mocks [GetIsFavoriteUc].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetIsFavoriteUc extends _i1.Mock implements _i6.GetIsFavoriteUc {
  MockGetIsFavoriteUc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.MovieDataRepository get repository => (super.noSuchMethod(
      Invocation.getter(#repository),
      returnValue: _FakeMovieDataRepository_0()) as _i2.MovieDataRepository);
  @override
  _i5.Future<bool> getRawFuture({_i6.GetIsFavoriteUcParams? params}) => (super
      .noSuchMethod(Invocation.method(#getRawFuture, [], {#params: params}),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  _i5.Future<bool> getFuture({_i6.GetIsFavoriteUcParams? params}) =>
      (super.noSuchMethod(Invocation.method(#getFuture, [], {#params: params}),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
}

/// A class which mocks [AddOnFavoritesUc].
///
/// See the documentation for Mockito's code generation for more information.
class MockAddOnFavoritesUc extends _i1.Mock implements _i7.AddOnFavoritesUc {
  MockAddOnFavoritesUc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.MovieDataRepository get repository => (super.noSuchMethod(
      Invocation.getter(#repository),
      returnValue: _FakeMovieDataRepository_0()) as _i2.MovieDataRepository);
  @override
  _i5.Future<void> getRawFuture({_i7.AddOnFavoritesUcParams? params}) => (super
      .noSuchMethod(Invocation.method(#getRawFuture, [], {#params: params}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> getFuture({_i7.AddOnFavoritesUcParams? params}) =>
      (super.noSuchMethod(Invocation.method(#getFuture, [], {#params: params}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
}

/// A class which mocks [RemoveFromFavoritesUc].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoveFromFavoritesUc extends _i1.Mock
    implements _i8.RemoveFromFavoritesUc {
  MockRemoveFromFavoritesUc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.MovieDataRepository get repository => (super.noSuchMethod(
      Invocation.getter(#repository),
      returnValue: _FakeMovieDataRepository_0()) as _i2.MovieDataRepository);
  @override
  _i5.Future<void> getRawFuture({_i8.RemoveFromFavoritesUcParams? params}) =>
      (super.noSuchMethod(
          Invocation.method(#getRawFuture, [], {#params: params}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> getFuture({_i8.RemoveFromFavoritesUcParams? params}) =>
      (super.noSuchMethod(Invocation.method(#getFuture, [], {#params: params}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
}
