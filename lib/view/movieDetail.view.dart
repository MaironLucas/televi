import 'package:flutter/material.dart';
import 'package:tokenlab/controller/detail.controller.dart';
import 'package:tokenlab/view/widgets/genre.widget.dart';
import 'package:tokenlab/view/widgets/overview.widget.dart';
import 'package:tokenlab/view/widgets/progress.widget.dart';
import 'package:tokenlab/view/widgets/status.widget.dart';

class MovieDetailView extends StatefulWidget {
  const MovieDetailView({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  State<MovieDetailView> createState() => _MovieDetailViewState();
}

class _MovieDetailViewState extends State<MovieDetailView> {
  final _controller = DetailController();

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() async {
    setState(() {
      _controller.loading = true;
    });
    await _controller.fetchMovie(widget.id);
    setState(() {
      _controller.loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.loading
        ? Scaffold(appBar: AppBar(title: Text("")), body: CenteredProgress())
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(_controller.movie.title),
            ),
            body: ListView(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  child: Image.network(
                    _controller.movie.backdropUrl,
                    errorBuilder: (context, error, stacktrace) {
                      return Image.asset("lib/assets/not-found.png");
                    },
                    fit: BoxFit.cover,
                  ),
                ),
                StatusWidget(
                  avgNote: _controller.movie.voteAverage,
                  date: _controller.movie.releaseDate,
                ),
                GenreWidget(
                  genres: _controller.movie.genres,
                ),
                OverviewWidget(
                  description: _controller.movie.overview,
                ),
              ],
            ),
          );
  }
}
