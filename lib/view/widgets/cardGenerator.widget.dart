import 'package:flutter/material.dart';
import 'package:tokenlab/controller/home.controller.dart';
import 'package:tokenlab/view/home.view.dart';
import 'package:tokenlab/view/widgets/MovieCard.widget.dart';

class CardGenerator extends StatelessWidget {
  const CardGenerator({ Key? key, required this.controller }) : super(key: key);

  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return  GestureDetector(
          onTap: (){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context)=>HomeView()
              )
            );
          },
          child: MovieCard(movie: controller.movieList[index]),
        );
      },
      itemCount: controller.movieList.length,
    );
  }
}