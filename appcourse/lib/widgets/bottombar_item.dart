import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:appcourse/theme/color.dart';

class BottomBarItem extends StatefulWidget {
  BottomBarItem({
    Key? key,
    required this.icon,
    this.activeColor = primary,
    this.color = Colors.grey,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  final String icon;
  final Color activeColor;
  final Color color;
  final bool isActive;
  final GestureTapCallback onTap;

  @override
  _BottomBarItemState createState() => _BottomBarItemState();
}

class _BottomBarItemState extends State<BottomBarItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: widget.isActive ? bottomBarColor : Colors.transparent,
          boxShadow: [
            if (widget.isActive)
              BoxShadow(
                color: shadowColor.withOpacity(.1),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 0),
              )
          ],
        ),
        child: SvgPicture.asset(widget.icon, color: widget.isActive ? widget.activeColor : widget.color),
      ),
    );
  }
}
