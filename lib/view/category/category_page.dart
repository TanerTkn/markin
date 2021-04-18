import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markin/constant/color_constant.dart';
import 'package:markin/core/extension/context_extension.dart';
import 'package:markin/view/home/home_view.dart';

class CategoryPage extends StatelessWidget {
  final String categoryName;
  final String categoryID;
  const CategoryPage({Key key, this.categoryName, this.categoryID})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
            child: Container(
              height: context.sizeH(0.30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://i.milliyet.com.tr/GazeteHaberIciResim/2017/11/21/fft16_mf10284922.Jpeg"),
                  )),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: context.sizeH(0.14),
                    width: context.sizeH(0.85),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Finished MarkIns June 15 2021",
                              style: TextStyle(
                                  color: ColorConstants.instance.purpleHeart,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: context.sizeH(0.01)),
                          Text('aa',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          SizedBox(height: context.sizeH(0.01)),
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/svgs/vote.svg",
                                height: 15,
                              ),
                              SizedBox(
                                  //width: context.sizeH(value),
                                  ),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                  text: 'bbbb',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal,
                                      fontSize: 13),
                                ),
                                TextSpan(
                                  text: "  Voted",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                ),
                              ])),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -12,
                    right: -12,
                    child: CupertinoButton(
                      onPressed: () {},
                      child: Container(
                        height: context.sizeH(0.05),
                        width: context.sizeW(0.30),
                        alignment: Alignment.center,
                        child: Text(
                          "Voted Now",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        decoration: BoxDecoration(
                            color: ColorConstants.instance.electricViolet,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
