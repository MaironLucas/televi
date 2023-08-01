import 'package:domain/entities/movie.dart';
import 'package:domain/entities/movie_detail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:televi/core/exceptions.dart';
import 'package:televi/data/cache/data_source/movie_cds.dart';
import 'package:televi/data/remote/data_source/movie_rds.dart';
import 'package:televi/data/repository/movie_repository.dart';

import 'movie_repository_mock_data.dart';
import 'movie_repository_test.mocks.dart';

@GenerateMocks([MovieCds, MovieRds])
void main() {
  late MockMovieCds mockMovieCds;
  late MockMovieRds mockMovieRds;
  late MovieRepository movieRepository;

  setUp(
    () {
      mockMovieCds = MockMovieCds();
      mockMovieRds = MockMovieRds();
      movieRepository = MovieRepository(
        remoteDataSource: mockMovieRds,
        cacheDataSource: mockMovieCds,
      );
    },
  );

  group('test fetchMovieList method from MovieRepository', () {
    test('should get a list of movies using Remote Data Source', () async {
      //Arrange
      when(mockMovieCds.isBoxEmpty()).thenAnswer(
        (_) async => true,
      );
      when(mockMovieRds.fetchAll()).thenAnswer(
        (_) async => mockRemoteMovieList,
      );
      when(mockMovieCds.insertMovieList(any)).thenAnswer((_) async {});

      //Act
      final responseMovieList = await movieRepository.fetchMovieList();

      //Assert
      expect(responseMovieList, isA<List<Movie>>());
      verify(mockMovieCds.isBoxEmpty()).called(1);
      verify(mockMovieCds.insertMovieList(any)).called(1);
      verify(mockMovieRds.fetchAll()).called(1);
    });

    test('should get a list of movies using Cache Data Source', () async {
      //Arrange
      when(mockMovieCds.isBoxEmpty()).thenAnswer(
        (_) async => false,
      );
      when(mockMovieCds.fetchMovieList()).thenAnswer(
        (_) async => mockCacheMovieList,
      );

      //Act
      final responseMovieList = await movieRepository.fetchMovieList();

      //Assert
      expect(responseMovieList, isA<List<Movie>>());
      verify(mockMovieCds.isBoxEmpty()).called(1);
      verify(mockMovieCds.fetchMovieList()).called(1);
      verifyZeroInteractions(mockMovieRds);
    });
  });

  group('test fetchMovieDetail method from MovieRepository', () {
    test('should get movie details from Remote Data Source', () async {
      //Arrange
      when(mockMovieCds.isMovieOnCache(any)).thenAnswer(
        (_) async => false,
      );
      when(mockMovieRds.fetchMovie(any)).thenAnswer(
        (_) async => mockRemoteMovieDetail,
      );
      when(mockMovieCds.insertMovieDetail(any)).thenAnswer((_) async {});

      //Act
      final responseMovieDetail = await movieRepository.fetchMovieDetails(1);

      //Assert
      expect(responseMovieDetail, isA<MovieDetail>());
      verify(mockMovieCds.isMovieOnCache(any)).called(1);
      verify(mockMovieRds.fetchMovie(any)).called(1);
      verify(mockMovieCds.insertMovieDetail(any)).called(1);
    });

    test('should get movie details from Cache Data Source', () async {
      //Arrange
      when(mockMovieCds.isMovieOnCache(any)).thenAnswer(
        (_) async => true,
      );
      when(mockMovieCds.fetchMovieDetails(any)).thenAnswer(
        (_) async => mockCacheMovieDetail,
      );

      //Act
      final responseMovieDetail = await movieRepository.fetchMovieDetails(1);

      //Assert
      expect(responseMovieDetail, isA<MovieDetail>());
      verify(mockMovieCds.isMovieOnCache(any)).called(1);
      verify(mockMovieCds.fetchMovieDetails(any)).called(1);
      verifyZeroInteractions(mockMovieRds);
    });
  });

  group('test favorites methods', () {
    test('should save without exceptions', () async {
      //Arrange
      when(mockMovieCds.insertFavorite(any)).thenAnswer((_) async {});

      //Act
      await movieRepository.saveOnFavorites(12);

      //Assert
      verify(mockMovieCds.insertFavorite(any)).called(1);
      verifyZeroInteractions(mockMovieRds);
      verifyNoMoreInteractions(mockMovieCds);
    });

    test('should throw exception on cache error', () async {
      //Arrange
      when(mockMovieCds.insertFavorite(any)).thenThrow(Exception());

      //Assert
      expect(
        movieRepository.saveOnFavorites(12),
        throwsA(isA<FavoriteException>()),
      );
      verifyZeroInteractions(mockMovieRds);
    });

    test('should remove from favorites without exceptions', () async {
      //Arrange
      when(mockMovieCds.removeFromFavorite(any)).thenAnswer((_) async {});

      //Act
      await movieRepository.removeFromFavorites(12);

      //Assert
      verify(mockMovieCds.removeFromFavorite(any)).called(1);
      verifyZeroInteractions(mockMovieRds);
      verifyNoMoreInteractions(mockMovieCds);
    });

    test('should check if is favorite status with success', () async {
      //Arrange
      when(mockMovieCds.isFavorite(any)).thenAnswer((_) async => true);

      //Act
      final isFavorite = await movieRepository.checkIsFavorite(12);

      //Assert
      expect(isFavorite, true);
      verify(mockMovieCds.isFavorite(any)).called(1);
      verifyZeroInteractions(mockMovieRds);
      verifyNoMoreInteractions(mockMovieCds);
    });

    test('should fetch favorites from cache without exception', () async {
      //Arrange
      when(mockMovieCds.fetchAllFavorites()).thenAnswer(
        (_) async => mockFavoriteListIds,
      );
      when(mockMovieCds.fetchMovieList()).thenAnswer(
        (_) async => mockFavoriteTestMovieList,
      );

      //Act
      final favoriteList = await movieRepository.fetchAllFavorites();

      //Assert
      expect(favoriteList.length, mockFavoriteListIds.length);
      verify(mockMovieCds.fetchAllFavorites()).called(1);
      verifyZeroInteractions(mockMovieRds);
    });

    test('should throw a exceptions when fetch favorites doesnt complete',
        () async {
      //Arrange
      when(mockMovieCds.fetchAllFavorites()).thenThrow(
        MyException(MyErrorType.responseError),
      );

      //Assert
      expect(movieRepository.fetchAllFavorites(), throwsA(isA<MyException>()));
    });
  });
}
