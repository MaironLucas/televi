import 'dart:async';

import 'package:domain/use_cases/add_on_favorites_uc.dart';
import 'package:domain/use_cases/get_is_favorite.dart';
import 'package:domain/use_cases/get_movie_detail_uc.dart';
import 'package:domain/use_cases/remove_from_favorites_uc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:televi/core/exceptions.dart';
import 'package:televi/presentation/movies/detail/bloc/favorite_state.dart';
import 'package:televi/presentation/movies/detail/bloc/movie_detail_state.dart';

class DetailBloc {
  DetailBloc(
    int id, {
    required this.getMovieDetailUc,
    required this.getIsFavoriteUc,
    required this.addOnFavoritesUc,
    required this.removeFromFavoritesUc,
  }) {
    _subscriptions
      // RELATIVO A FETCH E REFRESH DE FILMES
      ..add(
        _fetchMovieDetails(id).listen(_onNewState.add),
      )
      ..add(
        _onTryAgain.stream
            .flatMap((_) => _fetchMovieDetails(id))
            .listen(_onNewState.add),
      )
      // RELATIVO A FETCH E TOGGLE DE FAVORITO
      ..add(
        _fetchFavorite(id).listen(_newFavoriteState.add),
      )
      ..add(
        _toggleFavorite.stream
            .flatMap((_) => _toggleFavoriteStatus(id))
            .listen(_newFavoriteState.add),
      );
  }

  final GetMovieDetailUc getMovieDetailUc;
  final GetIsFavoriteUc getIsFavoriteUc;
  final AddOnFavoritesUc addOnFavoritesUc;
  final RemoveFromFavoritesUc removeFromFavoritesUc;

  final _subscriptions = CompositeSubscription();
  final _onTryAgain = StreamController();
  Sink get onTryAgain => _onTryAgain.sink;
  final _onNewState = BehaviorSubject<MovieDetailState>();
  Stream<MovieDetailState> get onNewState => _onNewState;

  final _toggleFavorite = StreamController();
  Sink get toggleFavorite => _toggleFavorite.sink;
  final _newFavoriteState = BehaviorSubject<FavoriteState>();
  Stream<FavoriteState> get newFavoriteState => _newFavoriteState;

  final _currentFavoriteController = BehaviorSubject<bool>();
  Sink<bool> get currentFavoriteInput => _currentFavoriteController.sink;

  final _showSnackbarController = BehaviorSubject<bool>();
  Sink<bool> get showSnackbar => _showSnackbarController.sink;
  Stream<bool> get shouldShowSnackbar => _showSnackbarController;

  Stream<MovieDetailState> _fetchMovieDetails(int id) async* {
    yield MovieDetailLoading();

    try {
      yield MovieDetailSuccess(
        await getMovieDetailUc.getFuture(
          params: GetMovieDetailUcParams(id),
        ),
      );
    } on MyException catch (e) {
      yield MovieDetailError(e.errorType);
    }
  }

  Stream<FavoriteState> _fetchFavorite(int id) async* {
    yield FavoriteLoading();

    try {
      final loadedFavoriteStatus = await getIsFavoriteUc.getFuture(
        params: GetIsFavoriteUcParams(id),
      );
      currentFavoriteInput.add(loadedFavoriteStatus);
      yield FavoriteSucess(loadedFavoriteStatus);
    } catch (e) {
      showSnackbar.add(true);
      yield FavoriteError(FavoriteErrorType.snackbarFavoriteFetchError);
    }
  }

  Stream<FavoriteState> _toggleFavoriteStatus(int id) async* {
    var currentFavoriteStatus = _currentFavoriteController.hasValue
        ? _currentFavoriteController.value
        : false;
    try {
      currentFavoriteStatus = !currentFavoriteStatus;
      currentFavoriteStatus
          ? await addOnFavoritesUc.getFuture(
              params: AddOnFavoritesUcParams(id),
            )
          : await removeFromFavoritesUc.getFuture(
              params: RemoveFromFavoritesUcParams(id),
            );
      currentFavoriteInput.add(currentFavoriteStatus);
      showSnackbar.add(true);
      yield ToggleFavoriteSuccess(
        currentFavoriteStatus,
        currentFavoriteStatus
            ? SnackbarSuccessType.snackbarFavoriteSuccess
            : SnackbarSuccessType.snackbarUnFavoriteSuccess,
      );
    } catch (e) {
      showSnackbar.add(true);
      yield FavoriteError(
        FavoriteErrorType.snackbarFavoriteChangeError,
        !currentFavoriteStatus,
      );
    }
  }

  void dispose() {
    _subscriptions.dispose();
    _toggleFavorite.close();
    _currentFavoriteController.close();
    _onTryAgain.close();
    _onNewState.close();
    _newFavoriteState.close();
    _showSnackbarController.close();
  }
}
