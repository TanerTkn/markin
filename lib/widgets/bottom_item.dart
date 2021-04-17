import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constant/color_constant.dart';

class BottomItem extends StatelessWidget {

  final String icon;
  final bool isSelected;
  final Function onTap;

  const BottomItem({Key key,this.icon, this.isSelected, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: ColorConstants.instance.perfume,
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SvgPicture.asset(icon, color: isSelected ? ColorConstants.instance.purpleHeart : Colors.grey,),
        ]),
      ),
    );
  }
}
