import 'package:flutter/material.dart';
import 'package:televi/core/custom_route.dart';

final myTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
    cardColor: Colors.grey[850],
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CustomPageTransitionBuilder(),
      },
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(fontSize: 16),
      bodyText2: TextStyle(fontSize: 16),
      button: TextStyle(fontSize: 16),
    ));
