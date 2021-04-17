import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:markin/models/campaign_category.dart';

class Campaign {
  final String title;
  final String content;
  final String image;
  final int markCount;
  final String ownerID;
  final DateTime dateTime;
  final CampaignCategory category;

  Campaign({
    this.ownerID,
    this.title,
    this.content,
    this.image,
    this.markCount,
    this.dateTime,
    this.category,
  });

  factory Campaign.fromSnapshot(
      DocumentSnapshot snapshot, int length, CampaignCategory category) {
    return Campaign(
        content: snapshot.data()['content'],
        image: snapshot.data()['image'],
        ownerID: snapshot.data()['ownerID'],
        markCount: length,
        title: snapshot.data()['title'],
        category: category,
        dateTime: snapshot.data()['dateTime']);
  }
}
