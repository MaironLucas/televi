import 'package:televi/core/exceptions.dart';

abstract class FavoriteState {}

class FavoriteSucess implements FavoriteState {
  FavoriteSucess(this.isFavorite);

  bool isFavorite;
}

class ToggleFavoriteSuccess implements FavoriteState {
  ToggleFavoriteSuccess(this.isFavorite, this.snackbarSuccessType);

  bool isFavorite;
  SnackbarSuccessType snackbarSuccessType;
}

class FavoriteLoading implements FavoriteState {}

class FavoriteError implements FavoriteState {
  FavoriteError(this.errorType, [this.isFavorite = false]);
  final FavoriteErrorType errorType;
  final bool isFavorite;
}

enum SnackbarSuccessType {
  snackbarFavoriteSuccess,
  snackbarUnFavoriteSuccess,
}
