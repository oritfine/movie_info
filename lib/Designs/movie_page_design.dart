import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../movie_cell.dart';

class MovieDataDesign extends StatelessWidget {
  //Color background = Colors.grey.shade300;
  Color background = Color(0xffC9CDD3);
  Color titles = Color(0xff124559);
  late final MovieCell dataCell;

  MovieDataDesign(MovieCell this.dataCell);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Release Date:',
                        style: GoogleFonts.josefinSans(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            color: Colors.black),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 5),
                      Text(
                        dataCell.release_date,
                        // style: TextStyle(
                        //   fontSize: 15,
                        // ),
                        //style: Theme.of(context).textTheme.subtitle1,
                        style: GoogleFonts.josefinSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Runtime:',
                        style: GoogleFonts.josefinSans(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            color: Colors.black),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 5),
                      Text(
                        dataCell.runtime.toString() + ' minutes',
                        // style: Theme.of(context).textTheme.bodyText1,
                        style: GoogleFonts.josefinSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                            color: Colors.black),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Popularity:',
                        style: GoogleFonts.josefinSans(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            color: Colors.black),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 5),
                      Text(
                        dataCell.popularity.toString(),
                        style: GoogleFonts.josefinSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.network(
                        'https://image.tmdb.org/t/p/original/' +
                            dataCell.poster_path,
                        fit: BoxFit.fitHeight,
                        height: 300,
                        width: 220,
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Overview:',
                        style: GoogleFonts.josefinSans(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            color: Colors.black),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          dataCell.overview,
                          style: GoogleFonts.josefinSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          maxLines: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    //TODO throw UnimplementedError();
  }
}

class MoviePageArgs {
  final String _id;
  final String _title;

  MoviePageArgs(this._id, this._title);

  String get id => _id;

  String get title => _title;
}
