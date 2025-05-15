import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nti_flutter_tasks/features/add_task_screen/data/models/get_task_response_model.dart';
import 'package:nti_flutter_tasks/features/add_task_screen/data/repo/tasks_repo.dart';

import '../data/models/user_model.dart';
import '../data/repo/home_repo.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  // Singleton pattern to access the cubit from anywhere in the app

  // static DataType[cubit of the class tou are in it ] get(context) => BlocProvider.of(context);
  static UserCubit get(context) => BlocProvider.of(context);
  HomeRepo homeRepo = HomeRepo();
  static late String sharedImageOnAllScreens;
  UserModel? userModel;

  void getUserData({required UserModel user}) {
    emit(UserGetSuccess(userModel: user));
  }

  
  Future<bool> getUserDataFromAPI() async {
    var response = await homeRepo.getUserData();

    return response.fold(
      (error) {
        emit(UserError(error: error));
        return false;
      },
      (userModel) {
        emit(UserGetSuccess(userModel: userModel));
        this.userModel = userModel;
        return true;
      },
    );
  }

  // making updates to handel requests
}

// class UserCubit extends Cubit<UserState> {
//   UserCubit() : super(UserInitial());

//   // Singleton pattern to access the cubit from anywhere in the app
//   static UserCubit get(context) => BlocProvider.of(context);
//   HomeRepo homeRepo = HomeRepo();
// TasksRepo tasksRepo = TasksRepo();
//   // Store tasks locally in cubit to avoid redundant API calls
//   List<TaskModel>? _cachedTasks;
//   bool _isLoadingTasks = false;

//   void getUserData({required UserModel user}) {
//     emit(UserGetSuccess(userModel: user));
//   }

//   Future<bool> getUserDataFromAPI() async {
//     emit(UserLoading());
//     var response = await homeRepo.getUserData();

//     return response.fold(
//       (error) {
//         emit(UserError(error: error));
//         return false;
//       },
//       (userModel) {
//         emit(UserGetSuccess(userModel: userModel));
//         return true;
//       },
//     );
//   }

//   // New method to fetch all tasks
//   Future<List<TaskModel>?> getAllTasks({bool forceRefresh = false}) async {
//     // Prevent concurrent requests
//     if (_isLoadingTasks) {
//       // Wait for the current request to finish
//       while (_isLoadingTasks) {
//         await Future.delayed(Duration(milliseconds: 100));
//       }
//       return _cachedTasks;
//     }

//     // If we have cached tasks and not forcing refresh, return cached tasks
//     if (_cachedTasks != null && !forceRefresh) {
//       return _cachedTasks;
//     }

//     // Otherwise fetch from API
//     _isLoadingTasks = true;
//     emit(TasksLoading());

//     try {
//       var response = await tasksRepo.getTasks();

//       _isLoadingTasks = false;
//       return response.fold(
//         (error) {
//           emit(TasksError(error: error));
//           return null;
//         },
//         (tasks) {
//           _cachedTasks = tasks;
//           emit(TasksLoaded(tasks: tasks));
//           return tasks;
//         },
//       );
//     } catch (e) {
//       _isLoadingTasks = false;
//       emit(TasksError(error: e.toString()));
//       return null;
//     }
//   }

//   // Method to clear task cache when needed (e.g., after adding/deleting tasks)
//   void invalidateTaskCache() {
//     _cachedTasks = null;
//   }
// }
