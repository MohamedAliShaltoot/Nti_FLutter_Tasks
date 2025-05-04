import 'package:flutter/material.dart';
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
    navigate(context);
    super.initState();
  }

  void navigate(context) {
    Future.delayed(Duration(seconds: 2), () {
      // navigate to lets start view
      CacheData.firstTime = CacheHelper.getData(key: CacheKeys.firstTime);
      if (CacheData.firstTime != null) {
        // goto login
        MyNavigator.goTo(screen: () => RegisterScreen(), isReplace: true); //or loginView
      } else // first time
      {
        MyNavigator.goTo(screen: () => StartingScreen(), isReplace: true);
      }
    });
  }

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
