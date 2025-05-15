
import 'package:nti_flutter_tasks/features/add_task_screen/data/models/get_task_response_model.dart';

import '../data/models/user_model.dart';

abstract class UserState {}

class UserInitial extends UserState {}
class UserError extends UserState {
  String error;
  UserError({required this.error});
}

class UserGetSuccess extends UserState {
  UserModel userModel;
  UserGetSuccess({required this.userModel});
}

class UserLoading extends UserState {}


// New states for task operations
class TasksLoading extends UserState {}

class TasksLoaded extends UserState {
  final List<TaskModel> tasks;

  TasksLoaded({required this.tasks});

  @override
  List<Object?> get props => [tasks];
}

class TasksError extends UserState {
  final String error;

  TasksError({required this.error});

  @override
  List<Object?> get props => [error];
}
