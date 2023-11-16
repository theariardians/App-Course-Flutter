import 'package:flutter/material.dart';
import 'package:appcourse/widgets/bookmark_box.dart';
import 'package:appcourse/widgets/custom_button.dart';
import 'package:appcourse/widgets/custom_image.dart';
import 'package:appcourse/widgets/lesson_item.dart';
import 'package:readmore/readmore.dart';
import 'package:appcourse/theme/color.dart';
import 'package:appcourse/utils/data.dart';

class CourseDetailPage extends StatefulWidget {
  CourseDetailPage({Key? key, required this.data}) : super(key: key);
  final data;

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late var courseData;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    courseData = widget.data["course"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        "Detail",
        style: TextStyle(color: textColor),
      ),
      iconTheme: IconThemeData(color: textColor),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
      child: Column(
        children: [
          CustomImage(
            courseData["image"],
            radius: 10,
            width: double.infinity,
            height: 200,
          ),
          SizedBox(
            height: 20,
          ),
          getInfo(),
          SizedBox(
            height: 10,
          ),
          Divider(),
          getTabBar(),
          getTabbarPages(),
        ],
      ),
    );
  }

  Widget getTabBar() {
    return Container(
      child: TabBar(
        indicatorColor: primary,
        controller: tabController,
        tabs: [
          Tab(
            child: Text(
              "Lessons",
              style: TextStyle(fontSize: 16, color: textColor),
            ),
          ),
          Tab(
            child: Text(
              "Excercises",
              style: TextStyle(fontSize: 16, color: textColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget getTabbarPages() {
    return Container(
      height: 200,
      width: double.infinity,
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
          getLessons(),
          Container(
            child: Center(child: Text("Excercises")),
          ),
        ],
      ),
    );
  }

  Widget getLessons() {
    return ListView.builder(
      itemCount: lessons.length,
      itemBuilder: (context, index) => LessonItem(data: lessons[index]),
    );
  }

  Widget getInfo() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                courseData["name"],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
              BookmarkBox(
                isBookmarked: courseData["is_favorited"],
                onTap: () {
                  setState(() {
                    courseData["is_favorited"] = !courseData["is_favorited"];
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              getAttribute(
                  Icons.play_circle_outline, courseData["session"], labelColor),
              SizedBox(
                width: 20,
              ),
              getAttribute(
                  Icons.schedule_outlined, courseData["duration"], labelColor),
              SizedBox(
                width: 20,
              ),
              getAttribute(Icons.star, courseData["review"], yellow),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "About Course",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ReadMoreText(
                courseData["description"],
                trimLines: 2,
                trimMode: TrimMode.Line,
                style: TextStyle(
                  fontSize: 14,
                  color: labelColor,
                ),
                trimCollapsedText: "Show more",
                moreStyle: TextStyle(
                  fontSize: 14,
                  color: primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getAttribute(IconData icon, String info, Color color) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: color,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          info,
          style: TextStyle(color: labelColor),
        ),
      ],
    );
  }

  Widget getFooter() {
    return Container(
      width: double.infinity,
      height: 80,
      padding: EdgeInsets.fromLTRB(15, 0, 15, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(.05),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Price",
                style: TextStyle(
                  fontSize: 14,
                  color: labelColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                courseData["price"],
                style: TextStyle(
                  fontSize: 18,
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 30,
          ),
          Expanded(
            child: CustomButton(
              title: "Buy Now",
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}
