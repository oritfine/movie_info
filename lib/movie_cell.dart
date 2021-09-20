import 'dart:convert';

import 'package:http/http.dart' as http;

class MovieCell {
  final int id;
  final String title;
  final int runtime;
  final String poster_path;
  final String release_date;
  final String overview;
  final double vote_average;
  final String tagline;

  MovieCell(this.runtime, this.poster_path, this.release_date, this.id,
      this.title, this.overview, this.vote_average, this.tagline);

  factory MovieCell.fromJson(Map<String, dynamic> json) {
    return MovieCell(
        json['runtime'],
        json['poster_path'],
        json['release_date'],
        json['id'],
        json['title'],
        json['overview'],
        json['vote_average'],
        json['tagline']);
  }
}

Future<MovieCell> fetchMovieCell(String id) async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/' +
          id +
          '?api_key=1db8cd6f7865f205ae261ea8b641f7f5'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return MovieCell.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load movie cell');
  }
}

class BasicMovieCell {
  final int id;
  final String title;
  final String poster_path;

  BasicMovieCell(
    this.poster_path,
    this.id,
    this.title,
  );

  factory BasicMovieCell.fromJson(Map<String, dynamic> json) {
    return BasicMovieCell(
      json['poster_path'],
      json['id'],
      json['title'],
    );
  }
}

Future<BasicMovieCell> fetchBasicMovieCell(String requestType) async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/' +
          requestType +
          '?api_key=1db8cd6f7865f205ae261ea8b641f7f5'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return BasicMovieCell.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load basic movie cell');
  }
}

class BasicMovieCellList {
  List<BasicMovieCell> _list;

  BasicMovieCellList(
    this._list,
  );

  List<BasicMovieCell> get list => _list;

  factory BasicMovieCellList.fromJson(Map<String, dynamic> json) {
    var result = json['results'];
    List<BasicMovieCell> resultsList = [];
    for (final movie in result) {
      resultsList.add(BasicMovieCell.fromJson(movie));
    }
    return BasicMovieCellList(resultsList);
  }
}

Future<BasicMovieCellList> fetchBasicMovieCellList(String requestType) async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/' +
          requestType +
          '?api_key=1db8cd6f7865f205ae261ea8b641f7f5'));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return BasicMovieCellList.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load basic movie cell List');
  }
}
