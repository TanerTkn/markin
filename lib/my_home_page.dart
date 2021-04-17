import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markin/widgets/bottom_item.dart';
import 'package:markin/widgets/maindrawer.dart';
import 'core/base/base_state.dart';
import 'view/home/home_view.dart';

class MyHomePage extends StatefulWidget {
  final PageController mainBottomController;
  const MyHomePage({Key key, this.mainBottomController}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with BaseState {
  TextStyle appBarTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
  int currentIndex = 0;
  final pages = [
    HomeView(),
    HomeView(),
    HomeView(),
    HomeView(),
  ];

  final pagesnames = [
    'Home',
    'Vote',
    'Events',
    'Profile',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: MainDrawer(),
      ),
      appBar: AppBar(
        title: Text(
          pagesnames[currentIndex],
          style: appBarTextStyle,
        ),
        actions: [
          IconButton(
              icon: SvgPicture.asset('assets/svgs/bell.svg',color: Colors.black,),
              onPressed: () {}),
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            BottomItem(
              icon: Icons.home_filled,
              isSelected: currentIndex == 0,
              onTap: () {
                setState(() {
                  currentIndex = 0;
                });
              },
            ),
            BottomItem(
              icon: Icons.how_to_vote,
              isSelected: currentIndex == 1,
              onTap: () {
                setState(() {
                  currentIndex = 1;
                });
              },
            ),
            BottomItem(
              icon: Icons.event_note,
              isSelected: currentIndex == 2,
              onTap: () {
                setState(() {
                  currentIndex = 2;
                });
              },
            ),
            BottomItem(
              icon: Icons.person_outline,
              isSelected: currentIndex == 3,
              onTap: () {
                setState(() {
                  currentIndex = 3;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
