
import 'package:flutter/material.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/widgets/customElevatedButton.dart';
import '../../../core/widgets/customTextFormUserName.dart';


class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();


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
                emailController: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Username cannot be empty";
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return "Enter a valid Username";
                  }
                  return null;
                },
                hintText: "Username",
              ),
          
             

              const SizedBox(height: 23),
              Customelevatedbutton.getElevatedButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                   //
                  }
                },
                title: "Update Profile",
                fontWeight: FontWeight.w300,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
