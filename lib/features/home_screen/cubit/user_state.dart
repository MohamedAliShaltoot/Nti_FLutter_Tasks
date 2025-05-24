
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
class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserSuccessState extends UserState {}

class UserErrorState extends UserState {
  final String error;
  UserErrorState(this.error);
}

class UserUpdateLoadingState extends UserState {}

class UserUpdateSuccessState extends UserState {
  final String message;
  UserUpdateSuccessState(this.message);
}

class UserUpdateErrorState extends UserState {
  final String error;
  UserUpdateErrorState(this.error);
}

class UserImageLoadingState extends UserState {}

class UserImageSuccessState extends UserState {
  final String imagePath;
  UserImageSuccessState(this.imagePath);
}

class UserImageErrorState extends UserState {
  final String error;
  UserImageErrorState(this.error);
}



class UserLanguageState extends UserState {
  UserLanguageState();
}

class UserDeleteLoadingState extends UserState {}

class UserDeleteSuccessState extends UserState {
  final String message;
  UserDeleteSuccessState(this.message);
}

class UserDeleteErrorState extends UserState {
  final String error;
  UserDeleteErrorState(this.error);
}

class UserLogoutState extends UserState {
  final String message;
  UserLogoutState(this.message);
}
