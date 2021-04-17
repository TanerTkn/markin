import 'package:get/get.dart';
import 'package:markin/models/profile.dart';

class UserController extends GetxController {
  Profile profile;

  updateProfile(Profile newprofile) {
    profile = newprofile;
  }

  clearProfile() {
    profile = null;
  }
}

UserController userController = Get.put(UserController());
