import 'package:flutter/material.dart';

class Genres extends StatelessWidget {
  const Genres({
    required this.genres,
    required this.fontSize,
    required this.padding,
    Key? key,
  }) : super(key: key);

  final List<String> genres;
  final double fontSize;
  final double padding;

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaHeight = MediaQuery.of(context).size.height;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final height = isPortrait ? mediaHeight * 0.065 : mediaWidth * 0.065;

    return Container(
      padding: EdgeInsets.only(left: padding, right: padding),
      height: height,
      alignment: Alignment.center,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (ctx, index) => Container(
          height: height,
          child: Row(
            children: [
              Chip(
                backgroundColor:
                    Theme.of(context).primaryColor.withOpacity(0.5),
                padding: EdgeInsets.all(padding),
                label: Text(
                  genres[index],
                  style: TextStyle(
                    fontSize: fontSize,
                  ),
                ),
              ),
              SizedBox(
                width: padding,
              ),
            ],
          ),
        ),
        itemCount: genres.length,
      ),
    );
  }
}
