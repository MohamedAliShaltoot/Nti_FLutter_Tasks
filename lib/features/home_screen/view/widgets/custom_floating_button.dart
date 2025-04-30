import 'package:flutter/material.dart';
import 'package:nti_flutter_tasks/core/helper/svg_picture_custom.dart';
import 'package:nti_flutter_tasks/core/utils/app_colors.dart';

Widget? customFloatingButton({
  required VoidCallback onPress,
  required String pathIcon,
  required String toolTip,
}) {
  return FloatingActionButton(
   // autofocus: true,
    tooltip: "Add Task",
    shape: const CircleBorder(),
    backgroundColor: AppColors.primary,
    onPressed: onPress,
    child: setSvgPicture(assetPath: pathIcon, width: 24, height: 24),
  );
}
