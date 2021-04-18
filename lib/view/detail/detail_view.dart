import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markin/constant/color_constant.dart';
import 'package:markin/core/services/auth_service.dart';
import 'package:markin/core/services/campaign_service.dart';
import 'package:markin/models/campaign_model.dart';
import 'package:markin/utilities/textstyle.dart';
import 'package:markin/core/extension/context_extension.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:markin/widgets/vote_dialog.dart';

class DetailView extends StatefulWidget {
  final Campaign campaign;

  const DetailView({Key key, this.campaign}) : super(key: key);
  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  GlobalKey<ScaffoldState> scKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    bool voted = widget.campaign.participantsList
            .where((element) => element.userID == firebaseAuth.currentUser.uid)
            .toList()
            .length ==
        1;
    return Scaffold(
      key: scKey,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
              child: Container(
                height: context.sizeH(0.20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.campaign.image),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text("Soyu tükenen hayvanlar", style: appBarTextStyle),
            ),
            SizedBox(height: context.sizeH(0.02)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[100],
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                    style: TextStyle(fontSize: 16),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: context.sizeH(0.12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text("Targeted Voted", style: appBarTextStyle),
                        ),
                        SizedBox(height: context.sizeH(0.01)),
                        Row(
                          children: [
                            LinearPercentIndicator(
                              backgroundColor: ColorConstants.instance.perfume
                                  .withOpacity(0.4),
                              width: context.sizeW(0.60),
                              lineHeight: 10,
                              percent: widget.campaign.markCount / 1000,
                              progressColor:
                                  ColorConstants.instance.purpleHeart,
                            ),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: widget.campaign.markCount.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          ColorConstants.instance.purpleHeart,
                                      fontSize: 13),
                                ),
                                TextSpan(
                                  text: " / ",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: "1000 voted",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
            SizedBox(height: context.sizeH(0.04)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: context.sizeH(0.18),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Participants", style: appBarTextStyle),
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
                      SizedBox(height: context.sizeH(0.01)),
                      Container(
                        height: context.sizeH(0.08),
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    widget.campaign.participantsList.length,
                                itemBuilder: (context, index) {
                                  var participant =
                                      widget.campaign.participantsList[index];
                                  return Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Container(
                                      width: context.sizeW(0.10),
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            participant.profileImage),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: context.sizeH(0.04)),
            voted == false
                ? Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: context.sizeW(0.15)),
                    child: Container(
                      height: context.sizeH(0.10),
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: ColorConstants.instance.purpleHeart,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                          onPressed: () async {
                            scKey.currentState.showBottomSheet((context) {
                              return VoteDialog(
                                submitFunction: () async {
                                  CampaignService campaignService =
                                      CampaignService();
                                  campaignService
                                      .voteCampaign(widget.campaign.id);
                                },
                              );
                            },
                                elevation: 20,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30)),
                                ));
                          },
                          child: Text(
                            "Vote Now",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                    ),
                  )
                : Text(
                    "This campaign voted",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      title: Text("Details", style: appBarTextStyle),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: IconButton(
              icon: SvgPicture.asset(
                'assets/svgs/bell.svg',
                color: Colors.black,
              ),
              onPressed: () {}),
        ),
      ],
    );
  }
}
