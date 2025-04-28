import 'package:flutter/material.dart';
import '../../../../core/helper/svg_picture_custom.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';

Widget customCategoryContainer({
  required String title,
  required String subTitle,
  required String iconPath,
  required Color containerBGC,
  required Color iconBGC,
  required Color titleBGC,
  required Color subTitleBGC,
  double height =26,
  double width = 26,
  fontWeight = FontWeight.w300,
}) {
  return Container(
    width: 245,
    height: 90,
    padding: const EdgeInsets.all(6),
    margin: EdgeInsetsDirectional.all(10),
    decoration: BoxDecoration(
      color: containerBGC,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Stack(
      children: [
        // Content (title and subtitle)
        Positioned(
          top: 4,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: titleBGC,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 8),
              Text(
                subTitle,
                style: TextStyle(
                  color: subTitleBGC,
                  fontSize: 14,
                  fontWeight: fontWeight,
                ),
              ),
            ],
          ),
        ),

        // Icon in top-left
        Positioned(
          top: 8,
          left: 200,
          child: Container(
           // padding: const EdgeInsets.all(4),
            width:30,
            height: 30,
            decoration: BoxDecoration(
              color: iconBGC,
              borderRadius: BorderRadius.circular(5),
             
            ),
            child: setSvgPicture(
              assetPath: iconPath,
              width: width,
              height: height,
              
            ),
          ),
        ),
      ],
    ),
  );
}
