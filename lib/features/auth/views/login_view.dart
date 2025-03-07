import 'package:flutter/material.dart';
import 'package:nti_course/core/localization/app_strings.dart';
import 'package:nti_course/core/utils/app_paddings.dart';
import 'package:nti_course/core/utils/app_sizes.dart';
import 'package:nti_course/core/widgets/default_btn.dart';

import 'widgets/default_auth_from_field.dart';

class LoginView extends StatelessWidget {
   LoginView({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.login),
        centerTitle: true,
      ),
      body: Padding(
        padding: AppPaddings.pagePadding,
        child: Column(
          children:
          [
            SizedBox(height: AppSizes.spaceAboveForm,),
            DefaultAuthFormField(
              controller: emailController,
            ),
            DefaultAuthFormField(
              controller: passwordController,
            ),

            SizedBox(
              width: double.infinity,
              child: DefaultBtn(
                text: AppStrings.register.toUpperCase(),
                onPressed: (){},
              ),
            )
          ],
        ),
      ),
    );
  }
}
