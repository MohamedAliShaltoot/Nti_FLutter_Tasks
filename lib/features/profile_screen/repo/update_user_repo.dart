import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nti_flutter_tasks/core/models/default_response_model.dart';
import 'package:nti_flutter_tasks/core/network/api_helper.dart';
import 'package:nti_flutter_tasks/core/network/api_keys.dart';
import 'package:nti_flutter_tasks/core/network/api_response.dart';
import 'package:nti_flutter_tasks/core/network/end_points.dart';
import 'package:nti_flutter_tasks/features/home_screen/data/models/user_model.dart';

class UpdateUserProfileRepo{
  //singleton instance
  UpdateUserProfileRepo._internal();
  static final UpdateUserProfileRepo _instance = UpdateUserProfileRepo._internal();
  factory UpdateUserProfileRepo() => _instance;
  ApiHelper apiHelper = ApiHelper();

  //methods
   Future<Either<String, String>> updateUserProfile({
    required String userName,
    required XFile? image,
    
   }) async {
    try {
      Response response = await apiHelper.putRequest(
        data: {
          ApiKeys.userNameApiKey: userName,
          ApiKeys.imageApiKey:
              image == null
                  ? null
                  : await MultipartFile.fromFile(
                image.path,
                filename: image.name,
              ),
        },
        endPoint: EndPoints.updateUserProfile,
        isProtected: true,
      );

      DefaultResponseModel responseModel = DefaultResponseModel.fromJson(
        response.data,
      );
      if (responseModel.status != null &&
          responseModel.status == true) {
        // return user model
        if (responseModel.message != null) {
          return Right(responseModel.message!);
        } else {
          throw Exception("update user profile Failed\nTry Again later");
        }
      } else {
        throw Exception("update user profile Failed\nTry Again later");
      }

      //return Right(UserModel.fromJson(await CacheHelper.getData(key: CacheKeys.userKey)));
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response?.data['message'] != null) {
          return Left(e.response?.data['message']);
        }
      }

      // ignore: avoid_print
      print("Error ${e.toString()}");
      return Left(e.toString());
    }
  }

}