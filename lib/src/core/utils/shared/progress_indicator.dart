import 'package:flutter/material.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_colors.dart';

void progressIndicator(BuildContext context) {
  AlertDialog alertDialog = const AlertDialog(
    backgroundColor: AppColors.transparent,
    elevation:0.0,
    content: Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
      ),
    ),
  );
  showDialog(
    barrierColor: ColorsWithOpacity.whiteOfZero,
    barrierDismissible: false,
    context: context,
    builder: (context) => alertDialog,
  );
}
