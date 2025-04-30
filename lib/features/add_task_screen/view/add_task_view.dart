import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti_flutter_tasks/core/helper/svg_picture_custom.dart';
import 'package:nti_flutter_tasks/core/widgets/custom_calender_container.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/customElevatedButton.dart';
import 'widgets/text_task_content.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  int selectedTaskType = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackground,
        leading: IconButton(
          color: AppColors.black,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(AppAssets.goBackIcon),
        ),
        title: Text("Add Task", style: TextStyle(fontWeight: FontWeight.w300)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 26),
            Container(
              alignment: Alignment.center,
              width: 261,
              height: 207,
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
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 29),
            textTaskContent(content: "Title"),

            SizedBox(height: 17),
            textTaskContent(content: "Description"),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 27, right: 17),
              child: DropdownButtonFormField(
                icon: setSvgPicture(
                  assetPath: AppAssets.dropDownIcon,
                  width: 24,
                  height: 24,
                ),
                decoration: InputDecoration(
                  fillColor: AppColors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColors.borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primary,
                      width: 1.2,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      width: 1,
                      color: Color.fromARGB(255, 12, 13, 13),
                    ),
                  ),
                ),

                dropdownColor: const Color(0xfff3f5f4),

                iconEnabledColor: AppColors.primary,
                value: selectedTaskType,
                items: [
                  DropdownMenuItem(
                    value: 0,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            width: 28,
                            height: 28,
                            // padding: EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.lightPink,
                            ),
                            child: setSvgPicture(
                              assetPath: AppAssets.homePinkIcon,
                              width: 26,
                              height: 26,
                            ),
                          ),
                        ),
                        Text(
                          "Home",
                          style: TextStyle(
                            color: Color.fromARGB(255, 10, 10, 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 1,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            width: 26,
                            height: 26,
                            //  padding: EdgeInsets.only(left: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.primary,
                            ),
                            child: setSvgPicture(
                              assetPath: AppAssets.personalGrayIcon,
                              width: 26,
                              height: 26,
                            ),
                          ),
                        ),
                        Text(
                          "Personal",
                          style: TextStyle(
                            color: Color.fromARGB(255, 10, 10, 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            width: 26,
                            height: 26,
                            // padding: EdgeInsets.only(left: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.black,
                            ),
                            child: setSvgPicture(
                              assetPath: AppAssets.workShopIcon,
                              width: 26,
                              height: 26,
                            ),
                          ),
                        ),
                        Text(
                          "Work",
                          style: TextStyle(
                            color: Color.fromARGB(255, 10, 10, 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                onChanged: (value) {
                  // Handle gender selection
                  setState(() {});
                  selectedTaskType = value!;
                },
              ),
            ),

            SizedBox(height: 17),
            customCalenderContainer(),
            SizedBox(height: 17),

            Customelevatedbutton.getElevatedButton(
              onTap: () {},
              title: "Add Task",
              fontWeight: FontWeight.w300,
              fontSize: 19,
            ),
          ],
        ),
      ),
    );
  }
}
