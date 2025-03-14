import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nti_course/features/auth/data/models/user_model.dart';

class AuthRepo
{

  AuthRepo._internal(); // private constructor
  static final AuthRepo _instance = AuthRepo._internal();
  factory AuthRepo() => _instance;

  Future<Either<String, void>> register({required String username, required String password}) async
  {
    try
    {
      Dio dio = Dio();
      var response  = await dio.post(
        'https://nti-production.up.railway.app/api/register',
        data: FormData.fromMap({
          'username': username,
          'password': password
        })
     //  options: Options(headers: {'Authorization':"Bearer ${AccessToken}"})
      );
      print("success");
      print(response.data.toString());

      return Right(null);
    } on DioException catch(e)
    {
      if(e.response == null)
      {
        return Left(e.toString());
      }
      else
      {
        return Left(e.response!.data['message']);
      }
    }
  }

  Either<String, UserModel> login({required String email, required String password})
  {
    try
    {

      return Right(UserModel(email: 'email', password: 'password',  name: 'name'));
    }
    catch(e)
    {
      return Left(e.toString());
    }
  }

}