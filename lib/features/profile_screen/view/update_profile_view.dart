import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nti_flutter_tasks/core/helper/my_logger.dart';
import 'package:nti_flutter_tasks/core/helper/my_navigator.dart';
import 'package:nti_flutter_tasks/core/widgets/custom_circular_progress.dart';
import 'package:nti_flutter_tasks/core/widgets/image_manager/image_manager_view.dart';
import 'package:nti_flutter_tasks/features/home_screen/cubit/user_cubit.dart';
import 'package:nti_flutter_tasks/features/home_screen/view/home_tasks_view.dart';
import 'package:nti_flutter_tasks/features/profile_screen/manager/update_profile_cubit/update_profile_cubit.dart';
import 'package:nti_flutter_tasks/features/profile_screen/manager/update_profile_cubit/update_profile_state.dart';

import '../../../core/translation/translation_keys.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/widgets/customElevatedButton.dart';
import '../../../core/widgets/customTextFormUserName.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProfileCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
          listener: (context, state) {
            if (state is UpdateProfileLoadingState) {
              return; // Prevent multiple taps while loading
            } else if (state is UpdateProfileSuccessState) {
              UserCubit.get(context).getUserDataFromAPI();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("User information updated successfully"),
                ),
              );
              MyNavigator.goTo(
                screen: HomeTaskContentScreen(),
                isReplace: true,
              );
            } else if (state is UpdateProfileErrorState) {
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
            return Form(
              key: UpdateProfileCubit.get(context).formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // SizedBox(
                    //   height: 375,
                    //   width: double.infinity,
                    //   child: Image.asset(
                    //     AppAssets.myProfileImage,
                    //     fit: BoxFit.fill,
                    //   ),
                    // ),
                    ImageManagerView(
                      onPicked: (XFile image) {
                        UpdateProfileCubit.get(context).image = image;
                        UserCubit.sharedImageOnAllScreens=
                            UserCubit.get(context).userModel!.imagePath!;
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
                              image: NetworkImage(
                               UserCubit.sharedImageOnAllScreens,
                              ),
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
                    ),
                    const SizedBox(height: 23),
                    TextUserNameFormField.getTextFormField(
                      emailController:
                          UpdateProfileCubit.get(context).userNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username cannot be empty";
                        }
                        //  else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        //   return "Enter a valid Username";
                        // }
                        return null;
                      },
                      hintText: TranslationKeys.userNameTitle.tr,
                    ),

                    const SizedBox(height: 23),
                    state is UpdateProfileLoadingState
                        ? CustomCircularProgressIndicator()
                        : CustomelEvatedbutton.getElevatedButton(
                          onTap:
                           UpdateProfileCubit.get(context).updateProfileBtn,
                          // () {
                          //   MyLogger.yellow(
                          //     "${UserCubit.get(context).userModel!.imagePath}",
                          //   );
                          //     UpdateProfileCubit.get(context).updateProfileBtn;
                          // },
                          title: TranslationKeys.updateProfileTitle.tr,
                          fontWeight: FontWeight.w300,
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
