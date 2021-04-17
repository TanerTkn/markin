import 'package:flutter/material.dart';

import '../constant/color_constant.dart';
import '../core/extension/context_extension.dart';
import '../view/home/home_view.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.sizeW(0.8),
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(''),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Taner Tekin',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'tanertekin@gmail.com',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: ColorConstants.instance.primaryColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeView(),
                    )),
                leading: Icon(
                  Icons.home_filled,
                  color: ColorConstants.instance.primaryColor,
                  size: 28,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeView(),
                    )),
                leading: Icon(
                  Icons.how_to_vote,
                  color: ColorConstants.instance.primaryColor,
                ),
                title: Text(
                  'Vote',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeView(),
                    )),
                leading: Icon(
                  Icons.event_note,
                  color: ColorConstants.instance.primaryColor,
                ),
                title: Text(
                  'Events',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.person_outline,
                  color: ColorConstants.instance.primaryColor,
                ),
                title: Text(
                  'Profile',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.info_outlined,
                  color: ColorConstants.instance.primaryColor,
                ),
                title: Text(
                  'MarkIn Info',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeView(),
                    )),
                leading: Icon(
                  Icons.logout,
                  color: ColorConstants.instance.primaryColor,
                ),
                title: Text(
                  'Log Out',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
