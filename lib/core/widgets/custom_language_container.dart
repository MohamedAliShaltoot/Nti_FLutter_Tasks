import 'package:flutter/material.dart';
import 'package:nti_flutter_tasks/core/app_colors.dart';

class CustomLanguageContainer {

  static Widget getCustomLanguaheContainer(

    {

      required  Color backgroundColor,
       Color textColor = AppColors.white,
       
    required String text,
    }
  ){

    return Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              // borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(text,style: TextStyle(
                fontWeight: FontWeight.w300,
                color: textColor,
                fontSize: 20
              ),
              ),
            ),
          );

  }
}

