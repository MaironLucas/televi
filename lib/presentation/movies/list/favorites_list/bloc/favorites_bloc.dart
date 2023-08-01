import 'dart:async';

import 'package:domain/use_cases/get_favorite_list_uc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:televi/core/exceptions.dart';
import 'package:televi/presentation/movies/list/favorites_list/bloc/favorites_view_state.dart';

class FavoritesBloc {
  FavoritesBloc(this.getFavoriteListUc) {
    Rx.merge<dynamic>([
      Stream<void>.value(null),
      _onTryAgain.stream,
    ])
        .flatMap(
          (dynamic _) => _fetchAllFavorites(),
        )
        .listen(_onNewState.add)
        .addTo(_subscriptions);
  }

  final GetFavoriteListUc getFavoriteListUc;

  final _subscriptions = CompositeSubscription();
  final _onTryAgain = StreamController();
  Sink get onTryAgain => _onTryAgain.sink;

  final _onNewState = BehaviorSubject<FavoritesViewState>();
  Stream<FavoritesViewState> get onNewState => _onNewState;

  Stream<FavoritesViewState> _fetchAllFavorites() async* {
    yield FavoritesViewLoading();

    try {
      yield FavoritesViewSuccess(
          await getFavoriteListUc.getFuture(params: null));
    } on MyException catch (e) {
      yield FavoritesViewError(e.errorType);
    }
  }

  void dispose() {
    _subscriptions.dispose();
    _onTryAgain.close();
    _onNewState.close();
  }
}
