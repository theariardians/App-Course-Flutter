import 'package:appcourse/theme/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RecommendItem extends StatelessWidget {
  RecommendItem({Key? key, required this.data, this.onTap}) : super(key: key);
  final data;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 280,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Row(children: [
          Container(
            width: 80,
            height: 80,
            child: CachedNetworkImage(
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image:
                        DecorationImage(image: imageProvider, fit: BoxFit.cover)),
              ),
              imageUrl: data["image"],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data["name"],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 16, color: textColor, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                data["price"],
                maxLines: 1,
                style: TextStyle(
                  color: textColor,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  getAttribute(data["session"],
                      Icons.play_circle_outline, labelColor),
                  SizedBox(
                    width: 10,
                  ),
                  getAttribute(data["duration"], Icons.schedule_outlined,
                      labelColor),
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }

  Widget getAttribute(String info, IconData icon, Color color) {
    return Row(
      children: [
        Icon(icon, size: 18, color: color),
        SizedBox(
          width: 3,
        ),
        Text(
          info,
          style: TextStyle(color: labelColor, fontSize: 13),
        ),
      ],
    );
  }
}
