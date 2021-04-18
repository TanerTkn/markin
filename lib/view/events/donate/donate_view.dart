import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markin/constant/color_constant.dart';
import 'package:markin/utilities/textstyle.dart';
import 'package:markin/core/extension/context_extension.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class DonateView extends StatefulWidget {
  @override
  _DonateViewState createState() => _DonateViewState();
}

class _DonateViewState extends State<DonateView> {
  @override
  Widget build(BuildContext context) {
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
                      image: NetworkImage(
                          "https://i.milliyet.com.tr/GazeteHaberIciResim/2017/11/21/fft16_mf10284922.Jpeg"),
                    )),
              ),
            ),
            SizedBox(height: context.sizeH(0.02)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text("Soyu tükenen hayvanlar", style: appBarTextStyle),
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
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
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
                      'Unicef',
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
                              percent: 0.4,
                              progressColor:
                                  ColorConstants.instance.purpleHeart,
                            ),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: "12",
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
                        height: context.sizeH(0.06),
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Container(
                                      width: context.sizeW(0.10),
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=pexels-pixabay-220453.jpg&fm=jpg"),
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
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return Container(
                              height: context.sizeH(0.6),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  topLeft: Radius.circular(30),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Container(
                                        height: 4,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey,
                                        )),
                                  ),
                                  SizedBox(height: context.sizeH(0.02)),
                                  Text("How much wanna donate?",
                                      style: appBarTextStyle),
                                ],
                              ),
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
