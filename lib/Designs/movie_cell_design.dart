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
          decoration: BoxDecoration(
            color: Color(0xff606060),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                child: Flexible(
                  child: Text(
                    dataCell.title,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 21,
                        color: Colors.white),
                  ),
                ),
              ),
              Image.network(
                'https://image.tmdb.org/t/p/original/' + dataCell.poster_path,
                fit: BoxFit.fitHeight,
                height: 215,
                //  width: 200,
                alignment: Alignment.center,
              ),
            ],
          )),
    );
  }
}
