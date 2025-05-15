// ignore_for_file: deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:nti_flutter_tasks/core/helper/my_navigator.dart';
import 'package:nti_flutter_tasks/features/add_task_screen/data/repo/tasks_repo.dart';
import 'package:nti_flutter_tasks/features/add_task_screen/manager/add_task_cubit/add_task_cubit.dart';
import 'package:nti_flutter_tasks/features/add_task_screen/manager/add_task_cubit/add_task_state.dart';
import 'package:nti_flutter_tasks/features/add_task_screen/manager/delete_task_cubit/delete_task_cubit.dart';
import 'package:nti_flutter_tasks/features/add_task_screen/manager/edit_task_cubit/edit_task_cubit.dart';
import 'package:nti_flutter_tasks/features/add_task_screen/view/edit_task_view.dart';
import 'package:nti_flutter_tasks/features/profile_screen/view/profile_view.dart';

import '../../../core/helper/my_responsive.dart';
import '../../../core/translation/translation_keys.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../add_task_screen/view/add_task_view.dart';
import '../cubit/user_cubit.dart';
import '../cubit/user_state.dart';
import 'widgets/custom_category_container.dart';
import 'widgets/custom_floating_button.dart';
import 'widgets/custom_group_task.dart';
import 'widgets/custom_task_content_container.dart';

class HomeTaskContentScreen extends StatelessWidget {
  const HomeTaskContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    // TasksRepo tasksRepo = TasksRepo();
    return BlocBuilder<UserCubit, UserState>(
      // listener: (context, state) {
      //           if (state is AddTaskSuccessState) {
      //     context.read<AddTaskCubit>().refreshTasks();
      //   }

      // },
      builder:
          (context, state) => Scaffold(
            floatingActionButton: customFloatingButton(
              onPress: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => BlocProvider.value(
                          value: BlocProvider.of<AddTaskCubit>(context),
                          child: AddTaskView(),
                        ),
                  ),
                );
                if (context.mounted) {
                  context.read<AddTaskCubit>().refreshTasks();
                  //  UserCubit.sharedImageOnAllScreens =
                  //     state is UserGetSuccess &&
                  //             state.userModel.imagePath != null
                  //         ? NetworkImage(state.userModel.imagePath!)
                  //         : AssetImage(AppAssets.myProfileImage);
                }
              },
              pathIcon: AppAssets.paperPlusIcon,
              toolTip:
                  TranslationKeys
                      .addTaskTitle
                      .tr, //TranslationKeys.addTaskTitle.tr
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    // buildProfileHeader(context: context),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ProfileScreen();
                                },
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsetsDirectional.only(
                              end: 16,
                              start: 6,
                              top: 16,
                            ),
                            height: MyResponsive.height(context, value: 60),
                            width: MyResponsive.height(context, value: 60),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image:
                                    state is UserGetSuccess &&
                                            state.userModel.imagePath != null
                                        ? NetworkImage(
                                          state.userModel.imagePath!,
                                        )
                                        : AssetImage(AppAssets.myProfileImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                TranslationKeys.hello.tr,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.black,
                                ),
                              ),
                              SizedBox(height: 4),
                              if (state is UserGetSuccess)
                                Text(
                                  state.userModel.username ?? 'No Name',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    color: AppColors.black,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 15),

                    // customTaskContentContainer(
                    //   width: width,
                    //   height: height,
                    //   context: context,
                    // ),
                    SizedBox(height: 15),

                    //progress
                    SizedBox(height: 15),

                    //flexible
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 10),
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          TranslationKeys.taskGroupName.tr,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),

                    // here i want to add the list of tasks that i got from the api
                    BlocProvider(
                      create: (context) {
                        final cubit = AddTaskCubit();
                        cubit.getTasks();
                        return cubit;
                      },
                      child: BlocConsumer<AddTaskCubit, AddTaskState>(
                        listener: (context, state) {
                          if (state is AddTaskSuccessState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message)),
                            );
                            context.read<AddTaskCubit>().getTasks();
                          }
                        },
                        builder: (context, state) {
                          if (state is AddTaskLoadingState) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is AddTaskErrorState) {
                            return Center(child: Text(state.error));
                          } else if (state is GetTasksState &&
                              state.tasks.isNotEmpty) {
                            return Expanded(
                              child: ListView.builder(
                                itemCount: state.tasks.length,
                                itemBuilder: (context, index) {
                                  final task = state.tasks[index];
                                  String apiTimestamp = task.createdAt ?? '';
                                  // Parse the date
                                  DateTime dateTime = DateFormat(
                                    "EEE, dd MMM yyyy HH:mm:ss 'GMT'",
                                  ).parse(apiTimestamp);

                                  // Format the date and time parts
                                  String fullDate = DateFormat(
                                    'EEE, dd MMM yyyy',
                                  ).format(dateTime);
                                  String time = DateFormat(
                                    'HH:mm:ss',
                                  ).format(dateTime);

                                  return GestureDetector(
                                    onTap: () {
                                      //print id
                                      // ignore: avoid_print
                                      print('Task ID/${task.id}');
                                      EditTaskCubit.id = task.id!;
                                      EditTaskCubit.InitialTitleController =
                                          TextEditingController(
                                            text: task.title,
                                          );
                                      EditTaskCubit
                                              .InitialDescriptionController =
                                          TextEditingController(
                                            text: task.description,
                                          );
                                      MyNavigator.goTo(
                                        screen:
                                            () =>
                                                EditTaskView(taskID: task.id!),
                                      );
                                      if (context.mounted) {
                                        context.read<AddTaskCubit>().getTasks();
                                      }
                                    },
                                    child: Dismissible(
                                      key: Key(task.id.toString()),
                                      background: Container(
                                        color: AppColors.primary,
                                        alignment: Alignment.centerLeft,
                                        child: const Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        ),
                                      ),
                                      secondaryBackground: Container(
                                        color: AppColors.primary,
                                        alignment: Alignment.centerRight,
                                        child: const Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                        ),
                                      ),
                                      onDismissed: (direction) {
                                        if (direction ==
                                            DismissDirection.startToEnd || direction ==
                                                DismissDirection.endToStart) {
                                          // Handle left swipe
                                          DeleteTaskCubit.get(
                                            context,
                                          ).onDeleteBtnPressed(task.id);
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                "Task deleted successfully",
                                              ),
                                            ),
                                          );
                                          print('Left swipe');
                                        }
                                        //  else if (direction ==
                                        //     DismissDirection.endToStart) {
                                        //   // Handle right swipe
                                        //   print('Right swipe');

                                        //   MyNavigator.goTo(
                                        //     screen:
                                        //         () => EditTaskView(
                                        //           taskID: task.id!,
                                        //         ),
                                        //   );
                                        // }



                                        //  DeleteTaskCubit.get(context).onDeleteBtnPressed(
                                        //   task.id,);
                                        //   ScaffoldMessenger.of(context)
                                        //       .showSnackBar(
                                        //     SnackBar(
                                        //       content: Text(
                                        //        "Task deleted successfully",
                                        //       ),
                                        //     ),
                                        //   );
                                      },
                                      child: Container(
                                        height: 100,
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 8,
                                          horizontal: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color:
                                              AppColors
                                                  .containerBackgroundColor,
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.gray,
                                              blurRadius: 5,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            task.title ?? '',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          subtitle: Padding(
                                            padding: const EdgeInsets.only(
                                              top: 18,
                                            ),
                                            child: Text(task.description ?? ''),
                                          ),
                                          trailing: Column(
                                            children: [
                                              Text(
                                                fullDate, // "Wed, 14 May 2025"
                                                // style: TextStyle(fontSize: 20),
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                time, // "03:34:24"
                                                style: TextStyle(
                                                  // fontSize: 18,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                            ],
                                          ),
                                          leading:
                                              task.imagePath != null
                                                  ? Image.network(
                                                    task.imagePath!,
                                                    width: 50,
                                                    height: 50,
                                                  )
                                                  : null,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          } else {
                            return Center(
                              child: Text(
                                TranslationKeys.noTaskMsgTitle.tr,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.black,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    // custom group task
                  ],
                ),
              ),
            ),
          ),
    );
  }
}


// customGroupTask(
                    //   number: 5,
                    //   title: TranslationKeys.personalTaskTitle.tr,
                    //   iconPath: AppAssets.personalGreenIcon,
                    //   textNumberColor: AppColors.primary,
                    //   leadingIconBGC: AppColors.lightGreen,
                    //   traillingIconBGC: AppColors.containerBackgroundColor,
                    // ),
                    // customGroupTask(
                    //   number: 3,
                    //   title: TranslationKeys.homeTaskTitle.tr,
                    //   iconPath: AppAssets.homePinkIcon,
                    //   textNumberColor: AppColors.pink,
                    //   leadingIconBGC: AppColors.lightPink,
                    //   traillingIconBGC: AppColors.lightPink,
                    // ),
                    // customGroupTask(
                    //   number: 1,
                    //   title: TranslationKeys.workTaskTitle.tr,
                    //   iconPath: AppAssets.workShopIcon,
                    //   textNumberColor: AppColors.white,
                    //   leadingIconBGC: AppColors.black,
                    //   traillingIconBGC: AppColors.black,
                    // ),



                    // Flexible(
                    //   child: SingleChildScrollView(
                    //     scrollDirection: Axis.horizontal,
                    //     child: Row(
                    //       children: [
                    //         customCategoryContainer(
                    //           title: TranslationKeys.workTaskTitle.tr,
                    //           subTitle: TranslationKeys.workTaskSubTitle.tr,

                    //           containerBGC: AppColors.black,
                    //           iconBGC: AppColors.primary,
                    //           titleBGC: AppColors.white,
                    //           subTitleBGC: AppColors.white,
                    //           iconPath: AppAssets.workShopIcon,
                    //           width: 40,
                    //           height: 40,
                    //         ),
                    //         customCategoryContainer(
                    //           title: TranslationKeys.personalTaskTitle.tr,
                    //           subTitle: TranslationKeys.personalTaskSubTitle.tr,

                    //           containerBGC: AppColors.lightGreen,
                    //           iconBGC: AppColors.primary,
                    //           titleBGC: AppColors.gray,
                    //           subTitleBGC: AppColors.black,
                    //           iconPath: AppAssets.personalGrayIcon,
                    //         ),
                    //         customCategoryContainer(
                    //           title: TranslationKeys.homeTaskTitle.tr,
                    //           subTitle: TranslationKeys.workTaskSubTitle.tr,

                    //           containerBGC: AppColors.lightPink,
                    //           iconBGC: AppColors.pink,
                    //           titleBGC: AppColors.gray,
                    //           subTitleBGC: AppColors.black,
                    //           iconPath: AppAssets.homeIcon,
                    //           fontWeight: FontWeight.w500,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),



                                        // Align(
                    //   alignment: AlignmentDirectional.centerStart,
                    //   child: Padding(
                    //     padding: const EdgeInsetsDirectional.only(
                    //       start: 10,
                    //       end: 235,
                    //     ),
                    //     child: Row(
                    //       children: [
                    //         Text(
                    //           TranslationKeys.inProgressTitle.tr,
                    //           style: TextStyle(
                    //             fontSize: 18,
                    //             fontWeight: FontWeight.w300,
                    //             color: AppColors.black,
                    //           ),
                    //         ),
                    //         SizedBox(width: 10),
                    //         Container(
                    //           // alignment: Alignment.center,
                    //           width: 20,
                    //           height: 20,
                    //           decoration: BoxDecoration(
                    //             color: AppColors.containerBackgroundColor,
                    //             borderRadius: BorderRadius.circular(10),
                    //             // shape: BoxShape.circle,
                    //           ),

                    //           child: Text(
                    //             textAlign: TextAlign.center,
                    //             "5",
                    //             style: TextStyle(
                    //               fontSize: 14,
                    //               fontWeight: FontWeight.w300,
                    //               color: AppColors.primary,
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),