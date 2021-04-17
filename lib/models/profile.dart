import 'package:cloud_firestore/cloud_firestore.dart';

class Profile {
  final String userID;
  final String email;
  final String name;
  final String profileImage;
  final String phoneNumber;

  Profile({
    this.userID,
    this.email,
    this.name,
    this.profileImage,
    this.phoneNumber,
  });

  factory Profile.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data();
    return Profile(
        email: data['email'],
        name: data['name'],
        profileImage: data['profileImage'],
        userID: snapshot.id,
        phoneNumber: data['phoneNumber']);
  }
}
