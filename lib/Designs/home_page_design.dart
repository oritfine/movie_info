import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../movie_cell.dart';
import 'movie_cell_design.dart';

class HomePageDesign extends StatelessWidget {
  //Color background = Color(0xffeff1f3);
  Color background = Color(0xffC9CDD3);

  //Color background = Color(0xffE7ECEF);
  //Color titles = Color(0xff6C9FE5);
  Color titles = Color(0xff124559);

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
        title: Text(
          'Movies Info',
          style: GoogleFonts.josefinSans(
              fontWeight: FontWeight.w700, fontSize: 25, color: Colors.white),
        ),
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
        childAspectRatio: 0.65,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: List.generate(_movieList.list.length, (index) {
          return MovieCellDesign(_movieList.list[index]);
        }),
      ),
    );

    // debugShowCheckedModeBanner: false,
  }
}
