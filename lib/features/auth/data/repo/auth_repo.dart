import 'package:dartz/dartz.dart';
import 'package:nti_course/features/auth/data/models/user_model.dart';

class AuthRepo
{

  AuthRepo._internal(); // private constructor
  static final AuthRepo _instance = AuthRepo._internal();
  factory AuthRepo() => _instance;
  UserModel? user;

  Future<Either<String, void>> register({required UserModel user}) async
  {
    try
    {
      if(user.email.isEmpty)
      {
        throw Exception('Email is empty');
      }

      if(user.password.isEmpty)
      {
        throw Exception('Password is empty');
      }
      this.user = user;
      await Future.delayed(Duration(milliseconds: 1000));
      return Right(null);
    }
    catch(e)
    {
      return Left(e.toString());
    }
  }

  Either<String, UserModel> login({required String email, required String password})
  {
    try
    {
      if(user != null)
      {
        if(user!.email == email && user!.password == password)
        {
          return Right(user!);
        }
        else
        {
          throw Exception('Wrong email or password');
        }
      }
      else
      {
        throw Exception('You should register first');
      }
    }
    catch(e)
    {
      return Left(e.toString());
    }
  }

}