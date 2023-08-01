import 'package:domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:televi/presentation/movies/detail/movie_detail_view.dart';
import 'package:televi/presentation/movies/list/common/movie_card.dart';

class CardGenerator extends StatelessWidget {
  const CardGenerator({
    required this.movies,
    Key? key,
  }) : super(key: key);

  final List<Movie> movies;
  @override
  Widget build(BuildContext context) => ListView.builder(
        itemBuilder: (ctx, index) => GestureDetector(
          onTap: () {
            Navigator.of(
              context,
              rootNavigator: false,
            ).pushNamed('${MovieDetailView.routeName}/${movies[index].id}');
          },
          child: MovieCard(movie: movies[index]),
        ),
        itemCount: movies.length,
      );
}
