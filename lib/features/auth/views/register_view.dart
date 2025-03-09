import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_course/core/localization/app_strings.dart';
import 'package:nti_course/core/utils/app_paddings.dart';
import 'package:nti_course/core/utils/app_sizes.dart';
import 'package:nti_course/core/widgets/default_btn.dart';
import 'package:nti_course/features/auth/manager/auth_cubit/auth_state.dart';

import '../manager/auth_cubit/auth_cubit.dart';
import 'widgets/default_auth_from_field.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.register),
          centerTitle: true,
        ),
        body: Builder(
          builder: (context) {
            return Padding(
              padding: AppPaddings.pagePadding,
              child: Column(
                children:
                [
                  SizedBox(height: AppSizes.spaceAboveForm,),
                  DefaultAuthFormField(
                    label: AppStrings.name,
                    controller: AuthCubit.get(context).nameController,
                  ),
                  DefaultAuthFormField(
                    label: AppStrings.email,
                    controller: AuthCubit.get(context).emailController,
                  ),
                  DefaultAuthFormField(
                    label: AppStrings.password,
                    controller: AuthCubit.get(context).passwordController,
                  ),
                  DefaultAuthFormField(
                    label: AppStrings.passwordConfirm,
                    controller: AuthCubit.get(context).passwordConfirmController,
                  ),

                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      print(state.toString());
                      if(state is AuthRegisterSuccess)
                      {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('success'),
                          )
                        );
                      }
                      else if(state is AuthRegisterError)
                      {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.error),
                            )
                        );
                      }

                    },
                    builder: (context, state) {
                      if(state is AuthRegisterLoading)
                      {
                        return CircularProgressIndicator();
                      }
                      else
                      {
                        return SizedBox(
                          width: double.infinity,
                          child: DefaultBtn(
                            text: AppStrings.register.toUpperCase(),
                            onPressed: AuthCubit.get(context).onRegisterPressed,
                          ),
                        );
                      }

                    },
                  )

                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
