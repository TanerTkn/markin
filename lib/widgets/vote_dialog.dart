import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:markin/constant/color_constant.dart';
import 'package:markin/core/extension/context_extension.dart';

class VoteDialog extends StatefulWidget {
  final Function submitFunction;

  const VoteDialog({Key key, this.submitFunction}) : super(key: key);

  @override
  _VoteDialogState createState() => _VoteDialogState();
}

class _VoteDialogState extends State<VoteDialog> {
  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorConstants.instance.portage,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      width: double.infinity,
      height: context.sizeH(0.6),
      child: SingleChildScrollView(
        child: Column(
          children: [
            LottieBuilder.asset(
              "assets/looties/vote_animation.json",
              height: context.sizeH(0.35),
            ),
            SizedBox(
              height: context.sizeH(0.02),
            ),
            CheckboxListTile(
              title: Text("I am not robot"),
              value: checkedValue,
              activeColor: ColorConstants.instance.purpleHeart,
              onChanged: (newValue) {
                setState(() {
                  checkedValue = newValue;
                });
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),
            SizedBox(
              height: 10,
            ),
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
                    onPressed: () async {
                      if (checkedValue == true) {
                        widget.submitFunction();
                      }
                    },
                    child: Text(
                      "Vote Now",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// if (checkedValue == true) {
//                     widget.submitFunction();
//                   }
