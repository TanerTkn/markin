import 'dart:io';
import 'package:markin/core/extension/context_extension.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:markin/constant/color_constant.dart';
import 'package:markin/core/services/campaign_service.dart';
import 'package:markin/core/services/storage_service.dart';
import 'package:markin/models/campaign_category.dart';
import 'package:markin/utilities/textstyle.dart';

class CreateMarkins extends StatefulWidget {
  @override
  _CreateMarkinsState createState() => _CreateMarkinsState();
}

class _CreateMarkinsState extends State<CreateMarkins> {
  CampaignService campaignService = CampaignService();
  CampaignCategory category = CampaignCategory.animal;
  File _image;
  final picker = ImagePicker();
  var _datetime;
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  List<Map<String, dynamic>> categories = [
    {
      "icon": "assets/svgs/education.svg",
      "text": "Education",
      "key": "education",
      "category": CampaignCategory.education
    },
    {
      "icon": "assets/svgs/medical.svg",
      "text": "Medical",
      "key": "medical",
      "category": CampaignCategory.medical
    },
    {
      "icon": "assets/svgs/family.svg",
      "text": "Family",
      "key": "family",
      "category": CampaignCategory.family
    },
    {
      "icon": "assets/svgs/environment.svg",
      "text": "Environment",
      "key": "environment",
      "category": CampaignCategory.environment
    },
    {
      "icon": "assets/svgs/animal.svg",
      "text": "Animal",
      "key": "animal",
      "category": CampaignCategory.animal
    },
    {
      "icon": "assets/svgs/violence.svg",
      "text": "Violence",
      "key": "violence",
      "category": CampaignCategory.violence
    },
    {
      "icon": "assets/svgs/other.svg",
      "text": "Other",
      "key": "other",
      "category": CampaignCategory.other
    },
  ];
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Card(
                color: Colors.grey[100],
                child: ListTile(
                  onTap: () {
                    getImage();
                  },
                  title: _image == null
                      ? Text(
                          'Choose MarkIn Image',
                          style: TextStyle(color: Colors.grey[600]),
                        )
                      : Image.file(
                          _image,
                          width: double.infinity,
                        ),
                ),
              ),
              Card(
                child: ListTile(
                  tileColor: Colors.grey[100],
                  title: TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                      labelText: "Enter Your MarkIn Title",
                    ),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  tileColor: Colors.grey[100],
                  title: TextFormField(
                    controller: contentController,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                      labelText: "Enter Your MarkIn Content",
                    ),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  tileColor: Colors.grey[100],
                  title: Text(
                    _datetime == null
                        ? "Enter Your MarkIn Finished Date"
                        : _datetime.toString().substring(0, 10),
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2023),
                    ).then((value) {
                      setState(() {
                        _datetime = value;
                      });
                    });
                  },
                ),
              ),
              SizedBox(height: context.sizeH(0.02)),
              // Card(
              //   child: DropdownButton(
              //     onChanged: (value) {
              //       setState(() {
              //         category = campaignService.stringToCampaignCategories();
              //       });
              //       print(category);
              //     },

              //     items: categories
              //         .map<DropdownMenuItem<dynamic>>(
              //             (data) => DropdownMenuItem(child: Text(data['text'])))
              //         .toList(),
              //     hint: Text(campaignService.campaignToString(category)),
              //   ),
              // ),
              SizedBox(height: context.sizeH(0.02)),
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
                        StorageService storageService = StorageService();
                        var imageURL =
                            await storageService.uploadCampaignImage(_image);
                        campaignService.addCampaign(
                            content: contentController.text,
                            title: titleController.text,
                            imageURL: imageURL);
                      },
                      child: Text(
                        "Create MarkIn",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      title: Text(
        "Create MarkIns",
        style: appBarTextStyle,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: IconButton(
              icon: SvgPicture.asset(
                'assets/svgs/bell.svg',
                color: Colors.black,
              ),
              onPressed: () {}),
        ),
      ],
    );
  }
}
