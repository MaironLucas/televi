import 'package:domain/data_repositories/movie_data_repository.dart';
import 'package:domain/entities/movie.dart';
import 'package:domain/use_cases/use_case.dart';

class GetFavoriteListUc extends UseCase<void, List<Movie>> {
  GetFavoriteListUc({required this.repository});

  final MovieDataRepository repository;

  @override
  Future<List<Movie>> getRawFuture({void params}) =>
      repository.fetchAllFavorites();
}
