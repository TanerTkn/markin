import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markin/core/services/auth_service.dart';
import 'package:markin/my_home_page.dart';

import 'package:markin/view/login/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: firebaseAuth.currentUser == null ? SignUp() : MyHomePage(),
    );
  }
}
