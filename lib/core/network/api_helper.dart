import 'package:dio/dio.dart';
import 'package:nti_course/core/local/local_data.dart';
import 'package:nti_course/core/network/end_points.dart';

import 'api_response.dart';

class APIHelper {
  // singleton
  static final APIHelper _apiHelper = APIHelper._internal();

  factory APIHelper() {
    return _apiHelper;
  }

  APIHelper._internal();

  // declaring dio
  Dio dio = Dio(BaseOptions(
      baseUrl: EndPoints.baseUrl,
      connectTimeout: Duration(seconds: 10),
      sendTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10)));

  // get request

  Future<ApiResponse> getRequest(
      {required String endPoint,
      Map<String, dynamic>? data,
      bool isFormData = true,
      bool isAuthorized = true}) async {
    try {
      var response = await dio.get(endPoint,
          data: isFormData ? FormData.fromMap(data ?? {}) : data,
          options: Options(headers: {
            if (isAuthorized) "Authorization": "Bearer ${LocalData.accessToken}"
          }));
      return ApiResponse.fromResponse(response);
    } catch (e) {
      return ApiResponse.fromError(e);
    }
  }

  // post

  Future<ApiResponse> postRequest(
      {required String endPoint,
        Map<String, dynamic>? data,
        bool isFormData = true,
        bool isAuthorized = true}) async {
    try {
      var response = await dio.post(endPoint,
          data: isFormData ? FormData.fromMap(data ?? {}) : data,
          options: Options(headers: {
            if (isAuthorized) "Authorization": "Bearer ${LocalData.accessToken}"
          }));
      return ApiResponse.fromResponse(response);
    } catch (e) {
      return ApiResponse.fromError(e);
    }
  }
  Future<ApiResponse> putRequest(
      {required String endPoint,
        Map<String, dynamic>? data,
        bool isFormData = true,
        bool isAuthorized = true}) async {
    try {
      var response = await dio.put(endPoint,
          data: isFormData ? FormData.fromMap(data ?? {}) : data,
          options: Options(headers: {
            if (isAuthorized) "Authorization": "Bearer ${LocalData.accessToken}"
          }));
      return ApiResponse.fromResponse(response);
    } catch (e) {
      return ApiResponse.fromError(e);
    }
  }

  Future<ApiResponse> deleteRequest(
      {required String endPoint,
        Map<String, dynamic>? data,
        bool isFormData = true,
        bool isAuthorized = true}) async {
    try {
      var response = await dio.delete(endPoint,
          data: isFormData ? FormData.fromMap(data ?? {}) : data,
          options: Options(headers: {
            if (isAuthorized) "Authorization": "Bearer ${LocalData.accessToken}"
          }));
      return ApiResponse.fromResponse(response);
    } catch (e) {
      return ApiResponse.fromError(e);
    }
  }
}
