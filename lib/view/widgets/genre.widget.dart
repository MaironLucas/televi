import 'package:flutter/material.dart';

class GenreWidget extends StatelessWidget {
  const GenreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Chip(
              backgroundColor: Colors.lightBlue,
              padding: EdgeInsets.all(10),
              label: Text("Drama"),
            ),
            SizedBox(
              width: 10,
            ),
            Chip(
              backgroundColor: Colors.lightBlue,
              padding: EdgeInsets.all(10),
              label: Text("Suspense"),
            ),
          ],
        ),
      ),
    );
  }
}
