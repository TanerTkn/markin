import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:markin/models/profile.dart';

import 'foundation.dart';

class Event {
  final Foundation foundation;
  final List<Profile> donateOwners;
  final int donateCount;
  final String id;
  final String title;
  final String content;
  final String image;
  final DateTime dateTime;

  Event(
      {this.foundation,
      this.donateOwners,
      this.donateCount,
      this.id,
      this.title,
      this.content,
      this.image,
      this.dateTime});

  factory Event.fromSnapshot(
      DocumentSnapshot snapshot, List<Profile> profileList) {
    var data = snapshot.data();
    return Event(
        donateOwners: profileList,
        donateCount: profileList.length,
        foundation: Foundation(data['foundationName']),
        content: data['content'],
        id: snapshot.id,
        title: data['title'],
        image: data['image']);
  }
}
