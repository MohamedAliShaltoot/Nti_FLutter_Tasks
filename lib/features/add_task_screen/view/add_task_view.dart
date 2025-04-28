import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
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
      body: Column(
        children: [
          SizedBox(height: 46),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 57),
            child: SizedBox(
              width: 261,
              height: 207,
              child: Image.asset(AppAssets.myProfileImage),
            ),
          ),
          SizedBox(height: 29),
          textTaskContent(content: "Title"),

          SizedBox(height: 17),
          textTaskContent(content: "Description"),
          SizedBox(height: 30),

          Customelevatedbutton.getElevatedButton(
            onTap: () {},
            title: "Add Task",
            fontWeight: FontWeight.w300,
            fontSize: 19,
          ),
        ],
      ),
    );
  }
}
