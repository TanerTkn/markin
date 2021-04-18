import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markin/core/services/auth_service.dart';
import 'package:markin/models/profile.dart';
import 'package:markin/my_home_page.dart';
import 'package:markin/view/login/sign_in.dart';
import '../constant/color_constant.dart';
import '../core/extension/context_extension.dart';
import '../view/home/home_view.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthService authService = Get.put(AuthService());

    return SizedBox(
      width: context.sizeW(0.8),
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FutureBuilder<Profile>(
                future: authService.userToProfile(firebaseAuth.currentUser.uid),
                builder: (context, snapshot) {
                  Profile profile = snapshot.data;
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return DrawerHeader(
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
                              backgroundImage:
                                  NetworkImage(profile.profileImage),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            profile.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            profile.email,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: ColorConstants.instance.perfume,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
            Card(
              child: ListTile(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeView(),
                    )),
                leading: Icon(
                  Icons.home_filled,
                  color: ColorConstants.instance.perfume,
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
                  color: ColorConstants.instance.perfume,
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
                  color: ColorConstants.instance.perfume,
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
                  color: ColorConstants.instance.perfume,
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
                  color: ColorConstants.instance.perfume,
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
                onTap: () {
                  AuthService authService = AuthService();
                  authService.logout();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignIn(),
                      ));
                },
                leading: Icon(
                  Icons.logout,
                  color: ColorConstants.instance.perfume,
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
