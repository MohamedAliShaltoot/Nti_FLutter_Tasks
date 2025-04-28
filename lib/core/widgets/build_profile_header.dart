import 'package:flutter/material.dart';

import '../../features/profile_screen/view/profile_view.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';

Widget buildProfileHeader({
  bool isSettings = false,
  required BuildContext context,
}) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left side: Profile picture and name
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          },
          child: Row(
            children: [
              // Profile picture with flag
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey[300]!),
                  image: const DecorationImage(
                    image: AssetImage(AppAssets.myProfileImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              // Name and greeting
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Hello!',
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    "Mohamed Ali",
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        //Right side: Add button
        // isSettings
        //     ? Container()
        //     : Container(
        //       width: 40,
        //       height: 40,
        //       decoration: BoxDecoration(shape: BoxShape.circle),
        //       child: IconButton(
        //         onPressed: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(builder: (context) => AddTaskView()),
        //           );
        //         },
        //         icon: SvgPicture.asset(
        //           AppAssets.plusImage,
        //           width: 35,
        //           height: 35,
        //         ),
        //         color: AppColors.black,
        //       ),
        //     ),
      ],
    ),
  );
}
