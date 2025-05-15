import 'package:nti_flutter_tasks/features/add_task_screen/data/models/get_task_response_model.dart';

abstract class AddTaskState {}

class AddTaskInitialState extends AddTaskState {}

class AddTaskChangeEndDateState extends AddTaskState {}

class AddTaskChangeGroupState extends AddTaskState {}

class AddTaskChangeImageState extends AddTaskState {}

class AddTaskLoadingState extends AddTaskState {}
class GetTasksState extends AddTaskState {
  List<TaskModel> tasks;
  GetTasksState({required this.tasks});
}

class AddTaskSuccessState extends AddTaskState {
  String message;
  AddTaskSuccessState({required this.message});
}

class AddTaskErrorState extends AddTaskState {
  String error;
  AddTaskErrorState({required this.error});
}
