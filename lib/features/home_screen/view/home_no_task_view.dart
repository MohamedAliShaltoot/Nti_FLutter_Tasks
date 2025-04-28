import 'package:flutter/material.dart';
import 'package:nti_flutter_tasks/features/home_screen/view/home_tasks_view.dart';

import '../../../core/helper/svg_picture_custom.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/widgets/build_profile_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return HomeTaskContentScreen();
              },
            ),
          );
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

            SizedBox(height: height * 0.123),

            Text(
              AppStrings.noTaskMsg,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w300,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 39),

            setSvgPicture(
              assetPath: AppAssets.noTaskImage,
              width: width * 0.819,
              height: height * 0.322,
            ),
          ],
        ),
      ),
    );
  }
}


//screen width = 360
//screen height = 640