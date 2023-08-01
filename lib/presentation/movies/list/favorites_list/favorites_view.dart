import 'package:domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:televi/generated/l10n.dart';
import 'package:televi/presentation/movies/common/async_snapshot_builder.dart';
import 'package:televi/presentation/movies/list/common/card_generator.dart';
import 'package:televi/presentation/movies/list/favorites_list/bloc/favorites_bloc.dart';
import 'package:televi/presentation/movies/list/favorites_list/bloc/favorites_view_state.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({
    required this.favoritesBloc,
    Key? key,
  }) : super(key: key);
  static const routeName = 'favorites';
  final FavoritesBloc favoritesBloc;

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  final Key _focusDetectorKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    final favoritesBloc = widget.favoritesBloc;
    return StreamBuilder<Object>(
      stream: favoritesBloc.onNewState,
      builder: (context, snapshot) => Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).favoritesAppBar),
            centerTitle: true,
            actions: [
              Container(
                margin: const EdgeInsets.all(2),
                child: IconButton(
                  onPressed: () => favoritesBloc.onTryAgain.add(null),
                  icon: const Icon(Icons.refresh),
                ),
              ),
            ],
          ),
          body: FocusDetector(
            key: _focusDetectorKey,
            onFocusGained: () => favoritesBloc.onTryAgain.add(null),
            child: AsyncSnapshotBuilder<FavoritesViewLoading,
                FavoritesViewError, FavoritesViewSuccess>(
              onTryAgain: () => favoritesBloc.onTryAgain.add(null),
              snapshot: snapshot,
              successWidgetBuilder: (context, snapshotData) =>
                  _FavoritesBody(snapshotData.favoritesMovies),
            ),
          )),
    );
  }
}

class _FavoritesBody extends StatelessWidget {
  const _FavoritesBody(this.movies);

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) => Container(
        color: Theme.of(context).backgroundColor,
        child: movies.isEmpty
            ? const _EmptyFavoritesBody()
            : CardGenerator(
                movies: movies,
              ),
      );
}

class _EmptyFavoritesBody extends StatelessWidget {
  const _EmptyFavoritesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                S.of(context).favoritesMessage,
                maxLines: 3,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      );
}
