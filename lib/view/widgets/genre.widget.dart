import 'package:flutter/material.dart';

class GenreWidget extends StatelessWidget {
  const GenreWidget({Key? key, required this.genres}) : super(key: key);

  final List<String> genres;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      height: 40,
      alignment: Alignment.center,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (ctx, index) {
          return Container(
            height: 40,
            child: Row(
              children: [
                Chip(
                  backgroundColor: Colors.lightBlue,
                  padding: const EdgeInsets.all(10),
                  label: Text(genres[index]),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          );
        },
        itemCount: genres.length,
      ),
    );
  }
}
