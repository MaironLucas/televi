import 'package:flutter/material.dart';
import 'package:tokenlab/view/widgets/genre.widget.dart';
import 'package:tokenlab/view/widgets/overview.widget.dart';
import 'package:tokenlab/view/widgets/status.widget.dart';

class MovieDetailView extends StatelessWidget {
  const MovieDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Teste"),
      ),
      body: ListView(
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
