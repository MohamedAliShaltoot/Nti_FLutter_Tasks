import 'package:flutter/material.dart';

import '../../../../core/helper/svg_picture_custom.dart';
import '../../../../core/utils/app_colors.dart';

Widget? customFloatingButton({
  required VoidCallback onPress,
  required String pathIcon,
  required String toolTip,
  Color color = AppColors.white,
}) {
  return FloatingActionButton(
    // autofocus: true,
    tooltip: toolTip,
    shape: const CircleBorder(),
    backgroundColor: AppColors.primary,
    onPressed: onPress,
    child: setSvgPicture(
      assetPath: pathIcon,
      width: 24,
      height: 24,
      color: color,
    ),
  );
}
