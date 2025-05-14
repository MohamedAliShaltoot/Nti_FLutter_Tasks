
// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import '../../../../core/models/default_response_model.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/network/end_points.dart';
import '../models/get_task_response_model.dart';



class TasksRepo {
  // singleton
  TasksRepo._internal();
  static final TasksRepo _repo = TasksRepo._internal();
  factory TasksRepo() => _repo;

  ApiHelper apiHelper = ApiHelper();  // class that carry the dio instance

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
      var response = await apiHelper.getRequest(
        endPoint: EndPoints.getTasks,
        isProtected: true,
      );
      // print("response ${response.data}");

      
      GetTasksResponseModel responseModel =
          GetTasksResponseModel.fromJson(response.data);

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




























}
