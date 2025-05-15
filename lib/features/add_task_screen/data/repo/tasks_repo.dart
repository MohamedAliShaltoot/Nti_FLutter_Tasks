// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:nti_flutter_tasks/core/network/api_response.dart';
import 'package:nti_flutter_tasks/features/add_task_screen/data/models/update_task_model.dart';

import '../../../../core/models/default_response_model.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/network/end_points.dart';
import '../models/get_task_response_model.dart';

class TasksRepo {
  // singleton
  TasksRepo._internal();
  static final TasksRepo _repo = TasksRepo._internal();
  factory TasksRepo() => _repo;

  ApiHelper apiHelper = ApiHelper(); // class that carry the dio instance

  // add task method
  Future<Either<String, String>> addTask({required TaskModel task}) async {
    try {
      var response = await apiHelper.postRequest(
        endPoint: EndPoints.addTask,
        isProtected: true,
        data: await task.toJson(),
      );
      DefaultResponseModel responseModel = DefaultResponseModel.fromJson(
        response.data,
      );

      if (responseModel.status != null && responseModel.status == true) {
        return Right(responseModel.message ?? "Task added successfully");
      } else {
        throw Exception("Something went wrong");
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response?.data['message'] != null) {
          return Left(e.response?.data['message']);
        }
      }

      print("Error ${e.toString()}");
      return Left(e.toString());
    }
  }

  // get tasks method
  Future<Either<String, List<TaskModel>>> getTasks() async {
    try {
      ApiResponse response = await apiHelper.getRequest(
        endPoint: EndPoints.getTasks,
        isProtected: true,
      );
      // print("response ${response.data}");

      GetTasksResponseModel responseModel = GetTasksResponseModel.fromJson(
        response.data,
      );

      if (responseModel.status != null && responseModel.status == true) {
        return Right(responseModel.tasks ?? []);
      } else {
        throw Exception("Something went wrong");
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response?.data['message'] != null) {
          return Left(e.response?.data['message']);
        }
      }

      print("Error ${e.toString()}");
      return Left(e.toString());
    }
  }

  // update task method
  // TasksRepo class update
  Future<Either<String, String>> updateTask({
    required String title,
    required String description,
    required int taskId,
  }) async {
    try {
      // Make the endpoint dynamic by appending the task ID
      var response = await apiHelper.putRequest(
        endPoint: "tasks/$taskId", // Dynamic endpoint with task ID
        isProtected: true,
        data: {"title": title, "description": description},
      );
      UpdateTaskModel responseModel = UpdateTaskModel.fromJson(response.data);
      // DefaultResponseModel responseModel = DefaultResponseModel.fromJson(
      //   response.data,
      // );

      if (responseModel.status != null && responseModel.status == true) {
        return Right(responseModel.message ?? "Task updated successfully");
      } else {
        throw Exception("Something went wrong");
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response?.data['message'] != null) {
          return Left(e.response?.data['message']);
        }
      }
      print("Error ${e.toString()}");
      return Left(e.toString());
    }
  }

  //delete task method
  Future<Either<String, String>> deleteTask({required int taskId}) async {
    try {
      var response = await apiHelper.deleteRequest(
        endPoint: "tasks/$taskId",
        isProtected: true,
       // data: {"taskId": taskId},
      );
      DefaultResponseModel responseModel = DefaultResponseModel.fromJson(
        response.data,
      );

      if (responseModel.status != null && responseModel.status == true) {
        return Right(responseModel.message ?? "Task deleted successfully");
      } else {
        throw Exception("Something went wrong");
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response?.data['message'] != null) {
          return Left(e.response?.data['message']);
        }
      }

      print("Error ${e.toString()}");
      return Left(e.toString());
    }
  }
}
