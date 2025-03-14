import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nti_course/core/local/local_data.dart';
import 'package:nti_course/core/network/api_helper.dart';
import 'package:nti_course/core/network/api_response.dart';
import 'package:nti_course/core/network/end_points.dart';
import 'package:nti_course/features/auth/data/models/user_model.dart';

class AuthRepo {
  AuthRepo._internal(); // private constructor
  static final AuthRepo _instance = AuthRepo._internal();

  factory AuthRepo() => _instance;

  APIHelper apiHelper = APIHelper();

  Future<Either<String, String>> register(
      {required String username, required String password}) async {
    try {
      ApiResponse apiResponse = await apiHelper.postRequest(
          endPoint: EndPoints.register,
          data: {"username": username, "password": password},
          isAuthorized: false);

      if(apiResponse.status)
      {
        return Right(apiResponse.message);
      }
      else
      {
        return Left(apiResponse.message);
      }
    } catch (e) {
      return Left(ApiResponse.fromError(e).message);
    }
  }

  Future<Either<String, UserModel>> login(
      {required String username, required String password}) async{
    try {
      ApiResponse apiResponse = await apiHelper.postRequest(
          endPoint: EndPoints.login,
          data: {"username": username, "password": password},
          isAuthorized: false
      );

      if(apiResponse.status)
      {
        LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(apiResponse.data);
        if(loginResponseModel.user == null)
        {
          return Left(apiResponse.message);
        }
        LocalData.accessToken = loginResponseModel.accessToken;
        LocalData.refreshToken = loginResponseModel.refreshToken;
        return Right(loginResponseModel.user!);
      }
      else
      {
        return Left(apiResponse.message);
      }


    } catch (e) {
      return Left(e.toString());
    }
  }
}
