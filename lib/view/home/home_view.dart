import 'package:flutter/material.dart';

import '../../constant/color_constant.dart';
import '../../core/base/base_state.dart';
import '../../core/extension/context_extension.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with BaseState {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Categories(),
          Center(child: Text('HOME'))
        ],
      ),
    );
  }
}

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.sizeW(0.55),
      child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          )),
    );
  }
}
