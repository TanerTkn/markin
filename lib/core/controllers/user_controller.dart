import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  User profile;

  updateProfile(User newprofile) {
    profile = newprofile;
  }

  clearProfile() {
    profile = null;
  }
}

UserController userController = Get.put(UserController());
