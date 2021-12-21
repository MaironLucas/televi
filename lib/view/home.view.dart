import 'package:flutter/material.dart';
import 'package:tokenlab/controller/home.controller.dart';
import 'package:tokenlab/model/movie.model.dart';
import 'package:tokenlab/model/movieList.model.dart';
import 'package:tokenlab/view/widgets/progress.widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _controller = HomeController();

  @override
  void initState(){
    super.initState();
    _init();
  }

  _init() async{
    setState(() {
      _controller.loading = true;
    });
    await _controller.fetchAll();
    setState(() {
      _controller.loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("TokenLab Film List"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()async {
            await _controller.fetchAll(); 
            print(_controller.movieList[0].title.toString());
          },
        ),
        body: _controller.loading ? CenteredProgress() : Container(
          color: Colors.blue,
          child: ListView.builder(
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
                  child: Container(
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
                            child: Image.network(_controller.movieList[index].posterUrl,
                              errorBuilder: (context, error, stacktrace){
                                return Image.asset("lib/assets/not-found.png");
                              },
                            ),
                          ),
                          Text(_controller.movieList[index].title),
                        ],
                      ),
                  ),
                );
              },
              itemCount: _controller.movieList.length,
            ),
          ),
      );
  }
}