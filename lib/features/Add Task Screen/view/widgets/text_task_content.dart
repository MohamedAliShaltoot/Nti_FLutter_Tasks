import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

Widget textTaskContent({required String content,
  TextEditingController? controller,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 27),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 1.2),
          borderRadius: BorderRadius.circular(15),
        ),

        hintText: content,
        hintStyle: const TextStyle(
          color: AppColors.gray,
          fontWeight: FontWeight.w200,
        ),
      ),
    ),
  );
}
