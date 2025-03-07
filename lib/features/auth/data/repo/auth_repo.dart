import 'package:dartz/dartz.dart';
import 'package:nti_course/features/auth/data/models/user_model.dart';

class AuthRepo
{
  UserModel? user;

  Either<String, void> register({required UserModel user})
  {
    try
    {
      this.user = user;
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