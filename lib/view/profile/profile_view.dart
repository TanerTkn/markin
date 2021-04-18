import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markin/constant/color_constant.dart';
import 'package:markin/core/extension/context_extension.dart';
import 'package:markin/view/home/home_view.dart';
import 'package:markin/widgets/vote_widget.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5e5ff),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  buildStatic(context),
                  buildPerson(context),
                ],
              ),
            ),
            SizedBox(
              height: context.sizeH(0.03),
            ),
            Container(
              height: context.sizeH(0.35),
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
                    height: context.sizeH(0.12),
                    width: context.sizeH(0.4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: context.sizeH(0.01)),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/svgs/vote.svg",
                                    height: 15,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        CupertinoButton(
                          child: Container(
                            height: context.sizeH(0.1),
                            width: context.sizeW(0.15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorConstants.instance.electricViolet,
                            ),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeView()));
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding buildCards(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            //height: 300,
            child: Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Last Created Campaign',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: context.sizeH(0.02),
                    ),
                    Image.network(
                        "https://i.milliyet.com.tr/GazeteHaberIciResim/2017/11/21/fft16_mf10284922.Jpeg"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildPerson(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height / 2.5,
          maxWidth: MediaQuery.of(context).size.width),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildImage(context),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text('Jack Snow',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
            )
          ],
        ),
      ),
    );
  }

  SizedBox buildImage(BuildContext context) {
    return SizedBox(
      height: context.sizeH(0.2),
      width: context.sizeW(0.4),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/prof.jpeg'),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFF5F6F9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Color(0xFF752DEB)),
                  ),
                ),
                onPressed: () {},
                child: SvgPicture.asset(
                  'assets/svgs/cameraicon.svg',
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildStatic(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height / 2,
          maxWidth: MediaQuery.of(context).size.width),
      decoration: BoxDecoration(
        color: ColorConstants.instance.electricViolet,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              buildText1(),
              buildText2(),
            ],
          ),
        ),
      ),
    );
  }

  Column buildText1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('125',
            style: TextStyle(
                fontSize: 23,
                color: Colors.white,
                fontWeight: FontWeight.w500)),
        Text('Campaign',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400))
      ],
    );
  }

  Column buildText2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('320',
            style: TextStyle(
                fontSize: 23,
                color: Colors.white,
                fontWeight: FontWeight.w500)),
        Text('Signature',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400))
      ],
    );
  }
}
