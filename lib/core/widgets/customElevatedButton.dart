
import 'package:flutter/material.dart';
import 'package:nti_flutter_tasks/core/utils/app_colors.dart';

class CustomelEvatedbutton {
  static Widget getElevatedButton({
    required void Function() onTap,
    required String title,
    FontWeight fontWeight = FontWeight.w600,

    double fontSize = 22,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          alignment: AlignmentDirectional.center,
          backgroundColor: AppColors.primary,
          fixedSize: const Size(381, 48),
          foregroundColor: Colors.white,
          elevation: 20,
          shadowColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: onTap,
        child: Text(
          title,
          style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
        ),
      ),
    );
  }
}

class CustomOutLinedelevatedbutton {
  static Widget getElevatedButton({
    required void Function() onTap,
    required String title,
    FontWeight fontWeight = FontWeight.w400,

    double fontSize = 19,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          alignment: AlignmentDirectional.center,
          backgroundColor: AppColors.white,
          fixedSize: const Size(381, 48),
          foregroundColor: AppColors.primary,
          elevation: 20,
          shadowColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: BorderSide(color: AppColors.primary),
          ),
        ),
        onPressed: onTap,
        child: Text(
          title,
          style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
        ),
      ),
    );
  }
}
