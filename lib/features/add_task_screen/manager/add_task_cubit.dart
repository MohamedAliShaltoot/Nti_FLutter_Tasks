import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nti_flutter_tasks/core/utils/app_colors.dart';
import 'package:nti_flutter_tasks/features/add_task_screen/data/models/category_model.dart';
import 'package:nti_flutter_tasks/features/home_screen/data/models/task_model.dart';
import 'package:nti_flutter_tasks/features/home_screen/repo/tasks_repo.dart';

import 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitialState());

  // variables and methods
  static AddTaskCubit get(context) => BlocProvider.of(context);
  TasksRepo tasksRepo = TasksRepo();

  List<CategoryModel> categories = [
    CategoryModel(
      title: 'Home',
      icon: Icon(Icons.home, color: AppColors.primary),
      bgColor: AppColors.black,
    ),
    CategoryModel(
      title: 'Personal',
      icon: Icon(Icons.person, color: AppColors.primary),
      bgColor: AppColors.black,
    ),
    CategoryModel(
      title: 'Work',
      icon: Icon(Icons.work, color: AppColors.primary),
      bgColor: AppColors.black,
    ),
  ];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime? endDate;
  CategoryModel? group;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void changeEndDate(DateTime date) {
    endDate = date;
    emit(AddTaskChangeEndDateState());
  }

  void changeGroup(CategoryModel group) {
    this.group = group;
    emit(AddTaskChangeGroupState());
  }

  void onAddTaskPressed() {
    emit(AddTaskLoadingState());
    if (!formKey.currentState!.validate()) return;
    tasksRepo.addTask(
      TaskModel(
        title: titleController.text,
        description: descriptionController.text,
        categoryModel: group!,
        endDate: endDate!,
      ),
    );
    emit(AddTaskSuccessState());
  }

  XFile? image;
  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);
    emit(AddTaskChangeImageState());
  }
}
