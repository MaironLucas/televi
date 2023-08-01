import 'package:flutter/material.dart';

class BottomTabInfo {
  const BottomTabInfo({
    required this.title,
    required this.iconData,
    required this.key,
    required this.initialRoute,
  });

  final String title;
  final Icon iconData;
  final GlobalKey<NavigatorState> key;
  final String initialRoute;
}
