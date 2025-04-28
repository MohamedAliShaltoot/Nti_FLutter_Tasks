import 'package:flutter/material.dart';

import '../../../../core/helper/svg_picture_custom.dart';
import '../../../../core/utils/app_colors.dart';

Widget customGroupTask({
  required String title,
 required String iconPath,
  required Color textNumberColor,
  required Color leadingIconBGC,
  required Color traillingIconBGC,

  double height = 55,
}) {
  return Container(
    height: height,
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(17),
       boxShadow: [
        BoxShadow(
          blurRadius: 10,
          spreadRadius: 0,
          offset: Offset(0, 2),
          color: Color(0xff00000a),
        ),
      ]
    ),
    margin: EdgeInsetsDirectional.symmetric(horizontal: 22,vertical:5),
    child: ListTile(
      leading: Container(
       // padding: const EdgeInsets.all(4),
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: leadingIconBGC,
          borderRadius: BorderRadius.circular(5),
          
        ),
        child: setSvgPicture(assetPath: iconPath, width: 46, height:46),
      ),
      title: Text(title),
      trailing: Container(
        alignment: Alignment.center,
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: traillingIconBGC,
          borderRadius: BorderRadius.circular(5),
          // shape: BoxShape.circle,
        ),

        child: Text(
          "5",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: textNumberColor,
          ),
        ),
      ),
    ),
  );
}
