import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markin/core/extension/context_extension.dart';
import 'package:markin/core/services/campaign_service.dart';
import 'package:markin/models/campaign_model.dart';
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
              SizedBox(height: context.sizeH(0.02)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Recent MarkIns",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              SizedBox(height: context.sizeH(0.03)),
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
