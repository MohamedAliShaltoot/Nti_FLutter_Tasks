// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:nti_flutter_tasks/core/cache/cache_helper.dart';
import 'package:nti_flutter_tasks/core/cache/cache_keys.dart';
import 'package:nti_flutter_tasks/core/helper/my_navigator.dart';
import 'package:nti_flutter_tasks/core/network/api_response.dart';
import 'package:nti_flutter_tasks/features/auth/view/login_view.dart';

import '../cache/cache_data.dart';
import 'end_points.dart';

// class ApiHelper {
//   // singleton
//   static final ApiHelper _instance = ApiHelper._init();
//   factory ApiHelper() => _instance;

//   ApiHelper._init();

//   Dio dio = Dio(
//     BaseOptions(
//       baseUrl: EndPoints.baseUrl,
//       connectTimeout: Duration(seconds: 10),
//       receiveTimeout: Duration(seconds: 10),
//     ),
//   );

//   Future<Response> postRequest({
//     required String endPoint,
//     Map<String, dynamic>? data,
//     bool isFormData = true,
//     bool isProtected = false,
//   }) async {
//     return await dio.post(
//       endPoint,
//       data: isFormData ? FormData.fromMap(data ?? {}) : data,
//       options: Options(
//         headers: {
//           if (isProtected) 'Authorization': 'Bearer ${CacheData.accessToken}',
//         },
//       ),
//     );
//   }

//   Future<Response> getRequest({
//     required String endPoint,
//     Map<String, dynamic>? data,
//     bool isFormData = true,
//     bool isProtected = false,
//   }) async {
//     return await dio.get(
//       endPoint,
//       data: isFormData ? FormData.fromMap(data ?? {}) : data,
//       options: Options(
//         headers: {
//           if (isProtected) 'Authorization': 'Bearer ${CacheData.accessToken}',
//         },
//       ),
//     );
//   }

//   Future<Response> putRequest({
//     required String endPoint,
//     Map<String, dynamic>? data,
//     bool isFormData = true,
//     bool isProtected = false,
//   }) async {
//     return await dio.put(
//       endPoint,
//       data: isFormData ? FormData.fromMap(data ?? {}) : data,
//       options: Options(
//         headers: {
//           if (isProtected) 'Authorization': 'Bearer ${CacheData.accessToken}',
//         },
//       ),
//     );
//   }

//   Future<Response> deleteRequest({
//     required String endPoint,
//     Map<String, dynamic>? data,
//     bool isFormData = true,
//     bool isProtected = false,
//   }) async {
//     return await dio.delete(
//       endPoint,
//       data: isFormData ? FormData.fromMap(data ?? {}) : data,
//       options: Options(
//         headers: {
//           if (isProtected) 'Authorization': 'Bearer ${CacheData.accessToken}',
//         },
//       ),
//     );
//   }
// }



class ApiHelper {
  // singleton
  static final ApiHelper _instance = ApiHelper._init();
  factory ApiHelper() {
    _instance.initDio();
    return _instance;
  }

  ApiHelper._init();
  Dio dio = Dio(
    BaseOptions(
      baseUrl: EndPoints.baseUrl,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );
  void initDio() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print("--- Headers : ${options.headers.toString()}");
          print("--- endpoint : ${options.path.toString()}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print("--- Response : ${response.data.toString()}");
          return handler.next(response);
        },
        onError: (DioException error, handler) async {
          print("--- Error : ${error.response?.data.toString()}");
          //ApiResponse apiResponse = ApiResponse.fromError(error);
          if (error.response?.data['message'].contains('expired')) {
            // refresh token
            try {
              ApiResponse apiResponse = await _instance.postRequest(
                endPoint: EndPoints.refreshToken,
                sendRefreshToken: true,
                isProtected: true,
              );
              if (apiResponse.status) {
                // must update token
                CacheData.accessToken = apiResponse.data['access_token'];
                await CacheHelper.saveData(
                  key: CacheKeys.accessToken,
                  value: CacheData.accessToken,
                );

                // Retry original request
                final options = error.requestOptions;
                if (options.data is FormData) {
                  final oldFormData = options.data as FormData;

                  // Convert FormData to map so it can be rebuilt
                  final Map<String, dynamic> formMap = {};
                  for (var entry in oldFormData.fields) {
                    formMap[entry.key] = entry.value;
                  }

                  // Add files if any
                  for (var file in oldFormData.files) {
                    formMap[file.key] = file.value;
                  }

                  // Rebuild new FormData
                  options.data = FormData.fromMap(formMap);
                }
                options.headers['Authorization'] =
                    'Bearer ${CacheData.accessToken}';
                final response = await dio.fetch(options);
                return handler.resolve(response);
              } else {
                // must logout
                CacheHelper.removeData(key: CacheKeys.accessToken);
                CacheHelper.removeData(key: CacheKeys.refreshToken);
                MyNavigator.goTo(screen: () => LoginScreen(), isReplace: true);
                return handler.next(error);
              }
            } catch (e) {
              CacheHelper.removeData(key: CacheKeys.accessToken);
              CacheHelper.removeData(key: CacheKeys.refreshToken);
              MyNavigator.goTo(screen: () => LoginScreen(), isReplace: true);
              return handler.next(error);
            }
          }

          return handler.next(error);
        },
      ),
    );
  }

  Future<ApiResponse> postRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    bool isFormData = true,
    bool isProtected = false,
    bool sendRefreshToken = false,
  }) async {
    return ApiResponse.fromResponse(
      await dio.post(
        endPoint,
        data: isFormData ? FormData.fromMap(data ?? {}) : data,
        options: Options(
          headers: {
            if (isProtected)
              'Authorization':
                  'Bearer ${sendRefreshToken ? CacheHelper.getData(key: CacheKeys.refreshToken) : CacheData.accessToken}',
          },
        ),
      ),
    );
  }

  Future<ApiResponse> getRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    bool isFormData = true,
    bool isProtected = false,
  }) async {
    return ApiResponse.fromResponse(
      await dio.get(
        endPoint,
        data: isFormData ? FormData.fromMap(data ?? {}) : data,
        options: Options(
          headers: {
            if (isProtected) 'Authorization': 'Bearer ${CacheHelper.getData(key: CacheKeys.accessToken) ?? CacheData.accessToken}',
          },
        ),
      ),
    );
  }
    Future<Response> putRequest({
      required String endPoint,
      Map<String, dynamic>? data,
      bool isFormData = true,
      bool isProtected = false,
    }) async {
      return await dio.put(
        endPoint,
        data: isFormData ? FormData.fromMap(data ?? {}) : data,
        options: Options(
          headers: {
            if (isProtected) 'Authorization': 'Bearer ${CacheHelper.getData(key: CacheKeys.accessToken) ?? CacheData.accessToken}',
          },
        ),
      );
    }

    Future<Response> deleteRequest({
      required String endPoint,
      Map<String, dynamic>? data,
      bool isFormData = true,
      bool isProtected = false,
    }) async {
      return await dio.delete(
        endPoint,
        data: isFormData ? FormData.fromMap(data ?? {}) : data,
        options: Options(
          headers: {
            if (isProtected) 'Authorization': 'Bearer ${CacheHelper.getData(key: CacheKeys.accessToken) ?? CacheData.accessToken}',
          },
        ),
      );
    }
}
