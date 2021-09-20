import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_info/movie_cell.dart';
import 'Designs/movie_page_design.dart';

class MoviePage extends StatefulWidget {
  final MoviePageArgs data;

  MoviePage({required this.data});

  @override
  _MyAppState createState() => _MyAppState(this.data);
}

class _MyAppState extends State<MoviePage> {
  Color titles = Color(0xff124559);
  late Future<MovieCell> futureMovieCell;
  MoviePageArgs _args;

  _MyAppState(this._args);

  @override
  void initState() {
    super.initState();

    futureMovieCell = fetchMovieCell(_args.id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            _args.title,
            style: GoogleFonts.josefinSans(
                fontWeight: FontWeight.w700, fontSize: 25, color: Colors.white),
          ),
          backgroundColor: titles,
        ),
        body: Center(
          child: FutureBuilder<MovieCell>(
            future: futureMovieCell,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return MovieDataDesign(snapshot.data!);
                //return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
