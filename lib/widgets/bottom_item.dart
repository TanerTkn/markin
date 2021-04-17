import 'package:flutter/material.dart';
import '../constant/color_constant.dart';

class BottomItem extends StatelessWidget {

  final IconData icon;
  final bool isSelected;
  final Function onTap;

  const BottomItem({Key key,this.icon, this.isSelected, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: ColorConstants.instance.primaryColor,
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, color: isSelected ? ColorConstants.instance.primaryColor : Colors.grey, size: 22),
        ]),
      ),
    );
  }
}
