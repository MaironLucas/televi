import 'package:domain/data_repositories/movie_data_repository.dart';
import 'package:domain/use_cases/use_case.dart';

class AddOnFavoritesUc extends UseCase<AddOnFavoritesUcParams, void> {
  AddOnFavoritesUc({required this.repository});

  final MovieDataRepository repository;

  @override
  Future<void> getRawFuture({required AddOnFavoritesUcParams params}) =>
      repository.saveOnFavorites(params.movieId);
}

class AddOnFavoritesUcParams {
  AddOnFavoritesUcParams(this.movieId);

  final int movieId;
}
