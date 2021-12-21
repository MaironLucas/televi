import 'package:flutter/material.dart';

class CenterMessage extends StatelessWidget {
  const CenterMessage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: const [
          Icon(
            Icons.warning,
            color: Colors.black,
            size: 64.0
          ),
          SizedBox(height: 10.0,),
          Text(
            "Erro",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}