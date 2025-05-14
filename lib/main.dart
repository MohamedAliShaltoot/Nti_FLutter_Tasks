import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nti_flutter_tasks/features/add_task_screen/data/repo/tasks_repo.dart';
import 'package:nti_flutter_tasks/features/add_task_screen/manager/add_task_cubit.dart';

import 'core/cache/cache_data.dart';
import 'core/cache/cache_helper.dart';
import 'core/translation/translation_helper.dart';
import 'core/utils/app_colors.dart';
import 'core/utils/app_strings.dart';
import 'features/home_screen/cubit/user_cubit.dart';
import 'features/on_boarding_screens/view/new_splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await TranslationHelper.setLanguage();

  runApp(RepositoryProvider(create: (BuildContext context) { 
    return TasksRepo();

   },
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocProvider(
          create: (context) => UserCubit(),

        ),
        BlocProvider(
          create: (context) => AddTaskCubit()..getTasks(),
                    lazy: false, // to load the tasks when the app starts
        ),
      ],
      
      child: GetMaterialApp(
        locale: Locale(CacheData.lang!),
        translations: TranslationHelper(),
        debugShowCheckedModeBanner: false,
        title: AppStrings.appTitle,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.scaffoldBackground,
          fontFamily: AppStrings.fontFamily,
        ),
        //HomeScreen
        //NewSplashView
        home: NewSplashView(),
        // problem was in call splashScreen not NewSplashView 
      ),
    );
  }
}
