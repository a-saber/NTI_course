import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_course/core/helper/my_navigator.dart';
import 'package:nti_course/features/auth/data/models/user_model.dart';
import 'package:nti_course/features/auth/data/repo/auth_repo.dart';
import 'package:nti_course/features/auth/views/login_view.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController = TextEditingController();

  AuthRepo authRepo = AuthRepo();

  void onRegisterPressed() async{
    emit(AuthRegisterLoading());

    var response = await authRepo.register(
        user: UserModel(
            name: nameController.text,
            email: emailController.text,
            password: passwordController.text
        )
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
        MyNavigator.navigateTo( screen: LoginView());
      }
    );
  }
}
