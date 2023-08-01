
import 'dart:async' as _i4;

import 'package:domain/data_repositories/movie_data_repository.dart' as _i2;
import 'package:domain/entities/movie.dart' as _i5;
import 'package:domain/use_cases/get_movie_list_uc.dart' as _i3;
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

/// A class which mocks [GetMovieListUc].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetMovieListUc extends _i1.Mock implements _i3.GetMovieListUc {
  MockGetMovieListUc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.MovieDataRepository get repository => (super.noSuchMethod(
      Invocation.getter(#repository),
      returnValue: _FakeMovieDataRepository_0()) as _i2.MovieDataRepository);
  @override
  _i4.Future<List<_i5.Movie>> getRawFuture({void params}) =>
      (super.noSuchMethod(Invocation.method(#getRawFuture, [], {#params: null}),
              returnValue: Future<List<_i5.Movie>>.value(<_i5.Movie>[]))
          as _i4.Future<List<_i5.Movie>>);
  @override
  _i4.Future<List<_i5.Movie>> getFuture({void params}) =>
      (super.noSuchMethod(Invocation.method(#getFuture, [], {#params: null}),
              returnValue: Future<List<_i5.Movie>>.value(<_i5.Movie>[]))
          as _i4.Future<List<_i5.Movie>>);
}
