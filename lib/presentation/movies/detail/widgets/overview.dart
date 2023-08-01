import 'package:flutter/material.dart';

class Overview extends StatelessWidget {
  const Overview({
    required this.description,
    required this.padding,
    required this.fontSize,
    Key? key,
  }) : super(key: key);

  final String description;
  final double padding;
  final double fontSize;

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(padding),
        child: Text(
          description,
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: fontSize),
        ),
      );
}
