import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti_flutter_tasks/core/utils/app_colors.dart';

Widget setSvgPicture({
  required String assetPath,
  double width = 24,
  double height = 24,
  void Function()? onPressed,
  Color color = AppColors.black,
}) {
  return IconButton(
    //color: color,
    onPressed: onPressed,
    // ignore: deprecated_member_use
    icon: SvgPicture.asset(assetPath, width: width, height: height,
    color: color, 
     ),
  );
}
