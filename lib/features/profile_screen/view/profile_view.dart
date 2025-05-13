import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/helper/my_responsive.dart';
import '../../../core/translation/translation_keys.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/custom_profile_container.dart';
import '../../change_password_screen/view/change_password_view.dart';
import '../../home_screen/cubit/user_cubit.dart';
import '../../home_screen/cubit/user_state.dart';
import '../../setting_screen/view/setting_view.dart';
import 'update_profile_view.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocBuilder<UserCubit, UserState>(
      builder:
          (context, state) => Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // buildProfileHeader(isSettings: true, context: context),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsetsDirectional.only(
                            end: 16,
                            start: 6,
                            top: 16,
                          ),
                          height: MyResponsive.height(context, value: 60),
                          width: MyResponsive.height(context, value: 60),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(AppAssets.myProfileImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                TranslationKeys.hello.tr,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.black,
                                ),
                              ),
                              SizedBox(height: 4),
                              if (state is UserGetSuccess)
                                Text(
                                  state.userModel.username ?? 'No Name',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    color: AppColors.black,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: height * 0.06),
                    CustomProfileContainer.getCustomProfileContainer(
                      iconPath: AppAssets.profile,
                      profileNameSettings:
                          TranslationKeys.updateProfileTitle.tr,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateProfileScreen(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: height * 0.03),
                    CustomProfileContainer.getCustomProfileContainer(
                      iconPath: AppAssets.lock,
                      profileNameSettings:
                          TranslationKeys.changePasswordTitle.tr,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangePasswordScreen(),
                          ),
                        );
                        //ChangePasswordScreen
                      },
                    ),

                    SizedBox(height: height * 0.03),
                    CustomProfileContainer.getCustomProfileContainer(
                      iconPath: AppAssets.settingsIcon,
                      profileNameSettings: TranslationKeys.settingsTitle.tr,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingScreen(),
                          ),
                        );

                        //SettingScreen
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
