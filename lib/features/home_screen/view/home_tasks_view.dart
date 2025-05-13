import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/helper/my_responsive.dart';
import '../../../core/translation/translation_keys.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../cubit/user_cubit.dart';
import '../cubit/user_state.dart';
import 'widgets/custom_category_container.dart';
import 'widgets/custom_floating_button.dart';
import 'widgets/custom_group_task.dart';
import 'widgets/custom_task_content_container.dart';

class HomeTaskContentScreen extends StatelessWidget {
  const HomeTaskContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocBuilder<UserCubit, UserState>(
      builder:
          (context, state) => Scaffold(
            floatingActionButton: customFloatingButton(
              onPress: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const ToDaysTaskView(),
                //   ),
                // );
              },
              pathIcon: AppAssets.paperPlusIcon,
              toolTip:
                  TranslationKeys
                      .addTaskTitle
                      .tr, //TranslationKeys.addTaskTitle.tr
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    // buildProfileHeader(context: context),
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

image: state is UserGetSuccess &&
                          state.userModel.imagePath!=null?
                          NetworkImage(state.userModel.imagePath!)
                            :



                               AssetImage(AppAssets.myProfileImage),
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

                    SizedBox(height: 15),
                    customTaskContentContainer(
                      width: width,
                      height: height,
                      context: context,
                    ),

                    SizedBox(height: 15),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(
                          start: 10,
                          end: 235,
                        ),
                        child: Row(
                          children: [
                            Text(
                              TranslationKeys.inProgressTitle.tr,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                color: AppColors.black,
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              // alignment: Alignment.center,
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: AppColors.containerBackgroundColor,
                                borderRadius: BorderRadius.circular(10),
                                // shape: BoxShape.circle,
                              ),

                              child: Text(
                                textAlign: TextAlign.center,
                                "5",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 15),
                    Flexible(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            customCategoryContainer(
                              title: TranslationKeys.workTaskTitle.tr,
                              subTitle: TranslationKeys.workTaskSubTitle.tr,

                              containerBGC: AppColors.black,
                              iconBGC: AppColors.primary,
                              titleBGC: AppColors.white,
                              subTitleBGC: AppColors.white,
                              iconPath: AppAssets.workShopIcon,
                              width: 40,
                              height: 40,
                            ),
                            customCategoryContainer(
                              title: TranslationKeys.personalTaskTitle.tr,
                              subTitle: TranslationKeys.personalTaskSubTitle.tr,

                              containerBGC: AppColors.lightGreen,
                              iconBGC: AppColors.primary,
                              titleBGC: AppColors.gray,
                              subTitleBGC: AppColors.black,
                              iconPath: AppAssets.personalGrayIcon,
                            ),
                            customCategoryContainer(
                              title: TranslationKeys.homeTaskTitle.tr,
                              subTitle: TranslationKeys.workTaskSubTitle.tr,

                              containerBGC: AppColors.lightPink,
                              iconBGC: AppColors.pink,
                              titleBGC: AppColors.gray,
                              subTitleBGC: AppColors.black,
                              iconPath: AppAssets.homeIcon,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 10),
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          TranslationKeys.taskGroupName.tr,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    customGroupTask(
                      number: 5,
                      title: TranslationKeys.personalTaskTitle.tr,
                      iconPath: AppAssets.personalGreenIcon,
                      textNumberColor: AppColors.primary,
                      leadingIconBGC: AppColors.lightGreen,
                      traillingIconBGC: AppColors.containerBackgroundColor,
                    ),
                    customGroupTask(
                      number: 3,
                      title: TranslationKeys.homeTaskTitle.tr,
                      iconPath: AppAssets.homePinkIcon,
                      textNumberColor: AppColors.pink,
                      leadingIconBGC: AppColors.lightPink,
                      traillingIconBGC: AppColors.lightPink,
                    ),
                    customGroupTask(
                      number: 1,
                      title: TranslationKeys.workTaskTitle.tr,
                      iconPath: AppAssets.workShopIcon,
                      textNumberColor: AppColors.white,
                      leadingIconBGC: AppColors.black,
                      traillingIconBGC: AppColors.black,
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
