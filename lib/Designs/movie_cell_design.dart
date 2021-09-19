import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../movie_cell.dart';
import 'movie_page_design.dart';

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
        padding: const EdgeInsets.all(8),
        child: Text(dataCell.title),
        color: Colors.teal[100],
      ),
    );
    throw UnimplementedError();
  }
}
