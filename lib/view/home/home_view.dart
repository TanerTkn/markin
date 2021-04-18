import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:markin/core/extension/context_extension.dart';
import 'package:markin/core/services/campaign_service.dart';
import 'package:markin/models/campaign_model.dart';
import 'package:markin/utilities/textstyle.dart';
import 'package:markin/view/home/create_markins/create_markins.dart';
import 'package:markin/widgets/categories.dart';
import 'package:markin/widgets/vote_widget.dart';
import '../../core/base/base_state.dart';
import 'package:markin/constant/color_constant.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with BaseState {
  CampaignService service = CampaignService();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Categories(),
          startNewMarkin(context),
          SizedBox(height: context.sizeH(0.01)),
          featuredMarkIns(),
          SizedBox(height: context.sizeH(0.01)),
          featuredContainers(context),
          popularMarkIns(),
          popularContainers(context),
        ],
      ),
    );
  }

  Container popularContainers(BuildContext context) {
    return Container(
      height: context.sizeH(0.4),
      width: double.infinity,
      child: FutureBuilder(
        future: service.getPopularCampaigns(),
        builder: (context, AsyncSnapshot<List<Campaign>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            scrollDirection: Axis.horizontal,
            children: snapshot.data
                .map<Widget>((data) => VoteWidget(
                      data: data,
                    ))
                .toList(),
          );
        },
      ),
    );
  }

  Padding popularMarkIns() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Popular MarkIns",
            style: appBarTextStyle,
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                "See all",
                style: TextStyle(color: ColorConstants.instance.purpleHeart, fontSize: 17, fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }

  Container featuredContainers(BuildContext context) {
    return Container(
      height: context.sizeH(0.4),
      width: double.infinity,
      child: FutureBuilder(
        future: service.getRecentCampaigns(),
        builder: (context, AsyncSnapshot<List<Campaign>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            scrollDirection: Axis.horizontal,
            children: snapshot.data
                .map<Widget>((data) => VoteWidget(
                      data: data,
                    ))
                .toList(),
          );
        },
      ),
    );
  }

  Padding featuredMarkIns() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Featured MarkIns",
            style: appBarTextStyle,
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                "See all",
                style: TextStyle(color: ColorConstants.instance.purpleHeart, fontSize: 17, fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }

  Padding startNewMarkin(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Container(
          height: context.sizeH(0.13),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: ColorConstants.instance.electricViolet,
          ),
          child: Stack(
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Start New \nMarkIn",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    CupertinoButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateMarkins(),
                          )),
                      child: Container(
                        height: context.sizeH(0.07),
                        width: context.sizeW(0.26),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                            child: Text(
                          "Start Now",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
