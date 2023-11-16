import 'package:appcourse/screens/course_detail.dart';
import 'package:appcourse/utils/data.dart';
import 'package:appcourse/widgets/category_box.dart';
import 'package:appcourse/widgets/feature_item.dart';
import 'package:appcourse/widgets/notification_box.dart';
import 'package:appcourse/widgets/recommend_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:appcourse/theme/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      appBar: getAppBar(),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      elevation: 0,
      title: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ari Ardians",
                  style: TextStyle(color: labelColor, fontSize: 14),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Good Morning!",
                  style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            NotificationBox(
              notifiedNumber: 1,
            )
          ],
        ),
      ),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getCaterories(),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
            child: Text(
              "Featured",
              style: TextStyle(
                  color: textColor, fontWeight: FontWeight.w600, fontSize: 22),
            ),
          ),
          getFeatures(),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 25, 15, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recommended",
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 22),
                ),
                Text(
                  "See all",
                  style: TextStyle(color: labelColor, fontSize: 14),
                ),
              ],
            ),
          ),
          getRecommends(),
        ],
      ),
    );
  }

  Widget getRecommends() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 15),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          recommends.length,
          (index) => Container(
            margin: EdgeInsets.only(right: 15, bottom: 5),
            child: RecommendItem(
              data: recommends[index],
              onTap: () {
                print(index);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget getFeatures() {
    return CarouselSlider(
      options: CarouselOptions(
          height: 290, enlargeCenterPage: true, disableCenter: true),
      items: List.generate(
        features.length,
        (index) => FeatureItem(
          data: features[index],
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CourseDetailPage(
                      data: {"course": features[index]},
                    )));
          },
        ),
      ),
    );
  }

  Widget getCaterories() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CategoryBox(
              data: categories[index],
            ),
          ),
        ),
      ),
    );
  }
}
