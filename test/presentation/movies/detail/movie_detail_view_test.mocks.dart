
import 'dart:async' as _i7;

import 'package:domain/use_cases/add_on_favorites_uc.dart' as _i4;
import 'package:domain/use_cases/get_is_favorite.dart' as _i3;
import 'package:domain/use_cases/get_movie_detail_uc.dart' as _i2;
import 'package:domain/use_cases/remove_from_favorites_uc.dart' as _i5;
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

class _FakeGetMovieDetailUc_0 extends _i1.Fake implements _i2.GetMovieDetailUc {
}

class _FakeGetIsFavoriteUc_1 extends _i1.Fake implements _i3.GetIsFavoriteUc {}

class _FakeAddOnFavoritesUc_2 extends _i1.Fake implements _i4.AddOnFavoritesUc {
}

class _FakeRemoveFromFavoritesUc_3 extends _i1.Fake
    implements _i5.RemoveFromFavoritesUc {}

class _FakeSink_4<T> extends _i1.Fake implements Sink<T> {}

/// A class which mocks [DetailBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockDetailBloc extends _i1.Mock implements _i6.DetailBloc {
  MockDetailBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetMovieDetailUc get getMovieDetailUc =>
      (super.noSuchMethod(Invocation.getter(#getMovieDetailUc),
          returnValue: _FakeGetMovieDetailUc_0()) as _i2.GetMovieDetailUc);
  @override
  _i3.GetIsFavoriteUc get getIsFavoriteUc =>
      (super.noSuchMethod(Invocation.getter(#getIsFavoriteUc),
          returnValue: _FakeGetIsFavoriteUc_1()) as _i3.GetIsFavoriteUc);
  @override
  _i4.AddOnFavoritesUc get addOnFavoritesUc =>
      (super.noSuchMethod(Invocation.getter(#addOnFavoritesUc),
          returnValue: _FakeAddOnFavoritesUc_2()) as _i4.AddOnFavoritesUc);
  @override
  _i5.RemoveFromFavoritesUc get removeFromFavoritesUc =>
      (super.noSuchMethod(Invocation.getter(#removeFromFavoritesUc),
              returnValue: _FakeRemoveFromFavoritesUc_3())
          as _i5.RemoveFromFavoritesUc);
  @override
  Sink<dynamic> get onTryAgain =>
      (super.noSuchMethod(Invocation.getter(#onTryAgain),
          returnValue: _FakeSink_4<dynamic>()) as Sink<dynamic>);
  @override
  _i7.Stream<_i8.MovieDetailState> get onNewState =>
      (super.noSuchMethod(Invocation.getter(#onNewState),
              returnValue: Stream<_i8.MovieDetailState>.empty())
          as _i7.Stream<_i8.MovieDetailState>);
  @override
  Sink<dynamic> get toggleFavorite =>
      (super.noSuchMethod(Invocation.getter(#toggleFavorite),
          returnValue: _FakeSink_4<dynamic>()) as Sink<dynamic>);
  @override
  _i7.Stream<_i9.FavoriteState> get newFavoriteState =>
      (super.noSuchMethod(Invocation.getter(#newFavoriteState),
              returnValue: Stream<_i9.FavoriteState>.empty())
          as _i7.Stream<_i9.FavoriteState>);
  @override
  Sink<bool> get currentFavoriteInput =>
      (super.noSuchMethod(Invocation.getter(#currentFavoriteInput),
          returnValue: _FakeSink_4<bool>()) as Sink<bool>);
  @override
  Sink<bool> get showSnackbar =>
      (super.noSuchMethod(Invocation.getter(#showSnackbar),
          returnValue: _FakeSink_4<bool>()) as Sink<bool>);
  @override
  _i7.Stream<bool> get shouldShowSnackbar =>
      (super.noSuchMethod(Invocation.getter(#shouldShowSnackbar),
          returnValue: Stream<bool>.empty()) as _i7.Stream<bool>);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
}
