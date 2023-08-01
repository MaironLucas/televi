import 'package:domain/data_repositories/movie_data_repository.dart';
import 'package:domain/use_cases/use_case.dart';

class RemoveFromFavoritesUc extends UseCase<RemoveFromFavoritesUcParams, void> {
  RemoveFromFavoritesUc({required this.repository});

  final MovieDataRepository repository;

  @override
  Future<void> getRawFuture({required RemoveFromFavoritesUcParams params}) =>
      repository.removeFromFavorites(params.movieId);
}

class RemoveFromFavoritesUcParams {
  RemoveFromFavoritesUcParams(this.movieId);

  final int movieId;
}
