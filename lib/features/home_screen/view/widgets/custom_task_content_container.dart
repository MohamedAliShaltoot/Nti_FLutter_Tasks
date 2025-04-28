import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

Widget customTaskContentContainer({
  required double width,
  required double height,
}) {
  return Container(
    width: width * 0.93,
    height: height * 0.21,

    decoration: BoxDecoration(
      color: AppColors.primary,
      borderRadius: BorderRadius.circular(30),
    ),

    child: Stack(
      children: [
        Positioned(
          top: 18,
          left: 22,
          child: Text(
            AppStrings.titleInHomeContainer,
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),

        Positioned(
          top: 70,
          left: 22,
          bottom: 18,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppStrings.taskPercentage,
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              ),
              Transform.translate(
                offset: Offset(0, 5),
                child: Text(
                  "%",
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),

        Positioned(
          top: 81,
          left: 192,
          bottom: 18,
          right: 22,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              AppStrings.viewTaskTitle,
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
