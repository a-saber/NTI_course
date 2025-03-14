import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_course/features/auth/data/models/user_model.dart';
import 'package:nti_course/features/auth/data/repo/auth_repo.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  //AuthCubit() : super(AuthInitialState());

  AuthCubit._internal() : super(AuthInitialState());
  static final AuthCubit _cubitInstance = AuthCubit._internal();
  factory AuthCubit()
  {
    return _cubitInstance;
  }

  static AuthCubit get(context) => BlocProvider.of(context);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController = TextEditingController();

  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  AuthRepo authRepo = AuthRepo();

  void onRegisterPressed() async{
    emit(AuthRegisterLoading());

    var response = await authRepo.register(
            username: nameController.text,
            password: passwordController.text

    );

    response.fold(
      // left
      (String error)
      {
        emit(AuthRegisterError(error: error));
      },
      // right
      (r)
      {
        emit(AuthRegisterSuccess());
      }
    );
  }


  void onLoginPressed()
  {
    emit(AuthLoginLoading());

    var response = authRepo.login(email: loginEmailController.text, password: loginPasswordController.text);
    response.fold(
      (String error)
      {
        emit(AuthLoginError(error: error));
      },
      (UserModel user)
      {
        emit(AuthLoginSuccess());
      }
    );
  }
}
