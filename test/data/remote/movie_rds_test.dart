import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:televi/data/remote/data_source/movie_rds.dart';
import 'package:televi/data/remote/infrastructure/my_dio.dart';
import 'package:televi/data/remote/models/movie_rm.dart';

import 'movie_rds_mock_data.dart';
import 'movie_rds_test.mocks.dart';

@GenerateMocks([MyDio])
void main() {
  final dioMock = MockMyDio();
  late final MovieRds movieRds;

  setUpAll(() {
    movieRds = MovieRds(dio: dioMock);
  });

  group('test fetchMovies method from remote data source', () {
    test('should get a list of movies', () async {
      //Arrange
      when(dioMock.get(any)).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/'),
          data: movieListMockData,
        ),
      );

      //Act
      final responseList = await movieRds.fetchAll();

      //Assert
      expect(responseList, isA<List<MovieRm>>());
      verify(dioMock.get(any)).called(1);
    });

    test('should get 4 movies', () async {
      //Arrange
      when(dioMock.get(any)).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/'),
          data: movieListMockData,
        ),
      );

      //Act
      final responseList = await movieRds.fetchAll();

      //Assert
      expect(responseList.length, movieListMockData.length);
      verify(dioMock.get(any)).called(1);
    });

    test('should get an exception when Dio call fails', () {
      //Arrange
      when(dioMock.get(any)).thenThrow(
        Exception(),
      );

      //Assert
      expect(movieRds.fetchAll, throwsException);
      verify(dioMock.get(any)).called(1);
    });
  });

  group('test fetchMovieDetails method from remote data source', () {
    test(
      'should get the movie with id 680',
      () async {
        //Arrange
        when(dioMock.get(any)).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(path: '/'),
            data: movieDetailMockData,
          ),
        );

        //Act
        final responseMovie = await movieRds.fetchMovie(680);

        //Assert
        expect(responseMovie.id, movieDetailMockData['id']);
        verify(dioMock.get(any)).called(1);
      },
    );

    test('should get an exception when the movie id doesnt exist', () async {
      //Arrange
      when(dioMock.get(any)).thenThrow(
        Exception(),
      );

      //Assert
      expect(() => movieRds.fetchMovie(-1), throwsException);
    });
  });
}
