// ignore: file_names
import 'package:flutter/material.dart';

class TextFormPasswordField {
  static Widget getTextFormField({
    required TextEditingController passwordController,
    required bool isPasswordVisible,
    required void Function() onTap,
    required String hintText,
     double radius=15,
     double width = 1,
    FormFieldValidator<String>? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        obscureText: !isPasswordVisible,
        controller: passwordController,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Color.fromARGB(246, 152, 149, 161)),
          fillColor: const Color(0xffFFFFFF),
          filled: true,
          prefixIcon: const Icon(Icons.key_rounded),
          suffixIcon: InkWell(
            onTap: onTap,
            child: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide:  BorderSide(width:width),
          ),
        ),
      ),
    );
  }
}
