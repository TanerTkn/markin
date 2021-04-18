import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markin/constant/color_constant.dart';
import 'package:markin/my_home_page.dart';
import 'package:markin/utilities/textstyle.dart';
import 'package:markin/core/extension/context_extension.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DetailView extends StatefulWidget {
  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
              child: Container(
                height: context.sizeH(0.25),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage("https://i.milliyet.com.tr/GazeteHaberIciResim/2017/11/21/fft16_mf10284922.Jpeg"),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text("Soyu tükenen hayvanlar", style: appBarTextStyle),
            ),
            SizedBox(height: context.sizeH(0.04)),
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
                              backgroundColor: ColorConstants.instance.perfume.withOpacity(0.4),
                              width: context.sizeW(0.60),
                              lineHeight: 10,
                              percent: 0.4,
                              progressColor: ColorConstants.instance.purpleHeart,
                            ),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: "12",
                                  style: TextStyle(fontWeight: FontWeight.bold, color: ColorConstants.instance.purpleHeart, fontSize: 13),
                                ),
                                TextSpan(
                                  text: " / ",
                                  style: TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: "1000 voted",
                                  style: TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.bold),
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
                                style: TextStyle(color: ColorConstants.instance.purpleHeart, fontSize: 17, fontWeight: FontWeight.bold),
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
            SizedBox(height: context.sizeH(0.04)),
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
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                    },
                    child: Text(
                      "Voted Now",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
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
