import 'package:flutter/material.dart';
import 'package:nti_flutter_tasks/features/add_task_screen/view/add_task_view.dart';

import 'package:nti_flutter_tasks/features/home_screen/view/home_no_task_view.dart';
import 'package:nti_flutter_tasks/features/home_screen/view/home_tasks_view.dart';
import 'package:nti_flutter_tasks/features/home_screen/view/to_days_task_view.dart';

import 'core/utils/app_colors.dart';
import 'core/utils/app_strings.dart';

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

      home: AddTaskView(),
    );
  }
}
