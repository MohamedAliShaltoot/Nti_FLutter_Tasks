import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/helper/awssome_snack_bar.dart';
import '../../../core/helper/my_navigator.dart';
import '../../../core/widgets/image_manager/image_manager_view.dart';
import '../manager/register_cubit/register_cubit.dart';
import '../manager/register_cubit/register_state.dart';
import '../../home_screen/cubit/user_cubit.dart';

import '../../../core/translation/translation_keys.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/customElevatedButton.dart';
import '../../../core/widgets/customTextFormField.dart';
import '../../../core/widgets/customTextFormUserName.dart';
import '../../../core/widgets/lastStringLine.dart';
import '../../home_screen/view/home_no_task_view.dart';
import 'login_view.dart';

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
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,

        body: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccessState) {
              // UserCubit.get(context).getUserData(user: state.userModel);
              // showSnackBar(
              //   context: context,
              //   message: state.userModel.userName!,
              //   contentType: ContentType.success,
              //   title: "Congratulations!",
              // );
MyNavigator.goTo(screen: () => LoginScreen(), isReplace: true);

              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => HomeScreen()),
              // );
            }
            if (state is RegisterFailure) {
              showSnackBar(
                context: context,
                message: 'Oh Hey!',
                contentType: ContentType.failure,
                title: state.errorMsg,
              );
            }
          },
          builder: (context, state) {
            return Form(
              key: RegisterCubit.get(context).formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //add picked image here


                    
                    // SizedBox(
                    //   height: 375,
                    //   width: double.infinity,
                    //   child: Image.asset(
                    //     AppAssets.myProfileImage,
                    //     fit: BoxFit.fill,
                    //   ),
                    // )
                     ImageManagerView(
                      onPicked: (XFile image) {
                        RegisterCubit.get(context).image = image;
                      },
                      pickedBody: (XFile image) {
                        return Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            image: DecorationImage(
                              image: FileImage(File(image.path)),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      unPickedBody: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        child: Image.asset(
                          AppAssets.myProfileImage,
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.36,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                    
                    ,
                    const SizedBox(height: 23),
                    TextUserNameFormField.getTextFormField(
                      emailController:
                          RegisterCubit.get(context).emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email cannot be empty";
                        } 
                        // else if (!RegExp(
                        //   r'^[^@]+@[^@]+\.[^@]+',
                        // ).hasMatch(value)) {
                        //   return "Enter a valid email";
                        // }
                        return null;
                      },
                      hintText: TranslationKeys.userNameTitle.tr,
                    ),

                    const SizedBox(height: 23),
                    TextFormPasswordField.getTextFormField(
                      passwordController:
                          RegisterCubit.get(context).passwordController,
                      isPasswordVisible:
                          RegisterCubit.get(context).isPasswordVisible,
                      onTap:
                          RegisterCubit.get(context).togglePasswordVisibility,
                      hintText: TranslationKeys.passWordTitle.tr,
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
                    // TextFormPasswordField.getTextFormField(
                    //   passwordController:
                    //       RegisterCubit.get(context).confirmPasswordController,
                    //   isPasswordVisible:
                    //       RegisterCubit.get(context).isConfirmPasswordVisible,
                    //   onTap: RegisterCubit.get(
                    //         context,
                    //       ).togglePasswordVisibility,
                    //   hintText: TranslationKeys.confirmPassWordTitle.tr,
                    //   validator: (value) {
                    //     if (value == null ||
                    //         value.isEmpty ||
                    //         value != passwordController.text) {
                    //       return "Confirm your password";
                    //     }
                    //     return null;
                    //   },
                    // ),
                    const SizedBox(height: 15),
                   // ad choose remeber me here
                    const SizedBox(height: 15),
                   // add choose gender here

                    const SizedBox(height: 33),
                     state is RegisterLoading
                        ? Center(child: CircularProgressIndicator())
                        :
                    Customelevatedbutton.getElevatedButton(
                      onTap: RegisterCubit.get(context).onRegisterPressed,
                      title: TranslationKeys.register.tr,
                      fontWeight: FontWeight.w300,
                    ),

                    const SizedBox(height: 23),
                    LastStringLine.getLastStringLine(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      text1: TranslationKeys.alreadyHaveAccountTitle.tr,
                      text2: TranslationKeys.login.tr,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


/*
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

                  
                    ///
                    
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
                              //TODO: change appearence
                              Text(
                                TranslationKeys.rememberMeTitle.tr,
                                style: TextStyle(fontSize: 18),
                              ),
                              Checkbox(
                                fillColor: WidgetStateProperty.all<Color>(
                                  Color.fromARGB(255, 133, 183, 153),
                                ),
                                checkColor: const Color.fromARGB(
                                  255,
                                  18,
                                  17,
                                  17,
                                ),
                                activeColor: const Color.fromARGB(
                                  255,
                                  179,
                                  11,
                                  11,
                                ),

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
 */