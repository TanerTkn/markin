import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:markin/core/services/database_path.dart';
import 'package:markin/models/profile.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;

class AuthService extends GetxController {
  Profile profile;

  Future<Profile> signInAccount(String email, String password) async {
    var cred = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    var res = await FirebaseFirestore.instance
        .collection(userPath)
        .doc(cred.user.uid)
        .get();

    profile = Profile.fromSnapshot(res);
    update();
    return profile;
  }

  Future<Profile> userToProfile() async {
    var snp = await FirebaseFirestore.instance
        .collection(userPath)
        .doc(firebaseAuth.currentUser.uid)
        .get();

    profile = Profile.fromSnapshot(snp);
    update();
    return profile;
  }

  Future<Profile> signUpAccount(String email, String password,
      String profileImage, String phoneNumber, String name) async {
    var cred = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    await FirebaseFirestore.instance
        .collection(userPath)
        .doc(cred.user.uid)
        .set({
      "email": cred.user.email,
      "name": name,
      "profileImage": profileImage,
      "phoneNumber": phoneNumber,
      "userID": cred.user.uid
    });

    profile = Profile(
      email: email,
      phoneNumber: phoneNumber,
      profileImage: profileImage,
      userID: cred.user.uid,
      name: name,
    );

    update();

    return profile;
  }
}
