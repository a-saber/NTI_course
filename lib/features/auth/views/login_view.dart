import 'package:flutter/material.dart';
import 'package:nti_course/core/localization/app_strings.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.login),
      ),
    );
  }
}
