import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:markin/core/extension/context_extension.dart';

class DonateRadio extends StatelessWidget {
  final int price;
  final bool isSelected;

  const DonateRadio({Key key, this.price, this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? CupertinoButton(
            onPressed: () {},
            child: Container(
                width: context.sizeW(1),
                height: context.sizeH(0.15),
                child: Center(
                  child: Text(
                    price.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.lightGreen[200],
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(20))),
          )
        : CupertinoButton(
            onPressed: () {},
            child: Container(
                width: context.sizeW(1),
                height: context.sizeH(0.15),
                child: Center(
                  child: Text(
                    price.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20))),
          );
  }
}
