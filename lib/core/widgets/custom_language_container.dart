import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

// class CustomLanguageContainer {

//   static Widget getCustomLanguaheContainer(

//     {

//       required  Color backgroundColor,
//        Color textColor = AppColors.white,
       
//     required String text,
//     }
//   ){

//     return Container(
//        color: backgroundColor,
//             // decoration: BoxDecoration(
//             //   color: backgroundColor,
//             //    borderRadius: BorderRadius.circular(10),
//             // ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 18),
//               child: Text(text,style: TextStyle(
//                 fontWeight: FontWeight.w300,
//                 color: textColor,
//                 fontSize: 20
//               ),
//               ),
//             ),
//           );

//   }
// }

class CustomLanguageContainer {
  static Widget getCustomLanguageContainer({
    required Color backgroundColor,
    Color textColor = AppColors.white,
    required String text,
    BorderRadius? borderRadius,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            color: textColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
