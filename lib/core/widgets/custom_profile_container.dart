import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti_flutter_tasks/core/app_assets.dart';
import 'package:nti_flutter_tasks/core/app_colors.dart';

class CustomProfileContainer {
  static Widget getCustomProfileContainer({
    required String iconPath,
    required String profileNameSettings,
    required void Function()? onPressed
  }) {
    return Container(
      width: 361,
      height: 63,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(children: [
IconButton(onPressed: () {}, icon: SvgPicture.asset(iconPath),),
SizedBox(width: 10,),

Text(
      profileNameSettings,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        color: AppColors.black
      )),
    //  SizedBox(width: 60),
      Spacer(),

      IconButton(onPressed: onPressed, icon: SvgPicture.asset(AppAssets.goOpenIcoon)),


    ],
  ),
    );
  }
}
