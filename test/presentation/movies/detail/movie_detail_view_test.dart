import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';
import 'package:televi/core/exceptions.dart';
import 'package:televi/generated/l10n.dart';
import 'package:televi/presentation/movies/detail/bloc/favorite_state.dart';
import 'package:televi/presentation/movies/detail/bloc/movie_detail_bloc.dart';
import 'package:televi/presentation/movies/detail/bloc/movie_detail_state.dart';
import 'package:televi/presentation/movies/detail/movie_detail_view.dart';

import 'movie_detail_view_test.mocks.dart';
import 'movie_detail_view_test_data.dart';

@GenerateMocks([DetailBloc])
void main() {
  late MockDetailBloc mockDetailBloc;
  late BehaviorSubject<MovieDetailState> movieBehaviorSubject;
  late BehaviorSubject<FavoriteState> favoriteBehaviorSubject;
  late BehaviorSubject<bool> showSnackbarBehaviorSubject;

  Future<void> _createWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          S.delegate,
        ],
        home: MovieDetailView(
          detailBloc: mockDetailBloc,
        ),
      ),
    );
  }

  setUpAll(() {
    S.load(const Locale('en'));
  });

  setUp(() {
    mockDetailBloc = MockDetailBloc();
    movieBehaviorSubject = BehaviorSubject<MovieDetailState>();
    favoriteBehaviorSubject = BehaviorSubject<FavoriteState>();
    showSnackbarBehaviorSubject = BehaviorSubject<bool>();
  });

  tearDown(() {
    mockDetailBloc.dispose();
    movieBehaviorSubject.close();
    favoriteBehaviorSubject.close();
    showSnackbarBehaviorSubject.close();
  });

  void setUpListeners() {
    when(mockDetailBloc.onNewState).thenAnswer(
      (_) => movieBehaviorSubject,
    );
    when(mockDetailBloc.newFavoriteState).thenAnswer(
      (_) => favoriteBehaviorSubject,
    );
  }

  testWidgets('should show movie details when success state', (tester) async {
    //Arrange
    setUpListeners();
    await tester.runAsync(() async {
      await _createWidget(tester);
      await tester.pump();

      //Act
      movieBehaviorSubject.add(MovieDetailSuccess(mockMovieDetails));
      for (var i = 0; i < 5; i++) {
        await tester.pump(const Duration(seconds: 1));
      }
      expect(
        find.byKey(
          const ValueKey('movie-detail-success'),
        ),
        findsWidgets,
      );

      //Assert
      expect(find.text(mockMovieDetails.title), findsWidgets);
    });
  });

  testWidgets('should show a progress indicator when loading state',
      (tester) async {
    //Arrange
    setUpListeners();
    await tester.runAsync(() async {
      await _createWidget(tester);
      await tester.pump();

      //Act
      movieBehaviorSubject.add(MovieDetailLoading());
      for (var i = 0; i < 5; i++) {
        await tester.pump(const Duration(seconds: 1));
      }

      //Assert
      expect(find.byKey(const ValueKey('loading-state')), findsWidgets);
    });
  });

  testWidgets('should show error screen when error state', (tester) async {
    //Arrange
    setUpListeners();
    await tester.runAsync(() async {
      await _createWidget(tester);
      await tester.pump();

      //Act
      movieBehaviorSubject.add(MovieDetailError(MyErrorType.unknowError));
      for (var i = 0; i < 5; i++) {
        await tester.pump(const Duration(seconds: 1));
      }

      //Assert
      expect(find.byKey(const ValueKey('error-state')), findsWidgets);
    });
  });

  testWidgets('should show the favorite button when success state',
      (tester) async {
    //Arrange
    setUpListeners();
    await tester.runAsync(() async {
      await _createWidget(tester);

      //Act
      movieBehaviorSubject.add(MovieDetailSuccess(mockMovieDetails));
      await tester.pump();
      favoriteBehaviorSubject.add(FavoriteSucess(true));
      for (var i = 0; i < 5; i++) {
        await tester.pump(const Duration(seconds: 1));
      }

      //Assert
      expect(find.byKey(const ValueKey('favorite-button')), findsWidgets);
    });
  });

  testWidgets('should toggle favorite status and show snackbar when success',
      (tester) async {
    //Arrange
    setUpListeners();
    when(mockDetailBloc.shouldShowSnackbar).thenAnswer(
      (_) => showSnackbarBehaviorSubject,
    );
    when(mockDetailBloc.showSnackbar).thenAnswer(
      (_) => showSnackbarBehaviorSubject,
    );
    await tester.runAsync(() async {
      await _createWidget(tester);
      await tester.pump();

      //Act
      movieBehaviorSubject.add(MovieDetailSuccess(mockMovieDetails));
      await tester.pump();
      await tester.pump();
      showSnackbarBehaviorSubject.add(true);
      await tester.pump();
      favoriteBehaviorSubject.add(ToggleFavoriteSuccess(
        true,
        SnackbarSuccessType.snackbarFavoriteSuccess,
      ));
      for (var i = 0; i < 5; i++) {
        await tester.pump(const Duration(seconds: 1));
      }

      //Assert
      expect(find.text(S.current.snackbarFavoriteSuccess), findsWidgets);
    });
  });

  testWidgets('should show error snackbar when toggle emmit error state',
      (tester) async {
    //Arrange
    setUpListeners();
    when(mockDetailBloc.shouldShowSnackbar).thenAnswer(
      (_) => showSnackbarBehaviorSubject,
    );
    when(mockDetailBloc.showSnackbar).thenAnswer(
      (_) => showSnackbarBehaviorSubject,
    );
    await tester.runAsync(() async {
      await _createWidget(tester);
      await tester.pump();

      //Act
      movieBehaviorSubject.add(MovieDetailSuccess(mockMovieDetails));
      await tester.pump();
      await tester.pump();
      showSnackbarBehaviorSubject.add(true);
      await tester.pump();
      favoriteBehaviorSubject.add(
        FavoriteError(FavoriteErrorType.snackbarFavoriteChangeError, true),
      );
      for (var i = 0; i < 5; i++) {
        await tester.pump(const Duration(seconds: 1));
      }

      //Assert
      expect(find.text(S.current.snackbarFavoriteChangeError), findsWidgets);
    });
  });
}
