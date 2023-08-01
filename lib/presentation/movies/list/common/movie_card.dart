import 'package:domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:televi/presentation/movies/list/common/personalized_image_network.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    required this.movie,
    Key? key,
  }) : super(key: key);

  final Movie movie;
  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(mediaWidth * 0.04),
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 3,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).orientation == Orientation.portrait
                ? mediaWidth * 0.30
                : mediaWidth * 0.25,
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? mediaHeight * 0.25
                : mediaHeight * 0.45,
            child: PersonalizedNetworkImage(
              url: movie.posterUrl,
              tipo: TipoDeImagem.poster,
            ),
          ),
          Expanded(
            child: Container(
              // width: 170,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(mediaWidth * 0.04),
              child: Text(
                movie.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? mediaWidth * 0.05
                          : mediaHeight * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlaceholderIcon extends StatelessWidget {
  const PlaceholderIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: const Color.fromRGBO(168, 188, 200, 1),
        child: const Center(
          child: Icon(Icons.collections_outlined),
        ),
      );
}
