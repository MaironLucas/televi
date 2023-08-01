import 'package:domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:televi/generated/l10n.dart';
import 'package:televi/presentation/movies/common/async_snapshot_builder.dart';
import 'package:televi/presentation/movies/list/common/card_generator.dart';
import 'package:televi/presentation/movies/list/movies_list/bloc/movies_bloc.dart';
import 'package:televi/presentation/movies/list/movies_list/bloc/movies_state.dart';

class MoviesView extends StatefulWidget {
  const MoviesView({
    required this.moviesBloc,
    Key? key,
  }) : super(key: key);

  static const routeName = 'movies';
  final MoviesBloc moviesBloc;

  @override
  State<MoviesView> createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesView> {
  @override
  Widget build(BuildContext context) {
    final moviesBloc = widget.moviesBloc;
    return StreamBuilder<Object>(
      stream: moviesBloc.onNewState,
      builder: (context, snapshot) => Scaffold(
        appBar: AppBar(
          title: Text(
            Localizations.of<S>(context, S)!.homePageTitle,
          ),
          centerTitle: true,
          actions: [
            Container(
              margin: const EdgeInsets.all(2),
              child: IconButton(
                onPressed: () => moviesBloc.onTryAgain.add(null),
                icon: const Icon(Icons.refresh),
              ),
            ),
          ],
        ),
        body: AsyncSnapshotBuilder<MoviesLoading, MoviesError, MoviesSuccess>(
          snapshot: snapshot,
          onTryAgain: () => moviesBloc.onTryAgain.add(null),
          successWidgetBuilder: (context, sucessState) => _HomeBody(
            sucessState.movies,
            key: const ValueKey('movies-success'),
          ),
        ),
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody(
    this.movies, {
    Key? key,
  }) : super(key: key);

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) => Container(
        color: Theme.of(context).backgroundColor,
        child: CardGenerator(
          movies: movies,
        ),
      );
}
