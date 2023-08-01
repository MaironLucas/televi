import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';
import 'package:televi/core/exceptions.dart';
import 'package:televi/generated/l10n.dart';
import 'package:televi/presentation/movies/list/movies_list/bloc/movies_bloc.dart';
import 'package:televi/presentation/movies/list/movies_list/bloc/movies_state.dart';
import 'package:televi/presentation/movies/list/movies_list/movies_view.dart';

import 'movies_view_test.mocks.dart';
import 'movies_view_test_data.dart';

@GenerateMocks([MoviesBloc])
void main() {
  late MockMoviesBloc mockMoviesBloc;
  late BehaviorSubject<MoviesState> behaviorSubject;

  Future<void> _createWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          S.delegate,
        ],
        home: MoviesView(
          moviesBloc: mockMoviesBloc,
        ),
      ),
    );
  }

  setUpAll(() {
    S.load(const Locale('en'));
  });

  setUp(() {
    mockMoviesBloc = MockMoviesBloc();
    behaviorSubject = BehaviorSubject<MoviesState>();
  });

  tearDown(() {
    mockMoviesBloc.dispose();
    behaviorSubject.close();
  });

  testWidgets('should load list of movies when success state', (tester) async {
    //Arrange
    when(mockMoviesBloc.onNewState).thenAnswer(
      (_) => behaviorSubject,
    );
    await tester.runAsync(() async {
      await _createWidget(tester);

      //Act
      behaviorSubject.add(MoviesSuccess(mockMovieList));
      await tester.pump();
      await tester.pump();

      //Assert
      expect(find.text(mockMovieList.first.title), findsWidgets);
      expect(
        find.byKey(
          const ValueKey('movies-success'),
        ),
        findsWidgets,
      );
    });
  });

  testWidgets('should show progress indicator when loading state',
      (tester) async {
    //Arrange
    when(mockMoviesBloc.onNewState).thenAnswer(
      (_) => behaviorSubject,
    );
    await tester.runAsync(() async {
      await _createWidget(tester);

      //Act
      behaviorSubject.add(MoviesLoading());
      await tester.pump(const Duration(milliseconds: 500));

      //Assert
      expect(find.byKey(const ValueKey('loading-state')), findsWidgets);
    });
  });

  testWidgets('should show error screen when error state', (tester) async {
    //Arrange
    when(mockMoviesBloc.onNewState).thenAnswer(
      (_) => behaviorSubject,
    );
    await tester.runAsync(() async {
      await _createWidget(tester);

      //Act
      behaviorSubject.add(MoviesError(MyErrorType.unknowError));
      await tester.pump();
      await tester.pump();

      //Assert
      expect(find.byKey(const ValueKey('error-state')), findsWidgets);
    });
  });
}
