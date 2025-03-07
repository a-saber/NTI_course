import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTextStyles
{
  static TextStyle s25W500CBlack({Color color = AppColors.green}) => TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w500,
    color: color
  );
}