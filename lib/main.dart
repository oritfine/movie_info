import 'package:flutter/material.dart';
import 'package:movie_info/movie_cell.dart';
import 'package:movie_info/route_generator.dart';
import 'package:provider/provider.dart';
import 'Designs/home_page_design.dart';
import 'data.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => Data())],
    child: MyApp(),
  )); //runApp
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class _HomeState extends State<HomePage> {
  late List<Future<BasicMovieCellList>> futureBasicMovieCellList = [];

  _HomeState();

  @override
  void initState() {
    super.initState();
    futureBasicMovieCellList.add(fetchBasicMovieCellList('top_rated'));
    futureBasicMovieCellList.add(fetchBasicMovieCellList('popular'));
    futureBasicMovieCellList.add(fetchBasicMovieCellList('now_playing'));
    futureBasicMovieCellList.add(fetchBasicMovieCellList('upcoming'));
  }

  @override
  Widget build(BuildContext context) {
    Data provider = Provider.of<Data>(context);
    return Scaffold(
      body: Center(
        child: FutureBuilder<BasicMovieCellList>(
            future: futureBasicMovieCellList[provider.index],
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return HomePageDesign(snapshot.data!);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  Color background = Colors.black12;
  Color titles = Color(0xff6C9FE5);

  HomePage();

  @override
  _HomeState createState() => _HomeState();

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          title: const Text('Movies Info'),
          actions: const [
            Icon(Icons.favorite),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Icon(Icons.search),
            ),
          ],
          backgroundColor: titles,
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(400),
          crossAxisSpacing: 100,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
        ));
  }
}
