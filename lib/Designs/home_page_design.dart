import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../choose_list_widget.dart';
import '../data.dart';
import '../movie_cell.dart';
import 'movie_cell_design.dart';

class HomePageDesign extends StatefulWidget {
  BasicMovieCellList _movieList;

  HomePageDesign(
    this._movieList,
  );

  @override
  _HomePageDesignState createState() => _HomePageDesignState();
}

class _HomePageDesignState extends State<HomePageDesign> {
  Color background = Color(0xffC9CDD3);
  List<String> types = ['top rated', 'popular', 'now playing', 'upcoming'];
  Color titles = Color(0xff124559);
  int? _value = 0;

  @override
  Widget build(BuildContext context) {
    Data provider = Provider.of<Data>(context);
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'Movies Info',
          style: GoogleFonts.josefinSans(
              fontWeight: FontWeight.w700, fontSize: 25, color: Colors.white),
        ),
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
      body: Column(
        children: [
          Container(
            height: 50,
            child: Row(
              children: List<Widget>.generate(
                4,
                (int index) {
                  return ChoiceChip(
                    selectedColor: Colors.black,
                    disabledColor: titles,
                    label: Text(
                      types[index],
                      style: GoogleFonts.josefinSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                    selected: _value == index,
                    onSelected: (bool selected) {
                      setState(() {
                        _value = selected ? index : null;
                        provider.setIndex(_value!);
                      });
                    },
                  );
                },
              ).toList(),
            ),
          ),
          Expanded(
            child: GridView.count(
              // shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.all(20),
              childAspectRatio: 0.65,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: List.generate(widget._movieList.list.length, (index) {
                return MovieCellDesign(widget._movieList.list[index]);
              }),
            ),
          ),
        ],
      ),
    );
  }
}

// class HomePageDesign extends StatefulWidget {
//   Color background = Color(0xffC9CDD3);
//   List<String> types = ['popular', 'top rated', 'latest'];
//   Color titles = Color(0xff124559);
//
//   BasicMovieCellList _movieList;
//
//   HomePageDesign(
//     this._movieList,
//   );
//
//   int? _value = 2;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: background,
//       appBar: AppBar(
// //  leading: Icon(Icons.menu),
//         title: Text(
//           'Movies Info',
//           style: GoogleFonts.josefinSans(
//               fontWeight: FontWeight.w700, fontSize: 25, color: Colors.white),
//         ),
//         actions: [
//           // IconButton(
//           //   icon: Icon(Icons.arrow_drop_down),
//           //   onPressed: ChooseListWidget,
//           // ),
//           Icon(Icons.favorite),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 30),
//             child: Icon(Icons.search),
//           ),
// //    Icon(Icons.more_vert),
//         ],
//         backgroundColor: titles,
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: 50,
//             child: Row(
//               children: List<Widget>.generate(
//                 3,
//                 (int index) {
//                   return ChoiceChip(
//                     label: Text(
//                       types[index],
//                       style: GoogleFonts.josefinSans(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 20,
//                           color: Colors.white),
//                     ),
//                     selected: _value == index,
//                     backgroundColor: titles,
//                     onSelected: (bool selected) {
//                       _value = selected ? index : null;
//                     },
//                   );
//                 },
//               ).toList(),
//             ),
//           ),
//           Expanded(
//             child: GridView.count(
//               // shrinkWrap: true,
//               primary: false,
//               padding: const EdgeInsets.all(20),
//               childAspectRatio: 0.65,
//               crossAxisSpacing: 10,
//               mainAxisSpacing: 10,
//               crossAxisCount: 2,
//               children: List.generate(_movieList.list.length, (index) {
//                 return MovieCellDesign(_movieList.list[index]);
//               }),
//             ),
//           ),
//         ],
//       ),
//     );
//
//     // debugShowCheckedModeBanner: false,
//   }
// }
