import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../movie_cell.dart';

class MovieDataDesign extends StatelessWidget {
  late final MovieCell dataCell;

  MovieDataDesign(MovieCell this.dataCell);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //     textTheme: TextTheme(
      //   subtitle1: titlesTextStyle,
      //   bodyText1: infoTextStyle,
      // )),
      home: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'Release Date:',
                        // style: TextStyle(
                        //   fontSize: 15,
                        // ),
                        style: GoogleFonts.josefinSans(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            color: Colors.black),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        dataCell.release_date,
                        // style: const TextStyle(
                        //   fontSize: 15,
                        // ),
                        style: GoogleFonts.josefinSans(
                          fontWeight: FontWeight.w600,
                          //fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        'Runtime:',
                        style: GoogleFonts.josefinSans(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            color: Colors.black),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        dataCell.runtime.toString() + ' minutes',
                        // style: const TextStyle(
                        //   fontSize: 15,
                        // ),
                        // style: Theme.of(context).textTheme.bodyText1,
                        style: GoogleFonts.josefinSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                            color: Colors.black),
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
              Row(
                children: [
                  Text(
                    'Description:',
                    // style: TextStyle(
                    //   fontSize: 15,
                    // ),
                    //style: Theme.of(context).textTheme.subtitle1,
                    style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.w900,
                        fontSize: 22,
                        color: Colors.black),
                    textAlign: TextAlign.start,
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
