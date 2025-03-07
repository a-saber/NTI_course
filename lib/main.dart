import 'package:flutter/material.dart';
import 'package:nti_course/features/auth/views/register_view.dart';

import 'core/utils/app_text_styles.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: AppTextStyles.s25W500CBlack(),
        ),
        fontFamily: 'Nunito',
      ),
      home: RegisterView()
    );
  }
}
