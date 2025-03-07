import 'package:flutter/material.dart';
import 'package:nti_course/core/localization/app_strings.dart';
import 'package:nti_course/core/utils/app_paddings.dart';
import 'package:nti_course/core/utils/app_sizes.dart';
import 'package:nti_course/core/widgets/default_btn.dart';

import 'widgets/default_auth_from_field.dart';

class RegisterView extends StatelessWidget {
   RegisterView({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.register),
        centerTitle: true,
      ),
      body: Padding(
        padding: AppPaddings.pagePadding,
        child: Column(
          children:
          [
            SizedBox(height: AppSizes.spaceAboveForm,),
            DefaultAuthFormField(
              controller: nameController,
            ),
            DefaultAuthFormField(
              controller: emailController,
            ),
            DefaultAuthFormField(
              controller: passwordController,
            ),
            DefaultAuthFormField(
              controller: passwordConfirmController,
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
