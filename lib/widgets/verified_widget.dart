import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markin/constant/color_constant.dart';
import 'package:markin/core/extension/context_extension.dart';
import 'package:markin/models/campaign_model.dart';
import 'package:markin/view/detail/detail_view.dart';
import 'package:markin/view/events/donate/donate_view.dart';

class VerifiedWidget extends StatelessWidget {
  final Campaign data;

  const VerifiedWidget({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
      child: Container(
        height: context.sizeH(0.35),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(data.image),
            )),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: context.sizeH(0.12),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Finished MarkIns June 15 2021", style: TextStyle(color: ColorConstants.instance.purpleHeart, fontWeight: FontWeight.bold)),
                    SizedBox(height: context.sizeH(0.01)),
                    Text(data.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox(height: context.sizeH(0.01)),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/svgs/vote.svg",
                          height: 15,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: data.markCount.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 13),
                          ),
                          TextSpan(
                            text: "  Donate",
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                        ])),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: -15,
              right: -15,
              child: CupertinoButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DonateView(),
                      ));
                },
                child: Container(
                  height: context.sizeH(0.05),
                  width: context.sizeW(0.30),
                  alignment: Alignment.center,
                  child: Text(
                    "Donate Now",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
    );
  }
}
