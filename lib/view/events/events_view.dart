import 'package:flutter/material.dart';
import 'package:markin/constant/color_constant.dart';
import 'package:markin/core/services/campaign_service.dart';
import 'package:markin/models/campaign_model.dart';
import 'package:markin/utilities/textstyle.dart';
import 'package:markin/core/extension/context_extension.dart';
import 'package:markin/widgets/verified_widget.dart';

class EventsView extends StatefulWidget {
  @override
  _EventsViewState createState() => _EventsViewState();
}

class _EventsViewState extends State<EventsView> {
  @override
  Widget build(BuildContext context) {
    CampaignService service = CampaignService();
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Verified Foundation",
                      style: appBarTextStyle,
                    ),
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.teal,
                      child: Center(child: Icon(Icons.check, color: Colors.white,size: 12,)),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: context.sizeH(0.8),
            width: double.infinity,
            child: FutureBuilder(
              future: service.getRecentCampaigns(),
              builder: (context, AsyncSnapshot<List<Campaign>> snapshot) {
                return ListView(
                  children: snapshot.data
                      .map<Widget>((data) => VerifiedWidget(
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
  }
}
