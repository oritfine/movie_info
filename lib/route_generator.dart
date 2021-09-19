import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Designs/movie_page_design.dart';
import 'main.dart';
import 'movie_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/moviePage':
        if (args is MoviePageArgs) {
          return MaterialPageRoute(
            builder: (_) => MoviePage(
              data: args,
            ),
          );
        }
        return errorRoute();
      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
