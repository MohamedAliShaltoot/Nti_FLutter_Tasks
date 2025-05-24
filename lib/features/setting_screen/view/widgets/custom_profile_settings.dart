import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:nti_flutter_tasks/core/cache/cache_helper.dart';
import 'package:nti_flutter_tasks/core/cache/cache_keys.dart';
import 'package:nti_flutter_tasks/core/utils/app_assets.dart';
import 'package:nti_flutter_tasks/core/utils/app_colors.dart';
import 'package:nti_flutter_tasks/core/widgets/custom_svg_picture.dart';
import 'package:nti_flutter_tasks/features/setting_screen/manager/theme_cubit/theme_cubit.dart';


ListTile customProfileSettings({
  required String title,

  required String iconPath,
  void Function()? onTap,
  bool isTrailing = true,
  required dynamic context,
}) {
  bool isAr = CacheHelper.getData(key: CacheKeys.langKey) == CacheKeys.keyAR;
  return ListTile(
    leading: CustomSvg(path: iconPath, ),
    title: Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
    ),
    trailing:
        isTrailing
            ? !isAr
                ? CustomSvg(
                  path: AppAssets.rightIcon,
                  color: ThemeCubit.get(context).getTheme().iconTheme.color,
                )
                : CustomSvg(
                  path: AppAssets.leftIcon,
                  color: ThemeCubit.get(context).getTheme().iconTheme.color,
                )
            : null,
    onTap: onTap,
  );
}
