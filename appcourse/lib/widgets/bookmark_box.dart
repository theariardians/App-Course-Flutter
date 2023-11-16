import 'package:appcourse/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookmarkBox extends StatelessWidget {
  BookmarkBox({Key? key, this.onTap, this.isBookmarked = false})
      : super(key: key);
  final GestureTapCallback? onTap;
  final bool isBookmarked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isBookmarked ? primary : Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(.05),
              spreadRadius: .5,
              blurRadius: .5,
              offset: Offset(1, 1),
            )
          ],
        ),
        child: SvgPicture.asset(
          "assets/icons/bookmark.svg",
          color: isBookmarked ? Colors.white : primary,
          width: 22,
          height: 22,
        ),
      ),
    );
  }
}
