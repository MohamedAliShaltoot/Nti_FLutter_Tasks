import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget setSvgPicture({required String assetPath,double width=24,double height=24,void Function()? onPressed }) {
  return IconButton(
    onPressed: onPressed,
    icon: SvgPicture.asset(
               assetPath,
                width:width,
                height: height,
              ),
  );
}