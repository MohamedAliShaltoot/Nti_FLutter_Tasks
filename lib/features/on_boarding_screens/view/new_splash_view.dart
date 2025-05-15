// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:nti_flutter_tasks/core/widgets/task_router.dart';
import 'package:nti_flutter_tasks/features/auth/view/login_view.dart';
import 'package:nti_flutter_tasks/features/home_screen/cubit/user_cubit.dart';
import 'package:nti_flutter_tasks/features/home_screen/view/home_no_task_view.dart';
import 'package:nti_flutter_tasks/features/home_screen/view/home_tasks_view.dart';

import '../../../core/cache/cache_data.dart';
import '../../../core/cache/cache_helper.dart';
import '../../../core/cache/cache_keys.dart';
import '../../../core/helper/my_navigator.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/widgets/custom_svg_picture.dart';
import '../../auth/view/register_view.dart';
import 'starting_view.dart';



class NewSplashView extends StatefulWidget {
  const NewSplashView({super.key});

  @override
  State<NewSplashView> createState() => _NewSplashViewState();
}

class _NewSplashViewState extends State<NewSplashView> {
  @override
  void initState() {
    super.initState();
    navigate(context);
    
  }
    void navigate(context)async
    {
   Future.delayed((Duration(milliseconds: 500)),
          ()
       {
         // navigate to lets start view
         CacheData.checkFirstTime = CacheHelper.getData(key: CacheKeys.checkFirstTime);
         if(CacheData.checkFirstTime != null)
         {
           // check is logged in
           CacheData.accessToken = CacheHelper.getData(key: CacheKeys.refreshToken) ;
           if(CacheData.accessToken != null)
           {
             UserCubit.get(context).getUserDataFromAPI()
                 .then((bool result)
             {
               if(result) {
                 MyNavigator.goTo(screen: ()=> HomeScreen(), isReplace: true);
               }
               else
               {
                 MyNavigator.goTo(screen: ()=> LoginScreen(), isReplace: true);
               }
             });
           }
           else
           {
             // goto login
             MyNavigator.goTo(screen: ()=> LoginScreen(), isReplace: true);
           }
         }
         else// first time
             {
           MyNavigator.goTo(screen: ()=> StartingScreen(), isReplace: true);
         }
       });
    }

  // void navigate(context) async {
  //   await Future.delayed(const Duration(milliseconds: 500));
    
  //   // Check if it's first time using the app
  //   CacheData.checkFirstTime = CacheHelper.getData(key: CacheKeys.checkFirstTime);
  //   if(CacheData.checkFirstTime == null) {
  //     // First time opening app - go to starting screen
  //     MyNavigator.goTo(screen: () => StartingScreen(), isReplace: true);
  //     return;
  //   }
    
  //   // Not first time - check if logged in
  //   CacheData.accessToken = CacheHelper.getData(key: CacheKeys.refreshToken);
  //   if(CacheData.accessToken == null) {
  //     // Not logged in - go to login screen
  //     MyNavigator.goTo(screen: () => LoginScreen(), isReplace: true);
  //     return;
  //   }
    
  //   // User is logged in - use the TaskRouter to handle navigation
  //   // This will automatically determine which screen to show based on tasks
  //   MyNavigator.goTo(screen: () => TaskRouter(), isReplace: true);
  // }
  
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo as svg
            CustomSvg(
              path: AppAssets.rightIconSplash,
              width: MediaQuery.of(context).size.width * 0.9,
            ),
            SizedBox(height: 44), // TODO: check MediaQuery
            // Text as app name
            Text(
              AppStrings.appTitle,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w900,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


  

  





