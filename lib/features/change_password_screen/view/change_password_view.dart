import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:nti_flutter_tasks/core/helper/my_navigator.dart';
import 'package:nti_flutter_tasks/core/widgets/custom_circular_progress.dart';
import 'package:nti_flutter_tasks/features/change_password_screen/manager/change_password_cubit/change_password_cubit.dart';
import 'package:nti_flutter_tasks/features/change_password_screen/manager/change_password_cubit/change_password_state.dart';
import 'package:nti_flutter_tasks/features/setting_screen/view/setting_view.dart';

import '../../../core/translation/translation_keys.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(),
      child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
          if (state is ChangePasswordLoadingState) {
            return; // Prevent multiple taps while loading
          } else if (state is ChangePasswordSuccessState) {
            //UserCubit.get(context).getUserDataFromAPI();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("User information updated successfully")),
            );
            MyNavigator.goTo(screen: SettingScreen(), isReplace: true);
          } else if (state is ChangePasswordErrorState) {
            Get.snackbar(
              "Error",
              state.error,
              backgroundColor: Colors.red,
              colorText: Colors.white,
              duration: const Duration(seconds: 3),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: Form(
              key: ChangePasswordCubit.get(context).formKey,
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
                      emailController:
                          ChangePasswordCubit.get(
                            context,
                          ).currentPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "old password cannot be empty";
                        }
                        return null;
                      },
                      hintText: TranslationKeys.oldPasswordTitle.tr,
                    ),
                    const SizedBox(height: 23),
                    TextFormPasswordField.getTextFormField(
                      passwordController:
                          ChangePasswordCubit.get(context).passwordController,
                      isPasswordVisible:
                          ChangePasswordCubit.get(context).isPasswordVisible,
                      onTap:
                          ChangePasswordCubit.get(
                            context,
                          ).togglePasswordVisibility,
                      hintText: TranslationKeys.newPasswordTitle.tr,
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
                      passwordController:
                          ChangePasswordCubit.get(
                            context,
                          ).confirmPasswordController,
                      isPasswordVisible:
                          ChangePasswordCubit.get(
                            context,
                          ).isConfirmPasswordVisible,
                      onTap:
                          ChangePasswordCubit.get(
                            context,
                          ).toggleConfirmPasswordVisibility,
                      hintText: TranslationKeys.confirmPassWordTitle.tr,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value !=
                                ChangePasswordCubit.get(
                                  context,
                                ).passwordController.text) {
                          return "Password cannot be empty and must match the new password";
                        } else if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 23),
                    state is ChangePasswordLoadingState
                        ? CustomCircularProgressIndicator()
                        : CustomelEvatedbutton.getElevatedButton(
                          onTap:
                              ChangePasswordCubit.get(context).changePassword,
                          title: TranslationKeys.saveBtnTitle.tr,
                          fontWeight: FontWeight.w300,
                        ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
