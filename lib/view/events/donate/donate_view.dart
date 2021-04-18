import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markin/constant/color_constant.dart';
import 'package:markin/utilities/textstyle.dart';
import 'package:markin/core/extension/context_extension.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:markin/models/event.dart';
import 'package:markin/widgets/donate_sheet.dart';

class DonateView extends StatefulWidget {
  final Event event;

  const DonateView({Key key, this.event}) : super(key: key);
  @override
  _DonateViewState createState() => _DonateViewState();
}

class _DonateViewState extends State<DonateView> {
  @override
  Widget build(BuildContext context) {
    var event = widget.event;
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: context.sizeH(0.15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(event.image),
                    )),
              ),
            ),
            SizedBox(height: context.sizeH(0.02)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(event.title, style: appBarTextStyle),
            ),
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
                    event.content,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                tileColor: Colors.grey[100],
                leading: Container(
                  height: context.sizeH(0.06),
                  width: context.sizeW(0.1),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.check_circle_outline_outlined,
                      color: Colors.white),
                ),
                title: Row(
                  children: [
                    Text(
                      event.foundation.foundationName,
                      style: appBarTextStyle,
                    ),
                    SizedBox(width: context.sizeW(0.01)),
                    CircleAvatar(
                      radius: 7,
                      backgroundColor: Colors.teal,
                      child: Center(
                          child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 10,
                      )),
                    )
                  ],
                ),
                subtitle: Text(
                  'Verified foundation',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: context.sizeH(0.02)),
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
                          child:
                              Text("Targeted Donation", style: appBarTextStyle),
                        ),
                        SizedBox(height: context.sizeH(0.01)),
                        Row(
                          children: [
                            LinearPercentIndicator(
                              backgroundColor: ColorConstants.instance.perfume
                                  .withOpacity(0.4),
                              width: context.sizeW(0.60),
                              lineHeight: 10,
                              percent: event.donateCount / 1000,
                              progressColor:
                                  ColorConstants.instance.purpleHeart,
                            ),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: event.donateCount.toString(),
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
                                  text: "1000 donation",
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
            SizedBox(height: context.sizeH(0.02)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: context.sizeH(0.15),
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
                          Text("Donaters", style: appBarTextStyle),
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
                        height: context.sizeH(0.06),
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: event.donateOwners.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Container(
                                      width: context.sizeW(0.10),
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(event
                                            .donateOwners[index].profileImage),
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
            SizedBox(height: context.sizeH(0.03)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.sizeW(0.15)),
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
                    onPressed: () => showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return DonateSheet(
                              appBarTextStyle: appBarTextStyle,
                            );
                          },
                        ),
                    child: Text(
                      "Donate Now",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
              ),
            )
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
      title: Text("Donate Details", style: appBarTextStyle),
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
