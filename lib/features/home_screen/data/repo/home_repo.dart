import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:nti_flutter_tasks/core/network/api_response.dart';

import '../../../../core/network/api_helper.dart';
import '../../../../core/network/end_points.dart';
import '../models/user_model.dart';

class HomeRepo {
  //singleton
  HomeRepo._internal();
  static final HomeRepo _repo = HomeRepo._internal();
  factory HomeRepo() => _repo;
  ApiHelper apiHelper = ApiHelper();

  //methods

  Future<Either<String, UserModel>> getUserData() async{
    try {
ApiResponse response = await apiHelper.getRequest(
        endPoint: EndPoints.getUserData,
        isProtected: true,
      );

LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(
        response.data
      );
      if (loginResponseModel.status != null &&
          loginResponseModel.status == true) {
       
       
        // return user model
        if (loginResponseModel.user != null) {
          return Right(loginResponseModel.user!);
        } else {
          throw Exception("Login Failed\nTry Again later");
        }
      } else {
        throw Exception("Login Failed\nTry Again later");
      }

      //return Right(UserModel.fromJson(await CacheHelper.getData(key: CacheKeys.userKey)));
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
    Future<Either<String, String>> deleteAccount() async {
    try {
      ApiResponse apiResponse = (await apiHelper.deleteRequest(
        endPoint: EndPoints.deleteUser,
        isProtected: true,
      )) as ApiResponse;
      if (apiResponse.status) {
        return Right(apiResponse.message);
      } else {
        throw Exception(apiResponse.message);
      }
    } catch (e) {
      ApiResponse apiResponse = ApiResponse.fromError(e);
      return Left(apiResponse.message);
    }
  }
}
