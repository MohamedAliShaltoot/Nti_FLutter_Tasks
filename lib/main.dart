import 'package:flutter/material.dart';
import 'core/utils/app_strings.dart';
import 'features/auth/view/register_view.dart';
import 'features/home_screen/view/home_no_task_view.dart';
import 'features/home_screen/view/home_tasks_view.dart';

import 'core/utils/app_colors.dart';

import 'features/on_boarding_screens/view/splash_view.dart';

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
      title: AppStrings.appTitle,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
        fontFamily: AppStrings.fontFamily,
      ),

      home: HomeTaskContentScreen(),
    );
  }
}
