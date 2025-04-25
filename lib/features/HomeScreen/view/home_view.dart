import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Add%20Task%20Screen/view/add_task_view.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
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
              onPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddTaskView()),
                );
              },
              icon: SvgPicture.asset(AppAssets.plusImage),
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 79),

          Text(
            "There are no tasks yet \n Press the button To add New Task ",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w300,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 39),

          Image.asset(AppAssets.noTaskImage),
        ],
      ),
    );
  }
}
