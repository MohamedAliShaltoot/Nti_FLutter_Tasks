import 'package:flutter/material.dart';
import 'package:nti_flutter_tasks/core/helper/svg_picture_custom.dart';

DropdownMenuItem customDropDownList({
  required String iconPath,
  required Color icontainerIconBGC,
  required String textType,
  required int itemValue,
}) {
  return DropdownMenuItem(
    value: itemValue,
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            width: 28,
            height: 28,
            // padding: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: icontainerIconBGC,
            ),
            child: setSvgPicture(assetPath: iconPath, width: 26, height: 26),
          ),
        ),
        Text(
          textType,
          style: TextStyle(color: Color.fromARGB(255, 10, 10, 10)),
        ),
      ],
    ),
  );
}
