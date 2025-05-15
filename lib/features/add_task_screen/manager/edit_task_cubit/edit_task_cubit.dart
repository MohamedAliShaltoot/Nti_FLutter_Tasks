import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_flutter_tasks/features/add_task_screen/data/models/get_task_response_model.dart';
import 'package:nti_flutter_tasks/features/add_task_screen/data/models/update_task_model.dart';
import 'package:nti_flutter_tasks/features/add_task_screen/data/repo/tasks_repo.dart';
import 'package:nti_flutter_tasks/features/add_task_screen/manager/delete_task_cubit/delete_task_state.dart';
import 'package:nti_flutter_tasks/features/add_task_screen/manager/edit_task_cubit/edit_task_state.dart';

class EditTaskCubit extends Cubit<EditTaskState> {
  EditTaskCubit() : super(EditTaskInitialState());

  static EditTaskCubit get(context) => BlocProvider.of(context);

 static late TextEditingController InitialTitleController;
 static late TextEditingController InitialDescriptionController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
   TextEditingController titleController = TextEditingController(
text: InitialTitleController.text,
   );
  TextEditingController descriptionController = TextEditingController(
text: InitialDescriptionController.text,
  );
  //int? taskId;
   TasksRepo tasksRepo = TasksRepo();
 static late  int id;



onUpDateBtnPressed(int? taskId) async{
 
  if (!formKey.currentState!.validate()) return;
     emit(EditTaskLoadingState());
       

    

    var result = await tasksRepo.updateTask(
      title: titleController.text,
     description: descriptionController.text,
      taskId: taskId!,
     
       
      )
    ;
    result.fold(
      (error) {
        emit(EditTaskErrorState(error: error));
      },
      (message) {
        emit(EditTaskSuccessState(message: message));

       
      },
    );
}

// Function to set task data from existing task
  // void setTaskData(TaskModel task) {
  //   titleController.text = task.title ?? '';
  //   descriptionController.text = task.description ?? '';
  //   taskId = task.id;
  // }




@override
  Future<void> close() {
    titleController.dispose();
    descriptionController.dispose();
    return super.close();
  }

}