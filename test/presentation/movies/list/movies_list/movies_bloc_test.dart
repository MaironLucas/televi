import 'package:domain/use_cases/get_movie_list_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:televi/core/exceptions.dart';
import 'package:televi/presentation/movies/list/movies_list/bloc/movies_bloc.dart';
import 'package:televi/presentation/movies/list/movies_list/bloc/movies_state.dart';

import 'movies_bloc_test.mocks.dart';
import 'movies_view_test_data.dart';

@GenerateMocks([GetMovieListUc])
void main() {
  late MoviesBloc moviesBloc;
  late MockGetMovieListUc mockGetMovieListUc;

  setUpAll(() {
    mockGetMovieListUc = MockGetMovieListUc();
  });

  setUp(() {
    moviesBloc = MoviesBloc(mockGetMovieListUc);
  });

  tearDown(() {
    moviesBloc.dispose();
  });

  test(
    'should return success state when fetch complete without exception',
    () async {
      //Arrange
      when(mockGetMovieListUc.getFuture()).thenAnswer(
        (_) async => mockMovieList,
      );

      //Assert
      await expectLater(
        moviesBloc.onNewState,
        emitsInOrder([
          isA<MoviesLoading>(),
          isA<MoviesSuccess>(),
        ]),
      );
    },
  );

  test(
    'should return success state when try again complete without exception',
    () {
      //Arrange
      when(mockGetMovieListUc.getFuture()).thenAnswer(
        (_) async => mockMovieList,
      );

      //Act
      moviesBloc.onTryAgain.add(null);

      //Assert
      emitsInOrder([
        MoviesLoading(),
        MoviesSuccess(mockMovieList),
      ]);
    },
  );

  test('should return error state when fetch doesnt complete', () async {
    //Arrange
    when(mockGetMovieListUc.getFuture()).thenThrow(
      MyException(
        MyErrorType.timeoutError,
      ),
    );

    //Assert
    await expectLater(
      moviesBloc.onNewState,
      emitsInOrder([
        isA<MoviesLoading>(),
        isA<MoviesError>(),
      ]),
    );
  });
}
