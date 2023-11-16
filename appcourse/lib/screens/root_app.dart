import 'package:flutter/material.dart';
import 'package:appcourse/screens/explore.dart';
import 'package:appcourse/screens/home.dart';
import 'package:appcourse/widgets/bottombar_item.dart';
import 'package:appcourse/theme/color.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activePageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      bottomNavigationBar: buildBottomBar(),
    );
  }

  Widget buildBody() {
    return IndexedStack(
      index: activePageIndex,
      children: List.generate(tabItems.length, (index) => tabItems[index]["page"]),
    );
  }

  List tabItems = [
    {"icon": "assets/icons/home.svg", "page": HomePage()},
    {"icon": "assets/icons/search.svg", "page": ExplorePage()},
    {
      "icon": "assets/icons/play.svg",
      "page": Container(
        child: Center(
          child: Text("My Course"),
        ),
      ),
    },
    {
      "icon": "assets/icons/chat.svg",
      "page": Container(
        child: Center(
          child: Text("Chat"),
        ),
      ),
    },
    {
      "icon": "assets/icons/profile.svg",
      "page": Container(
        child: Center(
          child: Text("Profile"),
        ),
      ),
    },
  ];

  Widget buildBottomBar() {
    return Container(
      width: double.infinity,
      height: 75,
      padding: EdgeInsets.fromLTRB(25, 0, 25, 15),
      decoration: BoxDecoration(
        color: bottomBarColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomBarItem(
            isActive: activePageIndex == 0,
            icon: "assets/icons/home.svg",
            onTap: () {
              onPageIndexChanged(0);
            },
          ),
          BottomBarItem(
            isActive: activePageIndex == 1,
            icon: "assets/icons/search.svg",
            onTap: () {
              onPageIndexChanged(1);
            },
          ),
          BottomBarItem(
            isActive: activePageIndex == 2,
            icon: "assets/icons/play.svg",
            onTap: () {
              onPageIndexChanged(2);
            },
          ),
          BottomBarItem(
            isActive: activePageIndex == 3,
            icon: "assets/icons/chat.svg",
            onTap: () {
              onPageIndexChanged(3);
            },
          ),
          BottomBarItem(
            isActive: activePageIndex == 4,
            icon: "assets/icons/profile.svg",
            onTap: () {
              onPageIndexChanged(4);
            },
          ),
        ],
      ),
    );
  }

  onPageIndexChanged(index) {
    setState(() {
      activePageIndex = index;
    });
  }
}
