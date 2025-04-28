import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/widgets/customElevatedButton.dart';
import '../../../core/widgets/customTextFormField.dart';
import '../../../core/widgets/customTextFormUserName.dart';


class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 375,
                width: double.infinity,
                child: Image.asset(
                 AppAssets.myProfileImage,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 23),
              TextUserNameFormField.getTextFormField(
                emailController: oldPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "old password cannot be empty";
                  }
                  return null;
                },
                hintText: "Old Password",
              ),
              const SizedBox(height: 23),
              TextFormPasswordField.getTextFormField(
                passwordController: passwordController,
                isPasswordVisible: isPasswordVisible,
                onTap: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                hintText: "New Password",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password cannot be empty";
                  } else if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 23),
              TextFormPasswordField.getTextFormField(
                passwordController: confirmPasswordController,
                isPasswordVisible: isConfirmPasswordVisible,
                onTap: () {
                  setState(() {
                   isConfirmPasswordVisible = !isConfirmPasswordVisible;
                  });
                },
                hintText: "Confirm Password",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password cannot be empty";
                  } else if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 23),
              Customelevatedbutton.getElevatedButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    if (passwordController.text !=
                        confirmPasswordController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Passwords do not match"),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    // Everything is valid
                    if (kDebugMode) {
                      print("Success: Form is valid and passwords match!");
                    }
                  }
                },
                title: "Save",
                fontWeight: FontWeight.w300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
