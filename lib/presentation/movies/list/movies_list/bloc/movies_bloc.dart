import 'dart:async';

import 'package:domain/use_cases/get_movie_list_uc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:televi/core/exceptions.dart';
import 'package:televi/presentation/movies/list/movies_list/bloc/movies_state.dart';

class MoviesBloc {
  MoviesBloc(this.getMovieListUc) {
    Rx.merge<dynamic>([
      Stream<void>.value(null),
      _onTryAgain.stream,
    ])
        .flatMap(
          (dynamic _) => _fetchAllMovies(),
        )
        .listen(_onNewState.add)
        .addTo(_subscriptions);
  }

  final GetMovieListUc getMovieListUc;

  final _subscriptions = CompositeSubscription();
  final _onTryAgain = StreamController();
  Sink get onTryAgain => _onTryAgain.sink;

  final _onNewState = BehaviorSubject<MoviesState>();
  Stream<MoviesState> get onNewState => _onNewState;

  Stream<MoviesState> _fetchAllMovies() async* {
    yield MoviesLoading();

    try {
      yield MoviesSuccess(await getMovieListUc.getFuture(params: null));
    } on MyException catch (e) {
      yield MoviesError(e.errorType);
    }
  }

  void dispose() {
    _subscriptions.dispose();
    _onTryAgain.close();
    _onNewState.close();
  }
}
