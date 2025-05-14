import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/utils/app_colors.dart';
import '../data/models/category_model.dart';
import '../data/models/get_task_response_model.dart';
import '../data/repo/tasks_repo.dart';
import 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitialState()){
    getTasks();
  }
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

 // TasksRepo tasksRepo = TasksRepo();
  void onAddTaskPressed() async {
    if (!formKey.currentState!.validate()) return;
    emit(AddTaskLoadingState());
    var result = await tasksRepo.addTask(
      task: TaskModel(
        title: titleController.text,
        description: descriptionController.text,
        image: image,
      ),
    );
    result.fold(
      (error) {
        emit(AddTaskErrorState(error: error));
      },
      (message) {
        emit(AddTaskSuccessState(message: message));

        // when add task success, get tasks
        // to update the tasks list
        // tasksRepo.getTasks().then(
        //   (value) {
        //     value.fold(
        //       (error) {
        //         emit(AddTaskErrorState(error: error));
        //       },
        //       (tasks) {
        //         emit(GetTasksState(tasks: tasks));
        //       },
        //     );
        //   },
        // );
      },
    );
  }

  // method to get tasks
  void getTasks() async {
    emit(AddTaskLoadingState());
    var result = await tasksRepo.getTasks();
    result.fold(
      (error) {
        emit(AddTaskErrorState(error: error));
      },
      (tasks) {
        emit(GetTasksState(tasks: tasks));
      },
    );
  }
    Future<void> refreshTasks() async {
    emit(AddTaskLoadingState());
    final result = await tasksRepo.getTasks();
    result.fold(
      (error) => emit(AddTaskErrorState(error:error)),
      (tasks) => emit(GetTasksState(tasks:tasks)),
    );
  }


  XFile? image;
  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);
    emit(AddTaskChangeImageState());
  }
}
