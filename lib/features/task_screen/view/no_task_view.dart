import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/build_profile_header.dart';
import 'widgets/task_content.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; // width=375
    double height = MediaQuery.of(context).size.height; //heght = 812

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildProfileHeader(context: context),

            SizedBox(height: height * 0.06),

            Padding(
              padding: EdgeInsets.only(
                left: width * 0.053,
                right: width * 0.677,
              ),
              child: Row(
                children: [
                  Text(
                    "Tasks",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.containerBackgroundColor,
                      borderRadius: BorderRadius.circular(20),
                      // shape: BoxShape.circle,
                    ),

                    child: Text(
                      "3",
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
            SizedBox(height:31),

            Expanded(
              child: ListView.separated(itemBuilder: (context, index){
                return buildTaskContent();
              }
              , 
              itemCount: 10, separatorBuilder: (BuildContext context, int index) { 
                return SizedBox(height: 20,);
               },),
            ),
            //ListTile()
          ],
        ),
      ),
    );
  }
}
