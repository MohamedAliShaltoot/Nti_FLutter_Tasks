import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';

class CustomProfileContainer {
  static Widget getCustomProfileContainer({
    required String iconPath,
    required String profileNameSettings,
    required void Function()? onPressed,
  }) {
    return Container(
      width: 361,
      height: 63,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(iconPath, width: 27, height: 27),
          ), // IconButton for the icon on the left
          SizedBox(width: 10),

          Text(
            profileNameSettings,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.black,
              fontSize: 16,
            ),
          ),
          //  SizedBox(width: 60),
          Spacer(),

          IconButton(
            onPressed: onPressed,
            icon: SvgPicture.asset(
              AppAssets.goOpenIcoon,
              width: 25,
              height: 25,
            ),
          ),
        ],
      ),
    );
  }
}


/*
class CustomProfileContainer {
  static Widget getCustomProfileContainer({
    required String iconPath,
    required String profileNameSettings,
    required void Function()? onPressed,
  }) {
    return BlocProvider(
      create: (context) => LanguageCubit(),
      child: Container(
        width: 361,
        height: 63,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(iconPath, width: 27, height: 27),
            ), // IconButton for the icon on the left
            SizedBox(width: 10),

            Text(
              profileNameSettings,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.black,
                fontSize: 16,
              ),
            ),
            //  SizedBox(width: 60),
            Spacer(),

            BlocBuilder<LanguageCubit, LanguageState>(
              builder: (context, state) {
                return Transform(
                  alignment: Alignment.center,
                  transform:
                      LanguageCubit.get(context).isArabic
                          ? Matrix4.rotationY(3.14)
                          : Matrix4.rotationX(0),
                  child: IconButton(
                    onPressed: onPressed,
                    icon: SvgPicture.asset(
                      AppAssets.goOpenIcoon,
                      width: 25,
                      height: 25,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
*/