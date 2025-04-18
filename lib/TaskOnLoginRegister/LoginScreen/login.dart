import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nti_flutter_tasks/core/widgets/customElevatedButton.dart';
import 'package:nti_flutter_tasks/core/widgets/customTextFormField.dart';
import 'package:nti_flutter_tasks/core/widgets/customTextFormUserName.dart';
import 'package:nti_flutter_tasks/core/widgets/lastStringLine.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f5f4),
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
                  "assets/images/palsteen.png",
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 23),
              TextUserNameFormField.getTextFormField(
                emailController: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email cannot be empty";
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return "Enter a valid email";
                  }
                  return null;
                },
                hintText: "Username",
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
                hintText: "Password",
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
                title: "Login",
              ),
          
              const SizedBox(height: 23),
              LastStringLine.getLastStringLine(
                onTap: () {
                  Navigator.pop(context);
                },
                text1: "Don’t Have An Account?",
                text2: " Register",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
