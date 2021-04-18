import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:markin/core/services/auth_service.dart';
import 'package:markin/core/services/database_path.dart';
import 'package:markin/models/campaign_category.dart';
import 'package:markin/models/campaign_model.dart';
import 'package:markin/models/profile.dart';

class CampaignService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Campaign>> getCampaignsByUserID(String userID) async {
    var data = await _firestore
        .collection(campaignPath)
        .where("ownerID", isEqualTo: firebaseAuth.currentUser.uid)
        .get();
    List<Campaign> campaignList = [];

    for (var i = 0; i < data.docs.length; i++) {
      var element = data.docs[i];
      List<Profile> count = await getJoinedUserCount(element.id);
      var category = stringToCampaignCategories(element.data()['category']);
      Campaign campaign = Campaign.fromSnapshot(element, count, category);
      campaignList.add(campaign);
    }

    return campaignList;
  }

  Future<void> voteCampaign(String campaignID) async {
    await FirebaseFirestore.instance
        .collection(campaignPath)
        .doc(campaignID)
        .collection(subUserPath)
        .doc(firebaseAuth.currentUser.uid)
        .set({"voted": true});
  }

  Future<List<Campaign>> getRecentCampaigns() async {
    var data = await _firestore.collection(campaignPath).get();
    List<Campaign> campaignList = [];
    for (var i = 0; i < data.docs.length; i++) {
      var element = data.docs[i];
      List<Profile> count = await getJoinedUserCount(element.id);
      var category = stringToCampaignCategories(element.data()['category']);
      Campaign campaign = Campaign.fromSnapshot(element, count, category);
      campaignList.add(campaign);
    }
    return campaignList;
  }

  Future<List<Campaign>> getPopularCampaigns() async {
    var data = await _firestore.collection(campaignPath).get();
    List<Campaign> campaignList = [];
    for (var i = 0; i < data.docs.length; i++) {
      var element = data.docs[i];
      List<Profile> count = await getJoinedUserCount(element.id);
      print(count.length);
      var category = stringToCampaignCategories(element.data()['category']);

      Campaign campaign = Campaign.fromSnapshot(element, count, category);
      campaignList.add(campaign);
    }
    campaignList.sort((a, b) {
      return a.markCount.compareTo(b.markCount);
    });
    return campaignList;
  }

  Future<List<Profile>> getJoinedUserCount(String campaignID) async {
    QuerySnapshot snapshot = await _firestore
        .collection(campaignPath)
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

  Future<List<Campaign>> getCampaignsByCategory(
      CampaignCategory campaignCategory) async {
    String campaignString = campaignToString(campaignCategory);
    print("started");
    print(campaignString);
    var data = await _firestore
        .collection(campaignPath)
        .where("category", isEqualTo: campaignString)
        .get();
    List<Campaign> campaignList = [];
    for (var i = 0; i < data.docs.length; i++) {
      var element = data.docs[i];
      List<Profile> count = await getJoinedUserCount(element.id);
      Campaign campaign =
          Campaign.fromSnapshot(element, count, campaignCategory);
      campaignList.add(campaign);
    }
    return campaignList;
  }

  Future addCampaign(
      {String content,
      String title,
      String imageURL,
      CampaignCategory campaignCategory}) async {
    var _campaignCategory = campaignToString(campaignCategory);
    await _firestore.collection(campaignPath).add({
      "content": content,
      "title": title,
      "image": imageURL,
      "category": _campaignCategory,
      "ownerID": firebaseAuth.currentUser.uid,
      "dateTime": DateTime.now()
    });
  }

  CampaignCategory stringToCampaignCategories(String category) {
    switch (category) {
      case "education":
        return CampaignCategory.education;
        break;
      case "medical":
        return CampaignCategory.medical;
        break;
      case "family":
        return CampaignCategory.family;
        break;
      case "other":
        return CampaignCategory.other;
        break;
      case "animal":
        return CampaignCategory.animal;
        break;
      case "violence":
        return CampaignCategory.violence;
        break;
      case "environment":
        return CampaignCategory.environment;
        break;
      default:
        return CampaignCategory.other;
    }
  }

  String campaignToString(CampaignCategory campaignCategory) {
    switch (campaignCategory) {
      case CampaignCategory.education:
        return "education";
        break;
      case CampaignCategory.animal:
        return "animal";
        break;
      case CampaignCategory.family:
        return "family";
        break;
      case CampaignCategory.medical:
        return "medical";
        break;
      case CampaignCategory.other:
        return "other";
        break;
      case CampaignCategory.violence:
        return "violence";
        break;
      case CampaignCategory.environment:
        return "environment";
        break;
      default:
        return "others";
    }
  }
}
