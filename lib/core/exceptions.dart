class MyException implements Exception {
  MyException(this.errorType);
  final MyErrorType errorType;
}

class FavoriteException implements Exception {
  FavoriteException(this.errorType);
  final FavoriteErrorType errorType;
}

enum MyErrorType {
  responseError,
  timeoutError,
  unknowError,
}

enum FavoriteErrorType {
  snackbarFavoriteChangeError,
  snackbarFavoriteFetchError,
}

class GenericError {
  GenericError(this.errorType);
  final MyErrorType errorType;
}
