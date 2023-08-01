import 'package:flutter/material.dart';
import 'package:televi/presentation/movies/list/common/movie_card.dart';

enum TipoDeImagem {
  poster,
  backdrop,
}

class PersonalizedNetworkImage extends StatelessWidget {
  const PersonalizedNetworkImage(
      {required this.url, required this.tipo, Key? key})
      : super(key: key);

  final String url;
  final TipoDeImagem tipo;
  @override
  Widget build(BuildContext context) => Image.network(
        url,
        loadingBuilder: (ctx, child, progress) =>
            progress == null ? child : const LinearProgressIndicator(),
        frameBuilder: (ctx, child, frame, wasLoaded) => wasLoaded
            ? child
            : AnimatedOpacity(
                opacity: frame == null ? 0 : 1,
                duration: const Duration(seconds: 1),
                curve: Curves.easeIn,
                child: child,
              ),
        errorBuilder: (ctx, exception, stackTrace) =>
            tipo == TipoDeImagem.backdrop
                ? Image.asset('assets/images/not-found2.jpg')
                : const PlaceholderIcon(),
      );
}
