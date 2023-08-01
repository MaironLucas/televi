import 'package:domain/entities/movie_detail.dart';
import 'package:flutter/material.dart';
import 'package:televi/presentation/movies/common/async_snapshot_builder.dart';
import 'package:televi/presentation/movies/detail/bloc/movie_detail_state.dart';
import 'package:televi/presentation/movies/detail/widgets/async_snapshot_favorite_builder.dart';
import 'package:televi/presentation/movies/detail/widgets/genres.dart';
import 'package:televi/presentation/movies/detail/widgets/overview.dart';
import 'package:televi/presentation/movies/detail/widgets/status.dart';
import 'package:televi/presentation/movies/list/common/personalized_image_network.dart';

import 'bloc/movie_detail_bloc.dart';

class MovieDetailView extends StatefulWidget {
  const MovieDetailView({
    required this.detailBloc,
    Key? key,
  }) : super(key: key);
  static const String routeName = 'movie_details';
  final DetailBloc detailBloc;

  @override
  State<MovieDetailView> createState() => _MovieDetailViewState();
}

class _MovieDetailViewState extends State<MovieDetailView> {
  @override
  Widget build(BuildContext context) {
    final detailBloc = widget.detailBloc;
    return StreamBuilder(
      stream: detailBloc.onNewState,
      builder: (context, snapshot) {
        final snapshotData = snapshot.data;
        final appBar = snapshotData is MovieDetailSuccess
            ? null
            : AppBar(
                title: const Text(''),
                centerTitle: true,
              );
        return Scaffold(
          appBar: appBar,
          body: AsyncSnapshotBuilder<MovieDetailLoading, MovieDetailError,
              MovieDetailSuccess>(
            snapshot: snapshot,
            onTryAgain: () => detailBloc.onTryAgain.add(null),
            successWidgetBuilder: (context, sucessState) => _Body(
              movie: sucessState.movie,
              bloc: detailBloc,
              key: const ValueKey('movie-detail-success'),
            ),
          ),
        );
      },
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.movie, required this.bloc, Key? key})
      : super(key: key);

  final MovieDetail movie;
  final DetailBloc bloc;

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaHeight = MediaQuery.of(context).size.height;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final padding = isPortrait ? mediaHeight * 0.02 : mediaWidth * 0.02;
    final fontSize = isPortrait ? mediaHeight * 0.025 : mediaWidth * 0.025;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight:
              isPortrait ? mediaHeight * 0.35 : mediaHeight * 0.5, //220,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsetsDirectional.only(
              start: mediaWidth * 0.02,
              bottom: mediaHeight * 0.03,
            ),
            title: Container(
              padding: const EdgeInsets.only(right: 5, left: 5),
              color: Colors.black38,
              child: Text(
                movie.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize:
                      isPortrait ? mediaHeight * 0.025 : mediaWidth * 0.025,
                ),
              ),
            ),
            background: PersonalizedNetworkImage(
              url: movie.backdropUrl,
              tipo: TipoDeImagem.backdrop,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            StatusWidget(
              avgNote: movie.voteAverage,
              date: movie.releaseDate,
              fontSize: fontSize,
              padding: padding,
            ),
            Genres(
              genres: movie.genres,
              fontSize: fontSize,
              padding: padding,
            ),
            Overview(
              description: movie.overview,
              fontSize: fontSize,
              padding: padding,
            ),
            StreamBuilder(
              stream: bloc.newFavoriteState,
              builder: (ctx, snapshot) => AsyncSnapshotFavoriteBuilder(
                filmName: movie.title,
                fontSize: fontSize,
                snapshot: snapshot,
                toggleFavorite: () => bloc.toggleFavorite.add(null),
                bloc: bloc,
              ),
            )
          ]),
        ),
      ],
    );
  }
}
