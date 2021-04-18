import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:markin/core/services/campaign_service.dart';
import 'package:markin/models/campaign_category.dart';
import 'package:markin/models/campaign_model.dart';

import 'package:markin/widgets/vote_widget.dart';

class CategoryPage extends StatelessWidget {
  final String categoryName;
  final CampaignCategory categoryID;
  const CategoryPage({Key key, this.categoryName, this.categoryID})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    CampaignService service = CampaignService();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          categoryName,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: CupertinoButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: FutureBuilder<List<Campaign>>(
          future: service.getCampaignsByCategory(categoryID),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 20),
                    child: VoteWidget(
                      data: snapshot.data[index],
                    ));
              },
            );
          }),
    );
  }
}
