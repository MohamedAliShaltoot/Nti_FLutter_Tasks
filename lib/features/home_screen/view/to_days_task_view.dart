import 'package:flutter/material.dart';
import 'package:nti_flutter_tasks/core/helper/svg_picture_custom.dart';
import 'package:nti_flutter_tasks/core/utils/app_assets.dart';
import 'package:nti_flutter_tasks/core/utils/app_colors.dart';

class ToDaysTaskView extends StatelessWidget {
  const ToDaysTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackground,
        leading: setSvgPicture(
          assetPath: AppAssets.goBackIcon,
          width: 24,
          height: 24,
        ),
        title: Text(
          "Tasks",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 19),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        child: SafeArea(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: AppColors.white),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  fillColor: AppColors.white,
                  filled: true,
                  hintText: "Search... ",
                  hintStyle: const TextStyle(
                    color: AppColors.gray,
                    fontWeight: FontWeight.w200,
                  ),
                  suffixIcon: setSvgPicture(
                    assetPath: AppAssets.searchIcon,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              SizedBox(height: 18),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 5, end: 235),
                  child: Row(
                    children: [
                      Text(
                        "Results",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        alignment: Alignment.center,
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: AppColors.containerBackgroundColor,
                          borderRadius: BorderRadius.circular(15),
                          // shape: BoxShape.circle,
                        ),

                        child: Text(
                          textAlign: TextAlign.center,
                          "5",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 27),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 334,
                height: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            spreadRadius: 0,
                            offset: Offset(0, 2),
                            color: Color.fromARGB(255, 160, 160, 162),
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage(AppAssets.myProfileImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 14),
                    Text(
                      "Go to supermarket ",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        color: AppColors.black,
                      ),
                    ),

                    Stack(
                      // alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Positioned(
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: AppColors.containerBackgroundColor,
                                  borderRadius: BorderRadius.circular(15),
                                  // shape: BoxShape.circle,
                                ),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "In Progress",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
