import 'package:flutter/material.dart';
import 'package:nti_flutter_tasks/core/helper/svg_picture_custom.dart';
import 'package:nti_flutter_tasks/core/utils/app_assets.dart';
import 'package:nti_flutter_tasks/core/utils/app_colors.dart';

Widget customCardDetailsTodaysView({
  required String title,
  required String progress,
  required String iconPath,
  required Color iconBGC,
  required Color textBGC,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      width: 334,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              width: 65,
              height: 68,
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
          ),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 90,
                        height: 20,
                        decoration: BoxDecoration(
                          color: textBGC,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          progress,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: iconBGC,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 30,
                        height: 30,
                        child: setSvgPicture(
                          assetPath: iconPath,
                          width: 45,
                          height: 45,
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
    ),
  );
}
