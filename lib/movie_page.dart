import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_info/movie_cell.dart';

class MoviePage extends StatefulWidget {
  final String data;
  MoviePage({required this.data});
  @override
  /* Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("movie"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // children: <Widget>[
          //   const Text(
          //     'You have pushed the button this many times:',
          //   ),
          //   Text(
          //     '$_counter',
          //     style: Theme.of(context).textTheme.headline4,
          //   ),
          // ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),  This trailing comma makes auto-formatting nicer for build methods.
    );
  }*/

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MoviePage> {
  late Future<MovieCell> futureMovieCell;

  @override
  void initState() {
    super.initState();

    futureMovieCell = fetchMovieCell('500');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<MovieCell>(
            future: futureMovieCell,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
                //TODO to return designed object
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
