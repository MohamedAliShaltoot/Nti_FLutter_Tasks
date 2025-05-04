import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/helper/awssome_snack_bar.dart';
import '../../../core/translation/translation_helper.dart';
import '../../../core/translation/translation_keys.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/widgets/customElevatedButton.dart';
import '../../../core/widgets/customTextFormField.dart';
import '../../../core/widgets/customTextFormUserName.dart';
import '../../../core/widgets/custom_filled_btn.dart';
import '../../../core/widgets/lastStringLine.dart';
import '../../home_screen/cubit/user_cubit.dart';
import '../../home_screen/view/home_no_task_view.dart';
import '../manager/login_cubit/login_cubit.dart';
import '../manager/login_cubit/login_state.dart';
import 'register_view.dart';

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
  bool errorMsg = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: BlocConsumer<LoginCubit, LoginState>(
          builder: (context, state) {
            return Form(
              key: LoginCubit.get(context).formKey,
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
                      emailController: LoginCubit.get(context).emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          errorMsg = true;
                          return "Email cannot be empty";
                        } else if (!RegExp(
                          r'^[^@]+@[^@]+\.[^@]+',
                        ).hasMatch(value)) {
                          return "Enter a valid email";
                        }
                        return null;
                      },
                      hintText: TranslationKeys.userNameTitle.tr,
                    ),
                    const SizedBox(height: 23),
                    TextFormPasswordField.getTextFormField(
                      passwordController:
                          LoginCubit.get(context).passwordController,
                      isPasswordVisible:
                          LoginCubit.get(context).isPasswordVisible,
                      onTap: LoginCubit.get(context).togglePasswordVisibility,
                      hintText: TranslationKeys.passWordTitle.tr,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          //  errorMsg = true;
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 23),
                    Customelevatedbutton.getElevatedButton(
                      onTap: LoginCubit.get(context).onLoginPressed,
                      title: TranslationKeys.login.tr, //should be .tr to effiently work if no .tr it will display value of the key
                      fontWeight: FontWeight.w300,
                    ),
                    if (state is LoginFailure) Text(state.errorMsg),

                    const SizedBox(height: 23),
                    LastStringLine.getLastStringLine(
                      onTap: () {
                        Get.to(() => RegisterScreen());
                      //  Navigator.pop(context);
                      },
                      text1: TranslationKeys.userNoAccountTitle.tr,
                      text2: TranslationKeys.register.tr,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomFilledBtn(
                            onPressed: () {
                              TranslationHelper.changeLanguage(true);
                            },
                            text: "ar",
                          ),
                        ),
                        Expanded(
                          child: CustomFilledBtn(
                            onPressed: () {
                              TranslationHelper.changeLanguage(false);
                            },
                            text: "en",
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          listener: (context, state) {
            if (state is LoginSuccessState) {
              UserCubit.get(context).getUserData(user: state.userModel);
              showSnackBar(
                context: context,
                message:state.userModel.userName!,
                contentType: ContentType.success,
                title: "Congratulations!",
              );

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            }
            if (state is LoginFailure) {
              showSnackBar(
                context: context,
                message: 'Oh Hey!',
                contentType: ContentType.failure,
                title: state.errorMsg,
              );
            }
          },
        ),
      ),
    );
  }
}
