import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tokenlab/temas/theme.dart';
import 'package:tokenlab/view/home.view.dart';

Future main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'TokenLab Film List',
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      home: HomeView(),
    );
  }
}
