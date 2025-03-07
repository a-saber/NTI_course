import 'package:flutter/material.dart';
import 'package:nti_course/core/utils/app_borders.dart';
import 'package:nti_course/core/utils/app_colors.dart';

class DefaultBtn extends StatelessWidget {
  const DefaultBtn({super.key, required this.text, required this.onPressed});

  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: AppBorders.formFieldBorderRadius
        )
      ),
        onPressed: onPressed,
        child: Text(text
      )
    );
  }
}
