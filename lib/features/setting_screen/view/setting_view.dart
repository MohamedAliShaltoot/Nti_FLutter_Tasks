import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nti_flutter_tasks/core/cache/cache_data.dart';
import 'package:nti_flutter_tasks/core/cache/cache_helper.dart';
import 'package:nti_flutter_tasks/core/cache/cache_keys.dart';
import 'package:nti_flutter_tasks/core/helper/my_snackbar.dart';
import 'package:nti_flutter_tasks/core/helper/nav_helper.dart';
import 'package:nti_flutter_tasks/core/widgets/custom_svg_picture.dart';
import 'package:nti_flutter_tasks/features/auth/view/login_view.dart';
import 'package:nti_flutter_tasks/features/home_screen/cubit/user_cubit.dart';
import 'package:nti_flutter_tasks/features/home_screen/cubit/user_state.dart';
import 'package:nti_flutter_tasks/features/setting_screen/manager/change_language_cubit/change_language_cubit.dart';
import 'package:nti_flutter_tasks/features/setting_screen/manager/change_language_cubit/change_language_state.dart';
import 'package:nti_flutter_tasks/features/setting_screen/view/widgets/custom_profile_settings.dart';
import 'package:nti_flutter_tasks/features/setting_screen/view/widgets/theme_toggeled_btn.dart';

import '../../../core/translation/translation_helper.dart';
import '../../../core/translation/translation_keys.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../change_password_screen/view/widgets/custom_language_container.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; // width=375
    double height = MediaQuery.of(context).size.height; //941.17644418894
    bool isAr = CacheHelper.getData(key: CacheKeys.langKey) == CacheKeys.keyAR;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LanguageCubit()),
        BlocProvider(create: (context) => UserCubit()),
      ],
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              // backgroundColor: AppColors.scaffoldBackground,
              leading: IconButton(
                color: AppColors.black,
                onPressed: () {
                  Navigator.pop(context);
                },
                // ignore: unrelated_type_equality_checks
                icon:
                    isAr
                        ? CustomSvg(path: AppAssets.rightIcon)
                        : CustomSvg(path: AppAssets.leftIcon),
              ),
              title: Text(
                TranslationKeys.settingsTitle.tr,
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                SizedBox(height: height * 0.124),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Row(
                    children: [
                      Text(
                        TranslationKeys.languageTitle.tr,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),

                      SizedBox(width: width * 0.23),

                      Container(
                        decoration: BoxDecoration(
                          // No need for border radius here as we'll handle it in the individual containers
                          border: Border.all(color: Colors.transparent),
                        ),

                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                LanguageCubit.get(context).changeLanguage(true);
                                // TranslationHelper.changeLanguage(true);
                              },
                              child: Stack(
                                children: [
                                  CustomLanguageContainer.getCustomLanguageContainer(
                                    backgroundColor:
                                        LanguageCubit.get(context).isArabic
                                            ? AppColors.primary
                                            : const Color(0xffD9D9D9),
                                    text: TranslationKeys.arabicTitle.tr,
                                    textColor:
                                        LanguageCubit.get(context).isArabic
                                            ? Colors.white
                                            : AppColors.black,
                                    borderRadius:
                                        LanguageCubit.get(context).isArabic
                                            ? BorderRadius.only(
                                              topRight: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                            )
                                            : BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              bottomLeft: Radius.circular(5),
                                            ),
                                  ),
                                  if (LanguageCubit.get(context).isArabic)
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        margin: EdgeInsets.all(4),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                //  TranslationHelper.changeLanguage(false);
                                LanguageCubit.get(
                                  context,
                                ).changeLanguage(false);
                              },
                              child: Stack(
                                children: [
                                  CustomLanguageContainer.getCustomLanguageContainer(
                                    backgroundColor:
                                        !LanguageCubit.get(context).isArabic
                                            ? AppColors.primary
                                            : const Color(0xffD9D9D9),
                                    text: TranslationKeys.englishTitle.tr,
                                    textColor:
                                        !LanguageCubit.get(context).isArabic
                                            ? Colors.white
                                            : AppColors.black,
                                    borderRadius:
                                        LanguageCubit.get(context).isArabic
                                            ? BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              bottomLeft: Radius.circular(5),
                                            )
                                            : BorderRadius.only(
                                              topRight: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                            ),
                                  ),
                                  if (!LanguageCubit.get(context).isArabic)
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          color: AppColors.red,
                                          shape: BoxShape.circle,
                                        ),
                                        margin: EdgeInsets.all(4),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 80),
                // BlocConsumer<UserCubit, UserState>(
                //   listener: (context, state) {
                //     if (state is UserLogoutState) {
                //       MySnackbar.success(context, state.message);
                //       NavHelper.pushReplaceAll(() => LoginScreen());
                //     }
                //   },
                //   builder: (context, state) {
                //     return customProfileSettings(
                //       title: TranslationKeys.logoutBtnTitle.tr,
                //       iconPath: AppAssets.logOutIcon,
                //       context: context,
                //       isTrailing: false,
                //       onTap: () {
                //         UserCubit.get(context).logOut();
                //       },
                //     );
                //   },
                // ),
                // theme
                ThemeToggleButton(),
              ],
            ),
          );
        },
      ),
    );
  }
}


 // BoxDecoration(
                        //                               shape: BoxShape.circle,
                        //                               image: DecorationImage(
                        //                                 image:
                        //                                     state is UserGetSuccess &&
                        //                                             state.userModel.imagePath != null
                        //                                         ? NetworkImage(state.userModel.imagePath!)
                        //                                         : AssetImage(AppAssets.myProfileImage),
                        //                                 fit: BoxFit.cover,
                        //                               ),
                        //                             )