import 'package:flutter/material.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    splashColor: AppColors.white,
    disabledColor: AppColors.grey1,
  );
}
