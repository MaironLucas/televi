import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("TokenLab Film List"),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.blue,
          child: ListView.builder(
              itemBuilder: (ctx, index) {
                return  Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          height: 150,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("https://br.web.img3.acsta.net/pictures/17/10/03/20/30/4963404.jpg"),
                            ),
                          ),
                        ),
                        const Text("Os Sopranos"),
                      ],
                    ),
                );
              },
              itemCount: 4,
            ),
          ),
      );
  }
}