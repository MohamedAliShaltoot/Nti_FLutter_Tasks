


import 'package:dio/dio.dart';

import 'end_points.dart';

class ApiHelper
{
  // singleton
  static final ApiHelper _instance = ApiHelper._init();
  factory ApiHelper() => _instance;

  ApiHelper._init();

  Dio dio = Dio(
    BaseOptions(
      baseUrl: EndPoints.baseUrl,
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5),
    )
  );

  Future<dynamic> postRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    bool isFormData = true
}) async => await dio.post(
      endPoint,
      data: isFormData? FormData.fromMap(data??{}): data,
    );





   

}