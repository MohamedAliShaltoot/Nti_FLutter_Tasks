import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';

Widget buildTaskContent() {
return Container(
              width:250,
              height:100,
              decoration: BoxDecoration(
                color: AppColors.containerBackgroundColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: Offset(0, 4),
                    color: AppColors.black.withAlpha(64),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "My First Task",
                           maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: AppColors.gray,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          "Improve my English \n skills by trying to speek",
                          // maxLines: 1,
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text("11/03/2025",
                        style: TextStyle(color: AppColors.gray),
                      ), Text("05:00 PM",
                        style: TextStyle(color: AppColors.gray),
                      )],
                  ),
                ],
              ),
            );
}
