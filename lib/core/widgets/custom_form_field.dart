import 'package:flutter/material.dart';

import '../helper/my_validator.dart';


class CustomFormField extends StatelessWidget {
  const CustomFormField({super.key, required this.validator,
    required this.controller, this.obscureText = false, this.suffixIcon,
    this.label});
final AppValidator validator;
final TextEditingController controller;
final bool obscureText;
final Widget? suffixIcon;
final String? label;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator.validate,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffixIcon
      ),

    );
  }
}
