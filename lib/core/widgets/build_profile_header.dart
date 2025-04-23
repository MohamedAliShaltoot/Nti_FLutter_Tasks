import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti_flutter_tasks/Screens/Profile%20Screen/profile_screen.dart';
import 'package:nti_flutter_tasks/core/app_assets.dart';
import 'package:nti_flutter_tasks/core/app_colors.dart';

Widget buildProfileHeader({ bool isSettings = false , required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left side: Profile picture and name
        Row(
          children: [
            // Profile picture with flag
            Container(
              width: 75,
              height:75,
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
                    fontSize: 17
                  ),
                ),
              ],
            ),
          ],
        ),
        
        //Right side: Add button
        isSettings ? Container() : Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: IconButton(
            onPressed: () {
               Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
            },
            icon: SvgPicture.asset(AppAssets.plusImage,width: 35,height: 35,),
            color: AppColors.black,
          ),
        ),
      ],
    ),
  );
}


  /*
   ListTile(
            leading: CircleAvatar(
              maxRadius: 60,

              backgroundImage: AssetImage(AppAssets.myProfileImage),
            ),
            title: Text(
              "Hello!",
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w300,
              ),
            ),
            subtitle: Text(
              "Mohamed Ali",
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w300,
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppAssets.plusImage),
              color: AppColors.black,
            ),
          ),
  */