import 'dart:convert';
import 'package:http/http.dart' as http;

class MovieCell {
  final int id;
  final String title;
  final int runtime;
  final String poster_path;
  final String release_date;

  MovieCell(
    this.runtime,
    this.poster_path,
    this.release_date,
    this.id,
    this.title,
  );

  factory MovieCell.fromJson(Map<String, dynamic> json) {
    return MovieCell(json['runtime'], json['poster_path'], json['release_date'],
        json['id'], json['title']);
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
