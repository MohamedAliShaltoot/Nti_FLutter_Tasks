import 'package:flutter/material.dart';

import '../../../core/helper/svg_picture_custom.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/customElevatedButton.dart';
import '../../auth/view/register_view.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(height: height * 0.11),
            setSvgPicture(assetPath: AppAssets.welcomeImage,
              width: 290,
              height: 300,
            ),
            
            //Image.asset(AppAssets.welcomeImage,width: 290,height: 300,), 
            SizedBox(height: 20),
            Text(
              'Welcome To Do It !',
              style: TextStyle(fontSize:36, fontWeight: FontWeight.w300,color: AppColors.black,),
              textAlign: TextAlign.center
            ),
            Text(
              "Ready to conquer your tasks? Let's Do It together.",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300,color: AppColors.gray),
              textAlign: TextAlign.center
            ),
             SizedBox(height: 20),
            Customelevatedbutton.getElevatedButton(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
            }, title: "Let's Start",fontWeight: FontWeight.w300),
          ],
        ),
      ),
    );
  }
}