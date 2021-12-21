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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Teste"),
      ),
      body: _controller.loading
          ? CenteredProgress()
          : ListView(
              children: [
                Image.asset("lib/assets/img2.jpg"),
                const StatusWidget(),
                const GenreWidget(),
                const OverviewWidget()
              ],
            ),
    );
  }
}
