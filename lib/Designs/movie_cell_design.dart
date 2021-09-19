import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../movie_cell.dart';
import 'movie_page_design.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieCellDesign extends StatelessWidget {
  late final BasicMovieCell dataCell;

  MovieCellDesign(BasicMovieCell this.dataCell);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/moviePage',
            arguments: MoviePageArgs(
              dataCell.id.toString(),
              dataCell.title,
            ));
      },
      child: Container(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.teal[100],
            border: Border.all(
              color: Colors.black,
              width: 2.0,
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                child: Text(
                  dataCell.title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.josefinSans(
                      fontWeight: FontWeight.w700, fontSize: 22),
                ),
              ),
              Image.network(
                'https://image.tmdb.org/t/p/original/' + dataCell.poster_path,
                fit: BoxFit.fitHeight,
                height: 230,
                //  width: 200,
                alignment: Alignment.center,
              ),
            ],
          )),
    );

    throw UnimplementedError();
  }
}
