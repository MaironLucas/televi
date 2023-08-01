import 'package:flutter/material.dart';

class CentralizedProgress extends StatelessWidget {
  const CentralizedProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Center(
        child: CircularProgressIndicator(),
      );
}
