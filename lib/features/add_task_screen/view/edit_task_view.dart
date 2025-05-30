// ignore_for_file: use_build_context_synchronously

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:nti_flutter_tasks/core/cache/cache_data.dart';
import 'package:nti_flutter_tasks/core/cache/cache_helper.dart';
import 'package:nti_flutter_tasks/core/cache/cache_keys.dart';
import 'package:nti_flutter_tasks/core/helper/my_navigator.dart';
import 'package:nti_flutter_tasks/core/translation/translation_keys.dart';
import 'package:nti_flutter_tasks/core/widgets/custom_app_bar.dart';
import 'package:nti_flutter_tasks/core/widgets/custom_circular_progress.dart';
import 'package:nti_flutter_tasks/core/widgets/custom_svg_picture.dart';
import 'package:nti_flutter_tasks/features/add_task_screen/data/models/get_task_response_model.dart';
import 'package:nti_flutter_tasks/features/add_task_screen/manager/delete_task_cubit/delete_task_cubit.dart';
import 'package:nti_flutter_tasks/features/add_task_screen/manager/delete_task_cubit/delete_task_state.dart';
import 'package:nti_flutter_tasks/features/add_task_screen/manager/edit_task_cubit/edit_task_cubit.dart';
import 'package:nti_flutter_tasks/features/add_task_screen/manager/edit_task_cubit/edit_task_state.dart';
import 'package:nti_flutter_tasks/features/home_screen/view/home_no_task_view.dart';
import 'package:nti_flutter_tasks/features/home_screen/view/home_tasks_view.dart';

import '../../../core/helper/svg_picture_custom.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/customElevatedButton.dart';
import '../../../core/widgets/custom_calender_container.dart';

import 'widgets/text_task_content.dart';

class EditTaskView extends StatefulWidget {
  const EditTaskView({super.key, required int taskID});

  @override
  State<EditTaskView> createState() => _EditTaskViewState();
}

class _EditTaskViewState extends State<EditTaskView> {
  late EditTaskCubit editTaskCubit;
  bool isAr = CacheHelper.getData(key: CacheKeys.langKey) == CacheKeys.keyAR;
  

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => EditTaskCubit()),
        BlocProvider(create: (context) => DeleteTaskCubit()),
      ],
      child: Scaffold(
        // backgroundColor: AppColors.scaffoldBackground,
        appBar: CustomAppBar(
          title: TranslationKeys.editTaskTitle.tr,
          leading: IconButton(
            color: AppColors.black,
            onPressed: () {
              Navigator.pop(context);
            },
            icon:isAr
                        ? CustomSvg(path: AppAssets.rightIcon)
                        : CustomSvg(path: AppAssets.leftIcon),
          ),
          actions: [
            BlocConsumer<DeleteTaskCubit, DeleteTaskState>(
              listener: (context, state) {
                if (state is DeleteTaskSuccess) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                  MyNavigator.goTo(
                    screen: HomeTaskContentScreen(),
                    isReplace: true,
                  );
                  // AddTaskCubit.get(context).getTasks();
                } else if (state is DeleteTaskError) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.error)));
                }
              },
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsetsDirectional.only(end: 10),
                  child: GestureDetector(
                    onTap: () async {
                      if (state is DeleteTaskLoading) {
                        return; // Prevent multiple taps while loading
                      }

                      // Show the dialog and wait for result
                      final shouldDelete = await showDialog<bool>(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              backgroundColor: Colors.white,
                              elevation: 8,
                              title: Column(
                                children: [
                                  Icon(
                                    Icons.warning_amber_rounded,
                                    color: AppColors.red,
                                    size: 48,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    TranslationKeys.deleteTaskTitle.tr,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              content: Text(
                                TranslationKeys.deleteTaskMsgTitle.tr,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              actionsAlignment: MainAxisAlignment.center,
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(
                                      context,
                                      false,
                                    ); // Return false - don't delete
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey.shade200,
                                    foregroundColor: Colors.black87,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                  ),
                                  child: Text(
                                    TranslationKeys.cancelBtnTitle.tr,
                                  ),
                                ),
                                SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(
                                      context,
                                      true,
                                    ); // Return true - delete the task
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.red,
                                    foregroundColor: Colors.white,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                  ),
                                  child: Text(
                                    TranslationKeys.deleteBtnTitle.tr,
                                  ),
                                ),
                              ],
                            ),
                      );

                      // If user confirmed deletion
                      if (shouldDelete == true) {
                        DeleteTaskCubit.get(
                          context,
                        ).onDeleteBtnPressed(EditTaskCubit.id);
                      }
                    },
                    child: Row(
                      children: [
                        setSvgPicture(
                          assetPath: AppAssets.deleteIcon,
                          width: 20,
                          height: 20,
                          color: AppColors.red,
                        ),
                        SizedBox(width: 10),
                        Text(
                          TranslationKeys.deleteTaskTitle.tr,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: AppColors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),

        body: SingleChildScrollView(
          child: BlocConsumer<EditTaskCubit, EditTaskState>(
            listener: (context, state) {
              if (state is EditTaskSuccessState) {
                MyNavigator.goTo(
                  screen: HomeTaskContentScreen(),
                  isReplace: true,
                );
              }
            },
            builder: (context, state) {
              return Form(
                key: EditTaskCubit.get(context).formKey,
                child: Column(
                  children: [
                    SizedBox(height: 26),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 27),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70), //
                              // shape: BoxShape.circle,
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

                          SizedBox(width: 10),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("In Progress"),
                              SizedBox(height: 5),
                              Text(
                                "Believe you can, \n and you're halfway there.",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 29),
                    // dropDownListItem
                    SizedBox(height: 17),
                    textTaskContent(
                      content: "Title",
                      controller: EditTaskCubit.get(context).titleController,
                    ),

                    SizedBox(height: 17),
                    textTaskContent(
                      content: "Description",

                      controller:
                          EditTaskCubit.get(context).descriptionController,
                    ),
                    SizedBox(height: 17),
                    customCalenderContainer(),
                    SizedBox(height: 37),
                    // CustomelEvatedbutton.getElevatedButton(
                    //   onTap: () {
                    //     //   EditTaskCubit.get(context).onUpDateBtnPressed();
                    //   },
                    //   title: "Mark as Done",
                    //   fontWeight: FontWeight.w300,
                    //   fontSize: 19,
                    // ),
                    SizedBox(height: 17),
                    state is EditTaskLoadingState
                        ? CustomCircularProgressIndicator()
                        : CustomOutLinedelevatedbutton.getElevatedButton(
                          onTap: () {
                            EditTaskCubit.get(
                              context,
                            ).onUpDateBtnPressed(EditTaskCubit.id);
                          },
                          title: TranslationKeys.updateBtnTitle.tr,
                        ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
  

  /*

AppBar(
        backgroundColor: AppColors.scaffoldBackground,
        leading: IconButton(
          color: AppColors.black,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (builder) => AddTaskView()),
            );
            // Navigator.push(context, MaterialPageRoute(builder: (context) => AddTaskView()));
            // Navigator.pop(context);
          },
          icon: SvgPicture.asset(AppAssets.goBackIcon),
        ),
        title: Text("Edit Task", style: TextStyle(fontWeight: FontWeight.w300)),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 20),
            child: Container(
              padding: EdgeInsets.only(right: 10),
              width: 120,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // ignore: deprecated_member_use
                color: AppColors.red,
              ),
              child: Row(
                children: [
                  setSvgPicture(
                    assetPath: AppAssets.deleteIcon,
                    width: 20,
                    height: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Delete",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        centerTitle: true,
      )

  */



  //  Padding(
  //             padding: const EdgeInsets.only(left: 27, right: 17),
  //             child: DropdownButtonFormField(
  //               icon: setSvgPicture(
  //                 assetPath: AppAssets.dropDownIcon,
  //                 width: 24,
  //                 height: 24,
  //               ),
  //               decoration: InputDecoration(
  //                 fillColor: AppColors.white,
  //                 filled: true,
  //                 enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15),
  //                   borderSide: BorderSide(color: AppColors.borderColor),
  //                 ),
  //                 focusedBorder: OutlineInputBorder(
  //                   borderSide: BorderSide(
  //                     color: AppColors.primary,
  //                     width: 1.2,
  //                   ),
  //                   borderRadius: BorderRadius.circular(15),
  //                 ),

  //                 border: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15),
  //                   borderSide: BorderSide(
  //                     width: 1,
  //                     color: Color.fromARGB(255, 12, 13, 13),
  //                   ),
  //                 ),
  //               ),

  //               dropdownColor: const Color(0xfff3f5f4),

  //               iconEnabledColor: AppColors.primary,
  //               value: selectedTaskType,
  //               items: [
  //                 customDropDownList(
  //                   iconPath: AppAssets.homePinkIcon,
  //                   icontainerIconBGC: AppColors.lightPink,
  //                   textType: "Home",
  //                   itemValue: 0,
  //                 ),
  //                 customDropDownList(
  //                   iconPath: AppAssets.personalGrayIcon,
  //                   icontainerIconBGC: AppColors.primary,
  //                   textType: "Personal",
  //                   itemValue: 1,
  //                 ),
  //                 customDropDownList(
  //                   iconPath: AppAssets.workShopIcon,
  //                   icontainerIconBGC: AppColors.black,
  //                   textType: "Work",
  //                   itemValue: 2,
  //                 ),
  //               ],
  //               onChanged: (value) {
  //                 // Handle gender selection
  //                 setState(() {});
  //                 selectedTaskType = value!;
  //               },
  //             ),
  //           )