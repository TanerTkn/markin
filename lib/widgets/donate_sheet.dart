import 'package:flutter/material.dart';
import 'package:markin/constant/color_constant.dart';
import 'package:markin/core/extension/context_extension.dart';
import 'package:markin/models/donate.dart';
import 'package:markin/widgets/donate_radio.dart';

class DonateSheet extends StatelessWidget {
  final TextStyle appBarTextStyle;
  final int selceted;
  const DonateSheet({Key key, this.appBarTextStyle, this.selceted})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Donate> donateList = [
      Donate(isSelected: true, price: 50),
      Donate(isSelected: false, price: 100),
      Donate(isSelected: false, price: 200),
    ];
    return Container(
      height: context.sizeH(0.9),
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
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                )),
          ),
          SizedBox(height: context.sizeH(0.02)),
          Text("How much wanna donate?", style: appBarTextStyle),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView(
              children: donateList
                  .map<Widget>((data) => DonateRadio(
                        isSelected: data.isSelected,
                        price: data.price,
                      ))
                  .toList(),
            ),
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
                  onPressed: () {},
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
    );
  }
}
