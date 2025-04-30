import 'package:flutter/material.dart';

import 'package:nti_flutter_tasks/core/helper/svg_picture_custom.dart';
import 'package:nti_flutter_tasks/core/utils/app_assets.dart';
import 'package:nti_flutter_tasks/core/utils/app_colors.dart';
import 'package:nti_flutter_tasks/features/home_screen/data/filter_screen.dart';
import 'package:nti_flutter_tasks/features/home_screen/view/widgets/custom_card_details_todays_view.dart';
import 'package:nti_flutter_tasks/features/home_screen/view/widgets/custom_floating_button.dart';

class ToDaysTaskView extends StatelessWidget {
  const ToDaysTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: customFloatingButton(
        onPress: () {
          showFilterModal(context);
        },
        pathIcon: AppAssets.filterkIcon,
        toolTip: 'filter tasks',
      ),

      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackground,
        leading: setSvgPicture(
          onPressed: () {
            Navigator.pop(context);
          },
          assetPath: AppAssets.goBackIcon,
          width: 24,
          height: 24,
        ),
        title: Text(
          "Tasks",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: AppColors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                        color: AppColors.primary,
                        width: 3,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    fillColor: AppColors.white,
                    filled: true,
                    hintText: "Search... ",
                    hintStyle: const TextStyle(
                      color: AppColors.gray,
                      fontWeight: FontWeight.w200,
                    ),
                    suffixIcon: setSvgPicture(
                      assetPath: AppAssets.searchIcon,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
                SizedBox(height: 18),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 5,
                      end: 235,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Results",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 0.01),
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: AppColors.containerBackgroundColor,
                            borderRadius: BorderRadius.circular(15),
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
                SizedBox(height: 27),

                customCardDetailsTodaysView(
                  title: "Go to supermarket to buy some milk & eggs",
                  progress: "In Progress",
                  iconPath: AppAssets.workShopIcon,
                  iconBGC: AppColors.black,
                  textBGC: AppColors.containerBackgroundColor,
                ),
                customCardDetailsTodaysView(
                  title: "Go to supermarket to buy some milk & eggs",
                  progress: "Done",
                  iconPath: AppAssets.workShopIcon,
                  iconBGC: AppColors.black,
                  textBGC: AppColors.primary,
                ),
                customCardDetailsTodaysView(
                  title: "Go to supermarket to buy some milk & eggs",
                  progress: "Done",
                  iconPath: AppAssets.homeIcon,
                  iconBGC: AppColors.pink,
                  textBGC: AppColors.primary,
                ),
                customCardDetailsTodaysView(
                  title: "Go to supermarket to buy some milk & eggs",
                  progress: "Missed",
                  iconPath: AppAssets.personalGrayIcon,
                  iconBGC: AppColors.primary,
                  textBGC: AppColors.red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
