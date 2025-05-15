// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:nti_flutter_tasks/features/auth/view/login_view.dart';
import 'package:nti_flutter_tasks/features/home_screen/cubit/user_cubit.dart';
import 'package:nti_flutter_tasks/features/home_screen/view/home_no_task_view.dart';

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

  

// void navigate(BuildContext context) async {
//     await Future.delayed(const Duration(seconds: 2));
//     final checkFirstTime = CacheHelper.getData(key: CacheKeys.checkFirstTime);
//     // ignore: avoid_print
//     print("🔥 checkFirstTime in Splash: $checkFirstTime");

//     if (checkFirstTime != null && checkFirstTime == true) {
//        CacheData.accessToken = CacheHelper.getData(key: CacheKeys.accessToken);
//       if (CacheData.accessToken != null) {
//         UserCubit.get(context).getUserDataFromApi(
          
//         );
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (_) => const HomeScreen()),
//         );
//       } else {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (_) => const LoginScreen()),
//         );
//       }
//     } else {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (_) => const StartingScreen()),
//       );
//     }
//   }
//   void navigate(context) async {
// await Future.delayed(Duration(seconds: 2), ()         {
//      // CacheHelper.removeData(key:  CacheKeys.checkFirstTime);
//       // navigate to lets start view
//       // CacheHelper.removeData(
//       //   key: CacheKeys.checkFirstTime,
//       // );
//       CacheData.checkFirstTime = CacheHelper.getData(key: CacheKeys.checkFirstTime);
//       print("🧪 checkFirstTime value: ${CacheData.checkFirstTime}");
//       if (CacheData.checkFirstTime != null) {
//         // check is logged in
//         CacheData.accessToken = CacheHelper.getData(key: CacheKeys.accessToken);
//         if (CacheData.accessToken != null) {
//           // TODO:
//           MyNavigator.goTo(screen: () => HomeScreen(), isReplace: true);
//         } else {
//           // goto login
//           MyNavigator.goTo(screen: () => LoginScreen(), isReplace: true);
//         }
//       } else // first time
//       {
//         MyNavigator.goTo(screen: () => StartingScreen(), isReplace: true);
//       }
//     });

//   }

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
