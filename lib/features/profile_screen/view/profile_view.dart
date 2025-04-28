import 'package:flutter/material.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/widgets/build_profile_header.dart';
import '../../../core/widgets/custom_profile_container.dart';
import '../../change_password_screen/view/change_password_view.dart';
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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              buildProfileHeader(isSettings: true, context: context),
              SizedBox(height: height * 0.06),
              CustomProfileContainer.getCustomProfileContainer(
                iconPath: AppAssets.profile,
                profileNameSettings: "Update Profile",
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
                profileNameSettings: "Change Password",
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
                profileNameSettings: "Settings",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingScreen()),
                  );

                  //SettingScreen
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
