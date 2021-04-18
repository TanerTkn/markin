import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markin/constant/color_constant.dart';
import 'package:markin/core/extension/context_extension.dart';
import 'package:markin/core/services/auth_service.dart';
import 'package:markin/core/services/campaign_service.dart';
import 'package:markin/models/campaign_model.dart';
import 'package:markin/models/profile.dart';
import 'package:markin/widgets/vote_widget.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  CampaignService campaignService = CampaignService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5e5ff),
      body: FutureBuilder<List<Campaign>>(
          future: campaignService
              .getCampaignsByUserID(firebaseAuth.currentUser.uid),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              children: [
                Container(
                  child: Stack(
                    children: [
                      buildStatic(context),
                      buildPerson(context),
                    ],
                  ),
                ),
                SizedBox(
                  height: context.sizeH(0.03),
                ),
              ]..addAll(snapshot.data.map((data) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: VoteWidget(
                      data: data,
                    ),
                  ))),
            );
          }),
    );
  }

  Padding buildCards(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            //height: 300,
            child: Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Last Created Campaign',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: context.sizeH(0.02),
                    ),
                    Image.network(
                        "https://i.milliyet.com.tr/GazeteHaberIciResim/2017/11/21/fft16_mf10284922.Jpeg"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  FutureBuilder buildPerson(BuildContext context) {
    AuthService authService = AuthService();
    return FutureBuilder(
      future: authService.userToProfile(firebaseAuth.currentUser.uid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        Profile profile = snapshot.data;
        return Container(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height / 2.5,
              maxWidth: MediaQuery.of(context).size.width),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildImage(context, profile.profileImage),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(profile.name,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  SizedBox buildImage(BuildContext context, String imageURL) {
    return SizedBox(
      height: context.sizeH(0.2),
      width: context.sizeW(0.4),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageURL),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFF5F6F9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Color(0xFF752DEB)),
                  ),
                ),
                onPressed: () async {},
                child: SvgPicture.asset(
                  'assets/svgs/cameraicon.svg',
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildStatic(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height / 2,
          maxWidth: MediaQuery.of(context).size.width),
      decoration: BoxDecoration(
        color: ColorConstants.instance.electricViolet,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              buildText1(),
              buildText2(),
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder buildText1() {
    CampaignService campaignService = CampaignService();
    return FutureBuilder<List<Campaign>>(
        future:
            campaignService.getCampaignsByUserID(firebaseAuth.currentUser.uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(snapshot.data.length.toString(),
                  style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.w500)),
              Text('Campaign',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400))
            ],
          );
        });
  }

  Column buildText2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('?',
            style: TextStyle(
                fontSize: 23,
                color: Colors.white,
                fontWeight: FontWeight.w500)),
        Text('Signature',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400))
      ],
    );
  }
}
