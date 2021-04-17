import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:markin/core/extension/context_extension.dart';
import 'package:markin/widgets/categories.dart';
import '../../core/base/base_state.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with BaseState {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Categories(),
        SizedBox(height: context.sizeH(0.02)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text("Statistics", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
        SizedBox(height: context.sizeH(0.03)),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    height: context.sizeH(0.30),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/prof.jpeg'),
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
                                  Text('Help The Indonesia', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                  SizedBox(height: context.sizeH(0.01)),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: "12",
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 13),
                                    ),
                                    TextSpan(
                                      text: "  Partipicants",
                                      style: TextStyle(color: Colors.grey, fontSize: 13),
                                    ),
                                  ]))
                                ],
                              ),
                              CupertinoButton(
                                child: Container(
                                  height: context.sizeH(0.1),
                                  width: context.sizeW(0.15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.teal,
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
              },
            ),
          ),
        ),
      ],
    );
  }
}
