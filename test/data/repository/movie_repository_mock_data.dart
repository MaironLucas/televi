

import 'package:televi/data/cache/models/movie_cm.dart';
import 'package:televi/data/cache/models/movie_detail_cm.dart';
import 'package:televi/data/remote/models/movie_detail_rm.dart';
import 'package:televi/data/remote/models/movie_rm.dart';

final mockRemoteMovieList = <MovieRm>[
  MovieRm(id: 1, title: 'Test Movie 1', posterUrl: 'poster.com'),
  MovieRm(id: 2, title: 'Test Movie 2', posterUrl: 'poster.com'),
  MovieRm(id: 3, title: 'Test Movie 3', posterUrl: 'poster.com'),
];

final mockCacheMovieList = <MovieCm>[
  MovieCm(id: 1, title: 'Test Movie 1', posterUrl: 'poster.com'),
  MovieCm(id: 2, title: 'Test Movie 2', posterUrl: 'poster.com'),
  MovieCm(id: 3, title: 'Test Movie 3', posterUrl: 'poster.com'),
];

final mockRemoteMovieDetail = MovieDetailRm(
  id: 1,
  genres: ['action', 'horror'],
  backdropUrl: 'backdrop.com',
  overview: 'Its a movie, 100%',
  posterUrl: 'poster.com',
  releaseDate: DateTime.now(),
  title: 'Test Movie 1',
  voteAverage: 7.5,
);

final mockCacheMovieDetail = MovieDetailCm(
  id: 2,
  genres: ['action', 'comedy'],
  backdropUrl: 'backdrop.com',
  overview: 'Its the second movie, 100%',
  posterUrl: 'poster.com',
  releaseDate: DateTime.now(),
  title: 'Test Movie 2',
  voteAverage: 7.5,
);

final mockFavoriteListIds = [1, 3, 5];

final mockFavoriteTestMovieList = <MovieCm>[
  MovieCm(id: 1, title: 'Test Movie 1', posterUrl: 'poster.com'),
  MovieCm(id: 2, title: 'Test Movie 2', posterUrl: 'poster.com'),
  MovieCm(id: 3, title: 'Test Movie 3', posterUrl: 'poster.com'),
  MovieCm(id: 4, title: 'Test Movie 4', posterUrl: 'poster.com'),
  MovieCm(id: 5, title: 'Test Movie 5', posterUrl: 'poster.com'),
];
