import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markin/core/extension/context_extension.dart';
import 'package:markin/view/category_page.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {
        "icon": "assets/svgs/education.svg",
        "text": "Education",
        "key": "education"
      },
      {"icon": "assets/svgs/medical.svg", "text": "Medical", "key": "medical"},
      {"icon": "assets/svgs/family.svg", "text": "Family", "key": "family"},
      {
        "icon": "assets/svgs/environment.svg",
        "text": "Environment",
        "key": "environment"
      },
      {"icon": "assets/svgs/animal.svg", "text": "Animal", "key": "animal"},
      {
        "icon": "assets/svgs/violence.svg",
        "text": "Violence",
        "key": "violence"
      },
      {"icon": "assets/svgs/other.svg", "text": "Other", "key": "other"},
    ];
    return Container(
      height: context.sizeH(0.20),
      width: double.infinity,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: List<Widget>.generate(
            categories.length,
            (index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: CategoryCard(
                  icon: categories[index]["icon"],
                  text: categories[index]["text"],
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryPage(
                            categoryID: categories[index]["key"],
                            categoryName: categories[index]["text"],
                          ),
                        ));
                  }),
            ),
          )),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: context.sizeW(0.30),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 2.2,
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(icon),
              ),
            ),
            SizedBox(height: 5),
            Text(
              text,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
