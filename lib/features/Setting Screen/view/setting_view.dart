import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/custom_language_container.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; // width=375
    double height = MediaQuery.of(context).size.height; //941.17644418894

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackground,
        leading: IconButton(
          color: AppColors.black,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(AppAssets.goBackIcon),
        ),
        title: Text("Settings", style: TextStyle(fontWeight: FontWeight.w300)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: height * 0.124),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Row(
              children: [
                Text(
                  "Language",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),

                SizedBox(width: width * 0.23),

               Container(
                  decoration: BoxDecoration(
                    // No need for border radius here as we'll handle it in the individual containers
                    border: Border.all(color: Colors.transparent),
                  ),
                  child: Row(
                    children: [
                      CustomLanguageContainer.getCustomLanguageContainer(
                        backgroundColor: Color(0xffD9D9D9),
                        text: "AR",
                        textColor: AppColors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                      ),
                      CustomLanguageContainer.getCustomLanguageContainer(
                        backgroundColor: AppColors.primary,
                        text: "En",
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
