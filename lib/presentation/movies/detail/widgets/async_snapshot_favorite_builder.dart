import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:televi/core/exceptions.dart';
import 'package:televi/core/firebase_tags.dart';
import 'package:televi/generated/l10n.dart';
import 'package:televi/presentation/movies/detail/bloc/favorite_state.dart';
import 'package:televi/presentation/movies/detail/bloc/movie_detail_bloc.dart';

class AsyncSnapshotFavoriteBuilder extends StatelessWidget {
  const AsyncSnapshotFavoriteBuilder({
    required this.fontSize,
    required this.snapshot,
    required this.toggleFavorite,
    required this.bloc,
    required this.filmName,
    Key? key,
  }) : super(key: key);

  final double fontSize;
  final AsyncSnapshot snapshot;
  final GestureTapCallback toggleFavorite;
  final DetailBloc bloc;
  final String filmName;

  @override
  Widget build(BuildContext context) {
    final snapshotData = snapshot.data;
    if (snapshotData == null || snapshotData is FavoriteLoading) {
      return const Center(
        child: CircularProgressIndicator(
          key: ValueKey('favorite-loading'),
        ),
      );
    } else {
      if (snapshotData is FavoriteError) {
        final isFavorite = snapshotData.isFavorite;
        return _CustomSnackbarBuilder(
          bloc: bloc,
          message: snapshotData.errorType ==
                  FavoriteErrorType.snackbarFavoriteChangeError
              ? S.of(context).snackbarFavoriteChangeError
              : S.of(context).snackbarFavoriteFetchError,
          isFavorite: isFavorite,
          fontSize: fontSize,
          toggleFavorite: toggleFavorite,
        );
      } else if (snapshotData is FavoriteSucess) {
        return _CustomFavoriteButton(
          isFavorite: snapshotData.isFavorite,
          fontSize: fontSize,
          toggleFavorite: toggleFavorite,
        );
      } else {
        final toggleSnapshotData = snapshotData as ToggleFavoriteSuccess;
        return _CustomSnackbarBuilder(
          bloc: bloc,
          message: toggleSnapshotData.snackbarSuccessType ==
                  SnackbarSuccessType.snackbarFavoriteSuccess
              ? S.of(context).snackbarFavoriteSuccess
              : S.of(context).snackbarUnFavoriteSuccess,
          isFavorite: toggleSnapshotData.isFavorite,
          fontSize: fontSize,
          toggleFavorite: () {
            final status = toggleSnapshotData.isFavorite
                ? favoriteMovieAddedTag
                : favoriteMovieRemovedTag;
            context.read<FirebaseAnalytics>().logEvent(
              name: 'favorite_movie_$status',
              parameters: <String, String>{
                'movie_title': filmName,
              },
            );
            toggleFavorite();
          },
        );
      }
    }
  }
}

class _CustomSnackbarBuilder extends StatelessWidget {
  const _CustomSnackbarBuilder({
    required this.bloc,
    required this.message,
    required this.isFavorite,
    required this.fontSize,
    required this.toggleFavorite,
    Key? key,
  }) : super(key: key);

  final DetailBloc bloc;
  final String message;
  final bool isFavorite;
  final double fontSize;
  final Function() toggleFavorite;

  void _delayedSnackBar(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(milliseconds: 700),
          content: Text(
            message,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => StreamBuilder(
        stream: bloc.shouldShowSnackbar,
        builder: (context, snackbarSnapshot) {
          if (snackbarSnapshot.data != null) {
            final shoudShowSnackbar = snackbarSnapshot.data as bool;
            if (shoudShowSnackbar) {
              _delayedSnackBar(
                context,
              );
              bloc.showSnackbar.add(false);
            }
          }
          return _CustomFavoriteButton(
            isFavorite: isFavorite,
            fontSize: fontSize,
            toggleFavorite: toggleFavorite,
          );
        },
      );
}

class _CustomFavoriteButton extends StatelessWidget {
  const _CustomFavoriteButton({
    required this.isFavorite,
    required this.fontSize,
    required this.toggleFavorite,
    Key? key,
  }) : super(key: key);

  final bool isFavorite;
  final double fontSize;
  final GestureTapCallback toggleFavorite;

  @override
  Widget build(BuildContext context) => IconButton(
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          size: fontSize * 2,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: toggleFavorite,
        key: const ValueKey('favorite-button'),
      );
}
