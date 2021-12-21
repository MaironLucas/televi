import 'package:flutter/material.dart';

class GenreWidget extends StatelessWidget {
  const GenreWidget({Key? key}) : super(key: key);

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
              children: const [
                Chip(
                  backgroundColor: Colors.lightBlue,
                  padding: EdgeInsets.all(10),
                  label: Text("Drama"),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          );
        },
        itemCount: 2,
      ),
    );
  }
}
