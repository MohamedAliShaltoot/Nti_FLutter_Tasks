import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nti_flutter_tasks/core/cache/cache_helper.dart';
import 'package:nti_flutter_tasks/core/cache/cache_keys.dart';
import 'package:nti_flutter_tasks/core/helper/my_navigator.dart';
import 'package:nti_flutter_tasks/core/widgets/custom_circular_progress.dart';
import 'package:nti_flutter_tasks/core/widgets/custom_svg_picture.dart';
import 'package:nti_flutter_tasks/features/home_screen/view/home_tasks_view.dart';

import '../../../core/helper/my_responsive.dart';
import '../../../core/helper/my_validator.dart';
import '../../../core/translation/translation_keys.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_filled_btn.dart';
import '../../../core/widgets/custom_form_field.dart';
import '../data/models/category_model.dart';
import '../manager/add_task_cubit/add_task_cubit.dart';
import '../manager/add_task_cubit/add_task_state.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isAr = CacheHelper.getData(key: CacheKeys.langKey) == CacheKeys.keyAR;
    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: TranslationKeys.addTaskTitle.tr,
          leading: IconButton(
            color: AppColors.black,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: isAr
                        ? CustomSvg(path: AppAssets.rightIcon)
                        : CustomSvg(path: AppAssets.leftIcon),
          ),
        ),
        body: BlocConsumer<AddTaskCubit, AddTaskState>(
          listener: (context, state) {
            if (state is AddTaskSuccessState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
              MyNavigator.goTo(
                screen: HomeTaskContentScreen(),
                isReplace: true,
              );
              // Navigator.pop(context);
              // AddTaskCubit.get(context).getTasks();
            } else if (state is AddTaskErrorState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(17.0),
              child: Form(
                key: AddTaskCubit.get(context).formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),

                        child: InkWell(
                          onTap: () {
                            AddTaskCubit.get(context).pickImage();
                          },
                          child: SizedBox(
                            width: double.infinity,
                            height: MyResponsive.height(context, value: 207),
                            child:
                                // state is AddTaskChangeImageState?
                                AddTaskCubit.get(context).image != null
                                    ? Image.file(
                                      File(
                                        AddTaskCubit.get(context).image!.path,
                                      ),
                                      fit: BoxFit.cover,
                                    )
                                    : Image.asset(
                                      AppAssets.myProfileImage,
                                      fit: BoxFit.cover,
                                    ),
                          ),
                        ),
                      ),
                    ),
                    CustomFormField(
                      label: TranslationKeys.title.tr,
                      validator: RequiredValidator(),
                      controller: AddTaskCubit.get(context).titleController,
                    ),
                    SizedBox(height: 20),
                    CustomFormField(
                      label: TranslationKeys.description.tr,
                      validator: RequiredValidator(),
                      controller:
                          AddTaskCubit.get(context).descriptionController,
                    ),
                    SizedBox(height: 20),
                    DropdownButtonFormField<CategoryModel>(
                      validator: (value) {
                        if (value == null) {
                          return 'Please select';
                        }
                        return null;
                      },
                      items:
                          AddTaskCubit.get(context).categories
                              .map(
                                (category) => DropdownMenuItem(
                                  value: category,
                                  child: Row(
                                    children: [
                                      category.icon,
                                      SizedBox(width: 10),
                                      Text(category.title),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          AddTaskCubit.get(context).changeGroup(value);
                        }
                      },
                    ),

                    SizedBox(height: 20),
                    state is AddTaskLoadingState
                        ? Center(child: CustomCircularProgressIndicator())
                        : CustomFilledBtn(
                          onPressed: () {
                            AddTaskCubit.get(context).onAddTaskPressed();
                            AddTaskCubit.get(context).getTasks();
                          },
                          text: TranslationKeys.addTaskTitle.tr,
                        ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
