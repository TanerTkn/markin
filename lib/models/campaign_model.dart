import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:markin/models/campaign_category.dart';
import 'package:markin/models/profile.dart';

class Campaign {
  final String title;
  final String id;
  final String content;
  final String image;
  final int markCount;
  final String ownerID;
  final DateTime dateTime;
  final CampaignCategory category;
  final List<Profile> participantsList;

  Campaign({
    this.ownerID,
    this.title,
    this.id,
    this.content,
    this.image,
    this.markCount,
    this.dateTime,
    this.category,
    this.participantsList,
  });

  factory Campaign.fromSnapshot(DocumentSnapshot snapshot,
      List<Profile> profileList, CampaignCategory category) {
    return Campaign(
        content: snapshot.data()['content'],
        image: snapshot.data()['image'],
        ownerID: snapshot.data()['ownerID'],
        markCount: profileList.length,
        id: snapshot.id,
        participantsList: profileList,
        title: snapshot.data()['title'],
        category: category,
        dateTime: snapshot.data()['dateTime'].toDate());
  }
}
