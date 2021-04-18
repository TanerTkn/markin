import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markin/core/extension/context_extension.dart';
import 'package:markin/utilities/textstyle.dart';
import 'package:markin/view/events/events_view.dart';
import 'package:markin/view/profile/profile_view.dart';
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
  int currentIndex = 0;
  final pages = [
    HomeView(),
    EventsView(),
    ProfileView(),
  ];

  final pagesnames = [
    'Home',
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
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          pagesnames[currentIndex],
          style: appBarTextStyle,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: IconButton(
                icon: SvgPicture.asset(
                  'assets/svgs/bell.svg',
                  color: Colors.black,
                ),
                onPressed: () {}),
          ),
        ],
      ),
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        height: context.sizeH(0.07),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            BottomItem(
              icon: 'assets/svgs/home.svg',
              isSelected: currentIndex == 0,
              onTap: () {
                setState(() {
                  currentIndex = 0;
                });
              },
            ),
            BottomItem(
              icon: 'assets/svgs/events.svg',
              isSelected: currentIndex == 1,
              onTap: () {
                setState(() {
                  currentIndex = 1;
                });
              },
            ),
            BottomItem(
              icon: 'assets/svgs/person.svg',
              isSelected: currentIndex == 2,
              onTap: () {
                setState(() {
                  currentIndex = 2;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
