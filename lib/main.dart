import 'package:flutter/material.dart';

import 'core/utils/app_colors.dart';
import 'core/utils/constant.dart';
import 'features/OnBoarding%20Screens/view/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstant.appTitle,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
        fontFamily: AppConstant.fontFamily,
      ),

      home: SplashScreen(),
    );
  }
}
