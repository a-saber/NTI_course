import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_course/core/localization/app_strings.dart';
import 'package:nti_course/core/utils/app_paddings.dart';
import 'package:nti_course/core/utils/app_sizes.dart';
import 'package:nti_course/core/widgets/default_btn.dart';
import 'package:nti_course/features/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:nti_course/features/auth/manager/auth_cubit/auth_state.dart';

import 'widgets/default_auth_from_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => AuthCubit(),
  child: Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.login),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) {
          return Padding(
            padding: AppPaddings.pagePadding,
            child: Column(
              children: [
                SizedBox(
                  height: AppSizes.spaceAboveForm,
                ),
                DefaultAuthFormField(
                  label: AppStrings.email,
                  controller: AuthCubit.get(context).loginEmailController,
                ),
                DefaultAuthFormField(
                  label: AppStrings.password,
                  controller: AuthCubit.get(context).loginPasswordController,
                ),
                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthLoginSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Success Login'),
                      ));
                    } else if (state is AuthLoginError) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.error),
                      ));
                    }
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: DefaultBtn(
                      text: AppStrings.login.toUpperCase(),
                      onPressed: AuthCubit.get(context).onLoginPressed,
                    ),
                  ),
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
