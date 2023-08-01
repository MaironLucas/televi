import 'package:domain/data_repositories/movie_data_repository.dart';
import 'package:domain/use_cases/use_case.dart';

class GetIsFavoriteUc extends UseCase<GetIsFavoriteUcParams, bool> {
  GetIsFavoriteUc({required this.repository});

  final MovieDataRepository repository;

  @override
  Future<bool> getRawFuture({required GetIsFavoriteUcParams params}) =>
      repository.checkIsFavorite(params.movieId);
}

class GetIsFavoriteUcParams {
  const GetIsFavoriteUcParams(this.movieId);
  final int movieId;
}
