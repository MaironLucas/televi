import 'package:flutter/material.dart';
import 'package:tokenlab/controller/home.controller.dart';
import 'package:tokenlab/model/movie.model.dart';
import 'package:tokenlab/model/movieList.model.dart';
import 'package:tokenlab/view/widgets/cardGenerator.widget.dart';
import 'package:tokenlab/view/widgets/centerMessage.widget.dart';
import 'package:tokenlab/view/widgets/progress.widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _controller = HomeController();

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() async {
    setState(() {
      _controller.loading = true;
    });
    await _controller.fetchAll();
    setState(() {
      _controller.loading = false;
    });
  }

  _bodyConstructor() {
    if (_controller.loading) {
      return const CenteredProgress();
    } else {
      if (_controller.movieError != '') {
        return CenterMessage(
          message: _controller.movieError,
        );
      } else {
        return Container(
          color: Theme.of(context).backgroundColor,
          child: CardGenerator(
            controller: _controller,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TokenLab Film List"),
        centerTitle: true,
      ),
      body: _bodyConstructor(),
    );
  }
}
