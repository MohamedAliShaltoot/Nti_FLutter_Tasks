import 'package:flutter/material.dart';

class TextUserNameFormField{

  static Widget getTextFormField({
    required TextEditingController emailController,
    FormFieldValidator<String>? validator,
    required String hintText,
     double radius = 15,
    double width = 1,

  }){
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: validator,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: const TextStyle(
                    color: Color.fromARGB(246, 152, 149, 161),
                  ),
                  fillColor: const Color(0xffFFFFFF),
                  filled: true,
                  prefixIcon: const Icon(Icons.person_2_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius),
                    borderSide:  BorderSide(width: width),
                  ),
                ),
              ),
            );
  }
}