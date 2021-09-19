import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../movie_cell.dart';
import 'movie_cell_design.dart';

class HomePageDesign extends StatelessWidget {
  Color background = Color(0xffeff1f3);
  Color titles = Color(0xff6C9FE5);

  BasicMovieCellList _movieList;

  HomePageDesign(
    this._movieList,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
//  leading: Icon(Icons.menu),
          title: const Text('Movie Info'),
          actions: [
            Icon(Icons.favorite),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Icon(Icons.search),
            ),
//    Icon(Icons.more_vert),
          ],
          backgroundColor: titles,
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            MovieCellDesign(_movieList.list[0]),
            InkWell(
              onTap: () async {},
              child: Container(
                padding: const EdgeInsets.all(8),
                child: const Text('movie name 2'),
                color: Colors.teal[200],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text('movie name 3'),
              color: Colors.teal[300],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text('movie name 4'),
              color: Colors.teal[400],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text('movie name 5'),
              color: Colors.teal[500],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text('movie name 6'),
              color: Colors.teal[600],
            ),
          ],
        ));
    // debugShowCheckedModeBanner: false,
    // );
  }
}
