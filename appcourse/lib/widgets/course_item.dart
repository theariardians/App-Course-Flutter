import 'package:flutter/material.dart';
import 'package:appcourse/theme/color.dart';
import 'package:appcourse/widgets/bookmark_box.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CourseItem extends StatelessWidget {
  CourseItem({Key? key, required this.data, this.onBookmark, this.onTap})
      : super(key: key);
  final data;
  final GestureTapCallback? onBookmark;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 290,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(.1),
              blurRadius: 1,
              spreadRadius: 1,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              child: CachedNetworkImage(
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover)),
                ),
                imageUrl: data["image"],
              ),
            ),
            Positioned(
              top: 175,
              right: 15,
              child: BookmarkBox(
                onTap: onBookmark,
                isBookmarked: data["is_favorited"],
              ),
            ),
            Positioned(
              top: 215,
              child: Container(
                width: MediaQuery.of(context).size.width - 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data["name"],
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getAttribute(
                            Icons.sell_outlined, data["price"], labelColor),
                        getAttribute(Icons.play_circle_outline, data["session"],
                            labelColor),
                        getAttribute(
                            Icons.schedule_outlined, data["duration"], labelColor),
                        getAttribute(
                            Icons.star, data["review"].toString(), yellow),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  getAttribute(IconData icon, String name, Color color) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: color,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 13, color: labelColor),
        ),
      ],
    );
  }
}
