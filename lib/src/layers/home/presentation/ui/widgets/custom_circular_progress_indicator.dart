import 'package:flutter/material.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_colors.dart';


class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: AppColors.primaryColor),
    );
  }
}
