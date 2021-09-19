import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_info/movie_cell.dart';

class MoviePage extends StatefulWidget {
  final String data;

  MoviePage({required this.data});
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
  _MyAppState createState() => _MyAppState(this.data);
}

class _MyAppState extends State<MoviePage> {
  late Future<MovieCell> futureMovieCell;
  String data;
  _MyAppState(this.data);

  @override
  void initState() {
    super.initState();

    futureMovieCell = fetchMovieCell(data);
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
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text('Fetch Data Example'),
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
