import 'package:flutter/material.dart';

import '../../../core/helper/svg_picture_custom.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/widgets/build_profile_header.dart';
import 'widgets/custom_category_container.dart';
import 'widgets/custom_group_task.dart';
import 'widgets/custom_task_content_container.dart';

class HomeTaskContentScreen extends StatelessWidget {
  const HomeTaskContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        autofocus: true,
        tooltip: "Add Task",
        shape: const CircleBorder(),
        backgroundColor: AppColors.primary,
        onPressed: () {
          
        },
        child: setSvgPicture(
          assetPath: AppAssets.paperPlusIcon,
          width: 24,
          height: 24,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            buildProfileHeader(context: context),

            SizedBox(height: 15),
            customTaskContentContainer(width: width, height: height),

            SizedBox(height: 15),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 10, end: 235),
                child: Row(
                  children: [
                    Text(
                      "In Progress",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      alignment: Alignment.center,
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: AppColors.containerBackgroundColor,
                        borderRadius: BorderRadius.circular(15),
                        // shape: BoxShape.circle,
                      ),

                      child: Text(
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
                      title: AppStrings.workTaskTitle,
                      subTitle: AppStrings.workTaskSubTitle,

                      containerBGC: AppColors.black,
                      iconBGC: AppColors.primary,
                      titleBGC: AppColors.white,
                      subTitleBGC: AppColors.white,
                      iconPath: AppAssets.workShopIcon,
                      width: 40,
                      height: 40,
                    ),
                    customCategoryContainer(
                      title: AppStrings.personalTaskTitle,
                      subTitle: AppStrings.personalTaskSubTitle,

                      containerBGC: AppColors.lightGreen,
                      iconBGC: AppColors.primary,
                      titleBGC: AppColors.gray,
                      subTitleBGC: AppColors.black,
                      iconPath: AppAssets.personalGrayIcon,
                    ),
                    customCategoryContainer(
                      title: AppStrings.homeTaskTitle,
                      subTitle: AppStrings.homeTaskSubTitle,

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
                  AppStrings.taskGroupName,
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                ),
              ),
            ),

            customGroupTask(
              title: AppStrings.personalTaskTitle,
              iconPath: AppAssets.personalGreenIcon,
              textNumberColor: AppColors.primary,
              leadingIconBGC: AppColors.lightGreen,
              traillingIconBGC: AppColors.containerBackgroundColor,
            ),
            customGroupTask(
              title: AppStrings.homeTaskTitle,
              iconPath: AppAssets.homePinkIcon,
              textNumberColor: AppColors.pink,
              leadingIconBGC: AppColors.lightPink,
              traillingIconBGC: AppColors.lightPink,
            ),
            customGroupTask(
              title: AppStrings.workTaskTitle,
              iconPath: AppAssets.workShopIcon,
              textNumberColor: AppColors.white,
              leadingIconBGC: AppColors.black,
              traillingIconBGC: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}


//screen width = 360
//screen height = 640