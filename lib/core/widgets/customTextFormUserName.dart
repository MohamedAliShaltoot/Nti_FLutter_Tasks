import 'package:flutter/material.dart';

import '../helper/svg_picture_custom.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';

class TextUserNameFormField {
  static Widget getTextFormField({
    required TextEditingController emailController,
    FormFieldValidator<String>? validator,
    required String hintText,
    double radius = 15,
    double width = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: validator,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary, width: 2),
            borderRadius: BorderRadius.circular(radius),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: Color.fromARGB(246, 152, 149, 161),fontWeight: FontWeight.w200),
          fillColor: const Color(0xffFFFFFF),
          filled: true,
          prefixIcon: IconButton(
            onPressed: () {},
            icon:setSvgPicture(assetPath: AppAssets.profile),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(width: width),
          ),
        ),
      ),
    );
  }
}
