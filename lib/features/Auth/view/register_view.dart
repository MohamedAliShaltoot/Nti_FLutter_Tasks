
import 'package:flutter/material.dart';
import '../../../core/utils/app_assets.dart';
import '../../task_screen/view/no_task_view.dart';


import 'login_view.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/customElevatedButton.dart';
import '../../../core/widgets/customTextFormField.dart';
import '../../../core/widgets/customTextFormUserName.dart';
import '../../../core/widgets/lastStringLine.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  int selectedGender = 0;
  bool isChecked = false;
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
                height: 310,
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
                  if (value == null ||
                      value.isEmpty ||
                      value != passwordController.text) {
                    return "Confirm your password";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 27, 26, 26),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xffFFFFFF),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Remember me?",
                          style: TextStyle(fontSize: 18),
                        ),
                        Checkbox(
                          fillColor: WidgetStateProperty.all<Color>(
                            Color.fromARGB(255, 133, 183, 153),
                          ),
                          checkColor: const Color.fromARGB(255, 18, 17, 17),
                          activeColor: const Color.fromARGB(255, 179, 11, 11),

                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    fillColor: const Color(0xffFFFFFF),
                    filled: true,
                
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 12, 13, 13),
                      ),
                    ),
                  ),
                
                  dropdownColor: const Color(0xfff3f5f4),
                
                  iconEnabledColor: AppColors.primary,
                  value: selectedGender,
                  items: const [
                    DropdownMenuItem(
                      value: 0,
                      child: Text(
                        "Male",
                        style: TextStyle(
                          color: Color.fromARGB(255, 10, 10, 10),
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 1,
                      child: Text(
                        "Female",
                        style: TextStyle(
                          color: Color.fromARGB(255, 17, 17, 17),
                        ),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    // Handle gender selection
                    setState(() {});
                    selectedGender = value!;
                  },
                ),
              ),

              const SizedBox(height: 33),
              Customelevatedbutton.getElevatedButton(
                onTap: () {
                  // if (formKey.currentState!.validate()) {
                  //   if (passwordController.text !=
                  //       confirmPasswordController.text) {
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       const SnackBar(
                  //         content: Text("Passwords do not match"),
                  //         backgroundColor: Colors.red,
                  //       ),
                  //     );
                  //     return;
                  //   }

                  //   // Everything is valid
                  //   if (kDebugMode) {
                  //     print("Success: Form is valid and passwords match!");
                  //   }
                  // }



                  // disable it temporary

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TaskScreen()),
                  );
                },
                title: "Register",
                fontWeight: FontWeight.w300,
              ),

              const SizedBox(height: 23),
              LastStringLine.getLastStringLine(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                text1: "Already Have An Account?",
                text2: "Login",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
