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
      // home: HomePage(),
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
                /*   BasicMovieCellList data = snapshot.data;
                //   return ListView.builder(
                //       itemCount: data!.length,
                //       itemBuilder: (BuildContext context, int index) {
                //         return Container(
                //           height: 75,
                //           color: Colors.white,
                //           child: Center(
                //             child: Text(data![index].title),
                //           ),
                //         );
                //       });*/
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const CircularProgressIndicator();
              //throw UnimplementedError();
            }),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  //Color background = Color(0xffeff1f3);
  Color background = Colors.black12;
  Color titles = Color(0xff6C9FE5);

  HomePage();

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
  _HomeState createState() => _HomeState();

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
//  leading: Icon(Icons.menu),

          title: const Text('Movies Info'),
          actions: [
            Icon(Icons.favorite),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Icon(Icons.search),
            ),
//    Icon(Icons.more_vert),
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
    // debugShowCheckedModeBanner: false,
    // );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
