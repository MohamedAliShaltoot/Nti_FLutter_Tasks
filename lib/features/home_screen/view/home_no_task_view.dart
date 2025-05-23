import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:nti_flutter_tasks/core/widgets/custom_svg_picture.dart';

import '../../../core/helper/my_navigator.dart';
import '../../../core/helper/my_responsive.dart';
import '../../../core/helper/svg_picture_custom.dart';
import '../../../core/translation/translation_keys.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../auth/view/login_view.dart';
import '../../profile_screen/view/profile_view.dart';
import '../cubit/user_cubit.dart';
import '../cubit/user_state.dart';
import 'home_tasks_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserError) {
          MyNavigator.goTo(screen: () => const LoginScreen(), isReplace: true);
        }
      },
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            autofocus: true,
            tooltip: TranslationKeys.addTaskTitle.tr,
            shape: const CircleBorder(),
            backgroundColor: AppColors.primary,
            onPressed: () {
              MyNavigator.goTo(
                screen: () => HomeTaskContentScreen(),
              ); //transition to the task screen
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return HomeTaskContentScreen();
              //     },
              //   ),
              // );
            },
            child:
            //  CustomSvg(
            //   path: AppAssets.paperPlusIcon,
            //   width: 24,
            //   height: 24,
            // ),
            setSvgPicture(
              assetPath: AppAssets.paperPlusIcon,
              width: 24,
              height: 24,
              color: AppColors.white,
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                //  buildProfileHeader(context: context),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ProfileScreen();
                            },
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsetsDirectional.only(
                          end: 16,
                          start: 16,
                          top: 16,
                        ),
                        height: MyResponsive.height(context, value: 60),
                        width: MyResponsive.height(context, value: 60),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image:
                                state is UserGetSuccess &&
                                        state.userModel.imagePath != null
                                    ? NetworkImage(state.userModel.imagePath!)
                                    : AssetImage(AppAssets.myProfileImage),
                            fit: BoxFit.cover,
                          ),
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

                SizedBox(height: height * 0.123),

                Text(
                  TranslationKeys.noTaskMsgTitle.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 39),
                CustomSvg(
                  path: AppAssets.noTaskImage,
                  width: MyResponsive.width(context, value: 304.96),
                  height: MyResponsive.height(
                    context,
                    value: 224.76345825195312,
                  ),
                ),

                // setSvgPicture(
                //   assetPath: AppAssets.noTaskImage,
                //   width: MyResponsive.width(context, value: 304.96),
                //   height: MyResponsive.height(
                //     context,
                //     value: 224.76345825195312,
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}


//screen width = 360
//screen height = 640