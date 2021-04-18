import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return FutureBuilder<List<Campaign>>(
        future: service.getRecentCampaigns(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting)
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
                          style: TextStyle(color: ColorConstants.instance.purpleHeart, fontSize: 17, fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: context.sizeH(0.40),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage("https://i.milliyet.com.tr/GazeteHaberIciResim/2017/11/21/fft16_mf10284922.Jpeg"),
                      )),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: context.sizeH(0.15),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Finished MarkIns June 15 2021",
                                  style: TextStyle(color: ColorConstants.instance.purpleHeart, fontWeight: FontWeight.bold)),
                              SizedBox(height: context.sizeH(0.01)),
                              Text("Soyu tükenen hayvanlar", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                              Expanded(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.all(1.5),
                                      child: Container(
                                        width: context.sizeW(0.09),
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=pexels-pixabay-220453.jpg&fm=jpg"),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: context.sizeH(0.05),
                          width: context.sizeW(0.30),
                          alignment: Alignment.center,
                          child: Text(
                            "Voted Now",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          decoration: BoxDecoration(
                              color: ColorConstants.instance.electricViolet,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              )),
                        ),
                      )
                    ],
                  ),
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
                          style: TextStyle(color: ColorConstants.instance.purpleHeart, fontSize: 17, fontWeight: FontWeight.bold),
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
