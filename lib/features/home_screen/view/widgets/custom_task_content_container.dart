import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:nti_flutter_tasks/core/helper/my_navigator.dart';
import 'package:nti_flutter_tasks/core/helper/my_responsive.dart';
import 'package:nti_flutter_tasks/features/home_screen/view/to_days_task_view.dart';

import '../../../../core/translation/translation_keys.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

Widget customTaskContentContainer({
  required double width,
  required double height,
  required BuildContext context,
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
            TranslationKeys.titleInHomeContainer.tr,
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ),

        Positioned(
          top: 120,
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
          top: 120,
          left: 192,
          bottom: 18,
          right: 22,
          child: GestureDetector(
            onTap: () {
              MyNavigator.goTo(screen: () => ToDaysTaskView());
            },
            child: Container(
              width: MyResponsive.width(context, value: 121),
              height: MyResponsive.height(context, value: 36),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                TranslationKeys.viewTaskTitle.tr,
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
