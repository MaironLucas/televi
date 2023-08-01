
import 'dart:async' as _i4;

import 'package:domain/use_cases/get_movie_list_uc.dart' as _i2;
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

class _FakeGetMovieListUc_0 extends _i1.Fake implements _i2.GetMovieListUc {}

class _FakeSink_1<T> extends _i1.Fake implements Sink<T> {}

/// A class which mocks [MoviesBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockMoviesBloc extends _i1.Mock implements _i3.MoviesBloc {
  MockMoviesBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetMovieListUc get getMovieListUc =>
      (super.noSuchMethod(Invocation.getter(#getMovieListUc),
          returnValue: _FakeGetMovieListUc_0()) as _i2.GetMovieListUc);
  @override
  Sink<dynamic> get onTryAgain =>
      (super.noSuchMethod(Invocation.getter(#onTryAgain),
          returnValue: _FakeSink_1<dynamic>()) as Sink<dynamic>);
  @override
  _i4.Stream<_i5.MoviesState> get onNewState =>
      (super.noSuchMethod(Invocation.getter(#onNewState),
              returnValue: Stream<_i5.MoviesState>.empty())
          as _i4.Stream<_i5.MoviesState>);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
}
