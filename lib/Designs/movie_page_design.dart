import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../movie_cell.dart';

class MovieDataDesign extends StatelessWidget {
  late final MovieCell dataCell;
  MovieDataDesign(MovieCell this.dataCell);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                      const Text(
                        'Release Date:',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        dataCell.release_date,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const Text(
                        'Runtime:',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        dataCell.runtime.toString() + ' minutes',
                        style: const TextStyle(
                          fontSize: 15,
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
              Row(
                children: const [
                  Text(
                    'Description:',
                    style: TextStyle(
                      fontSize: 15,
                    ),
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
