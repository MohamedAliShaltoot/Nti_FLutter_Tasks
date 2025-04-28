import 'package:flutter/material.dart';

import 'core/utils/app_colors.dart';
import 'core/utils/app_strings.dart';
import 'features/home_screen/view/home_tasks_view.dart';

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
