import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:markin/core/extension/context_extension.dart';
import 'package:markin/core/services/campaign_service.dart';
import 'package:markin/models/campaign_model.dart';
import 'package:markin/utilities/textstyle.dart';
import 'package:markin/widgets/categories.dart';
import 'package:markin/widgets/vote_widget.dart';
import '../../core/base/base_state.dart';
import 'package:markin/constant/color_constant.dart';

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
          Padding(
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
                      style: TextStyle(
                          color: ColorConstants.instance.purpleHeart,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: context.sizeH(0.01),
          ),
          Container(
            height: context.sizeH(0.4),
            width: double.infinity,
            child: FutureBuilder(
              future: service.getRecentCampaigns(),
              builder: (context, AsyncSnapshot<List<Campaign>> snapshot) {
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
          ),
          Padding(
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
                      style: TextStyle(
                          color: ColorConstants.instance.purpleHeart,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
          Container(
            height: context.sizeH(0.4),
            width: double.infinity,
            child: FutureBuilder(
              future: service.getPopularCampaigns(),
              builder: (context, AsyncSnapshot<List<Campaign>> snapshot) {
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
          ),
        ],
      ),
    );
    return FutureBuilder<List<Campaign>>(
        future: service.getRecentCampaigns(),
        builder: (context, snapshot) {
          if (!snapshot.hasData ||
              snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          List<Campaign> campaignList = snapshot.data;
          print(campaignList.first.image);
          return ListView(
            shrinkWrap: true,
            children: [
              Categories(),
              Padding(
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
                          style: TextStyle(
                              color: ColorConstants.instance.purpleHeart,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
              SizedBox(height: context.sizeH(0.05)),
              Padding(
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
                          style: TextStyle(
                              color: ColorConstants.instance.purpleHeart,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
            ]..addAll(campaignList.map<Widget>((data) {
                print(data.content);
                print(data.title);
                return VoteWidget(
                  data: data,
                );
              })),
          );
        });
  }
}
