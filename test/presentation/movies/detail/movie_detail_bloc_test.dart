import 'package:domain/use_cases/add_on_favorites_uc.dart';
import 'package:domain/use_cases/get_is_favorite.dart';
import 'package:domain/use_cases/get_movie_detail_uc.dart';
import 'package:domain/use_cases/remove_from_favorites_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:televi/core/exceptions.dart';
import 'package:televi/presentation/movies/detail/bloc/favorite_state.dart';
import 'package:televi/presentation/movies/detail/bloc/movie_detail_bloc.dart';
import 'package:televi/presentation/movies/detail/bloc/movie_detail_state.dart';

import 'movie_detail_bloc_test.mocks.dart';
import 'movie_detail_view_test_data.dart';

@GenerateMocks([
  GetMovieDetailUc,
  GetIsFavoriteUc,
  AddOnFavoritesUc,
  RemoveFromFavoritesUc,
])
void main() {
  late DetailBloc detailBloc;
  late MockGetMovieDetailUc mockGetMovieDetailUc;
  late MockGetIsFavoriteUc mockGetIsFavoriteUc;
  late MockAddOnFavoritesUc mockAddOnFavoritesUc;
  late MockRemoveFromFavoritesUc mockRemoveFromFavoritesUc;

  setUpAll(() {
    mockGetMovieDetailUc = MockGetMovieDetailUc();
    mockGetIsFavoriteUc = MockGetIsFavoriteUc();
    mockAddOnFavoritesUc = MockAddOnFavoritesUc();
    mockRemoveFromFavoritesUc = MockRemoveFromFavoritesUc();
  });

  void setFetchMovieList() {
    when(
      mockGetMovieDetailUc.getFuture(
        params: anyNamed('params'),
      ),
    ).thenAnswer((_) async => mockMovieDetails);
  }

  void setFetchFavoriteStatus() {
    when(
      mockGetIsFavoriteUc.getFuture(
        params: anyNamed('params'),
      ),
    ).thenAnswer((_) async => false);
  }

  void setBloc() {
    detailBloc = DetailBloc(
      12,
      addOnFavoritesUc: mockAddOnFavoritesUc,
      getIsFavoriteUc: mockGetIsFavoriteUc,
      getMovieDetailUc: mockGetMovieDetailUc,
      removeFromFavoritesUc: mockRemoveFromFavoritesUc,
    );
  }

  group('test movie detail fetch', () {
    test('should load movie details when success state', () async {
      //Arrange
      setFetchMovieList();
      setFetchFavoriteStatus();
      setBloc();

      //Assert
      await expectLater(
        detailBloc.onNewState,
        emitsInOrder([
          isA<MovieDetailLoading>(),
          isA<MovieDetailSuccess>(),
        ]),
      );

      detailBloc.dispose();
    });

    test('should return error state when fetch doesnt complete', () async {
      //Arrange
      when(
        mockGetMovieDetailUc.getFuture(
          params: anyNamed('params'),
        ),
      ).thenThrow(
        MyException(MyErrorType.timeoutError),
      );
      setFetchFavoriteStatus();
      setBloc();

      //Assert
      await expectLater(
        detailBloc.onNewState,
        emitsInOrder([
          isA<MovieDetailLoading>(),
          isA<MovieDetailError>(),
        ]),
      );

      detailBloc.dispose();
    });
  });

  group('test toggle favorites methods', () {
    test('should load favorite status from cache', () {
      //Arrange
      setFetchMovieList();
      setFetchFavoriteStatus();
      setBloc();

      //Assert
      emitsInOrder([
        isA<FavoriteLoading>(),
        isA<FavoriteSucess>(),
      ]);

      detailBloc.dispose();
    });

    test('should toggle favorite status on cache', () {
      //Arrange
      setFetchMovieList();
      setFetchFavoriteStatus();
      setBloc();
      when(
        mockAddOnFavoritesUc.getFuture(
          params: anyNamed('params'),
        ),
      ).thenAnswer((_) async {});

      //Act
      detailBloc.toggleFavorite.add(null);

      //Assert
      emitsInOrder([
        isA<FavoriteLoading>(),
        isA<ToggleFavoriteSuccess>(),
      ]);

      detailBloc.dispose();
    });

    test('should return error state when toggle fails', () {
      //Arrange
      setFetchMovieList();
      when(
        mockAddOnFavoritesUc.getFuture(
          params: anyNamed('params'),
        ),
      ).thenThrow(Exception());
      setBloc();

      //Act
      detailBloc.toggleFavorite.add(null);

      //Assert
      emitsInOrder([
        isA<FavoriteLoading>(),
        isA<FavoriteError>(),
      ]);

      detailBloc.dispose();
    });
  });
}
