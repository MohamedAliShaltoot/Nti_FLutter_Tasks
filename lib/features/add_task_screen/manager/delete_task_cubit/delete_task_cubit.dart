import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_flutter_tasks/features/add_task_screen/data/repo/tasks_repo.dart';
import 'package:nti_flutter_tasks/features/add_task_screen/manager/delete_task_cubit/delete_task_state.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  DeleteTaskCubit() : super(DeleteTaskInitial());
  static DeleteTaskCubit get(context) => BlocProvider.of(context);
static late int idTask;
TasksRepo tasksRepo = TasksRepo();
onDeleteBtnPressed(int? taskId) async {
    emit(DeleteTaskLoading());
    var result = await tasksRepo.deleteTask(
      taskId: taskId!,
    );
    result.fold(
      (error) {
        emit(DeleteTaskError(error: error));
      },
      (message) {
        emit(DeleteTaskSuccess(message: message));
      },
    );
    
    //Navigator.pop(context);
  }






}