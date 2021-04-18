import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:markin/core/controllers/user_controller.dart';
import 'package:markin/core/services/database_path.dart';
import 'package:markin/models/profile.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;

class AuthService {
  Future<Profile> signInAccount(String email, String password) async {
    var cred = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    var res = await FirebaseFirestore.instance
        .collection(userPath)
        .doc(cred.user.uid)
        .get();

    var profile = Profile.fromSnapshot(res);
    return profile;
  }

  Future<void> resetPassword(String email) async {
    return await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> logout() async {
    firebaseAuth.signOut();
    userController.clearProfile();
  }

  Future<Profile> userToProfile() async {
    var snp = await FirebaseFirestore.instance
        .collection(userPath)
        .doc(firebaseAuth.currentUser.uid)
        .get();

    var profile = Profile.fromSnapshot(snp);
    return profile;
  }

  Future<Profile> signUpAccount(
      String email, String password, String profileImage, String name) async {
    var cred = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    await FirebaseFirestore.instance
        .collection(userPath)
        .doc(cred.user.uid)
        .set({
      "email": cred.user.email,
      "name": name,
      "profileImage": profileImage,
      "userID": cred.user.uid
    });

    var profile = Profile(
      email: email,
      profileImage: profileImage,
      userID: cred.user.uid,
      name: name,
    );

    return profile;
  }
}
