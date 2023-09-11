import 'package:flutter/material.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_colors.dart';

void CustomSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: AppColors.primaryColor,
      duration: const Duration(seconds: 5),
    ),
  );
}
