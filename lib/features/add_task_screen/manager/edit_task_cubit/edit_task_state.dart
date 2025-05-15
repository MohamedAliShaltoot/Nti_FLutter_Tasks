abstract class EditTaskState {}

class EditTaskInitialState extends EditTaskState {}

class EditTaskLoadingState extends EditTaskState {}

class EditTaskSuccessState extends EditTaskState {
   String message;

  EditTaskSuccessState( {required  this.message});
}

class EditTaskErrorState extends EditTaskState {
  final String error;

  EditTaskErrorState({required this.error});
}
