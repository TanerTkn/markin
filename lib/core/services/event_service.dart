import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:markin/core/services/auth_service.dart';
import 'package:markin/core/services/database_path.dart';
import 'package:markin/models/profile.dart';
import 'package:markin/models/event.dart';

class EventService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Event>> getEventsByUserID(String userID) async {
    var data = await _firestore
        .collection(eventPath)
        .where("ownerID", isEqualTo: firebaseAuth.currentUser.uid)
        .get();
    List<Event> campaignList = [];

    for (var i = 0; i < data.docs.length; i++) {
      var element = data.docs[i];
      List<Profile> count = await getJoinedUserCount(element.id);
      Event campaign = Event.fromSnapshot(element, count);
      campaignList.add(campaign);
    }

    return campaignList;
  }

  Future<void> voteEvent(String campaignID) async {
    await FirebaseFirestore.instance
        .collection(eventPath)
        .doc(campaignID)
        .collection(subUserPath)
        .doc(firebaseAuth.currentUser.uid)
        .set({"voted": true});
  }

  Future<List<Event>> getRecentEvents() async {
    var data = await _firestore.collection(eventPath).get();
    List<Event> campaignList = [];
    for (var i = 0; i < data.docs.length; i++) {
      var element = data.docs[i];
      List<Profile> count = await getJoinedUserCount(element.id);
      Event campaign = Event.fromSnapshot(element, count);
      campaignList.add(campaign);
    }
    return campaignList;
  }

  Future<List<Event>> getPopularEvents() async {
    var data = await _firestore.collection(eventPath).get();
    List<Event> campaignList = [];
    for (var i = 0; i < data.docs.length; i++) {
      var element = data.docs[i];
      List<Profile> count = await getJoinedUserCount(element.id);
      print(count.length);

      Event campaign = Event.fromSnapshot(element, count);
      campaignList.add(campaign);
    }
    campaignList.sort((a, b) {
      return a.donateCount.compareTo(b.donateCount);
    });
    return campaignList;
  }

  Future<List<Profile>> getJoinedUserCount(String campaignID) async {
    QuerySnapshot snapshot = await _firestore
        .collection(eventPath)
        .doc(campaignID)
        .collection(subUserPath)
        .get();
    List<Profile> profileList = [];
    for (var i = 0; i < snapshot.docs.length; i++) {
      var data = snapshot.docs[i];
      AuthService authService = AuthService();

      Profile profile = await authService.userToProfile(data.id);
      profileList.add(profile);
    }

    return profileList;
  }
}
