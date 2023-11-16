import 'package:appcourse/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as costumBadges;

class NotificationBox extends StatelessWidget {
  NotificationBox({Key? key, this.notifiedNumber = 0}) : super(key: key);
  final int notifiedNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: appBarColor,
          border: Border.all(color: Colors.grey.withOpacity(.3))),
      child: notifiedNumber > 0
          ? costumBadges.Badge(
              badgeColor: primary,
              position: costumBadges.BadgePosition(top: -7, end: 0),
              badgeContent: Text(''),
              padding: EdgeInsets.all(3),
              child: SvgPicture.asset(
                "assets/icons/bell.svg",
                width: 20,
                height: 20,
              ),
            )
          : SvgPicture.asset(
              "assets/icons/bell.svg",
              width: 20,
              height: 20,
            ),
    );
  }
}
