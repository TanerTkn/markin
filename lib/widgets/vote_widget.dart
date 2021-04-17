import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markin/constant/color_constant.dart';
import 'package:markin/core/extension/context_extension.dart';
import 'package:markin/models/campaign_model.dart';

class VoteWidget extends StatelessWidget {
  final Campaign data;

  const VoteWidget({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
      child: Container(
        height: context.sizeH(0.30),
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
                      Text(data.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
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
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: data.markCount.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal,
                                    fontSize: 13),
                              ),
                              TextSpan(
                                text: "  Voted",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                              ),
                            ])),
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
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
