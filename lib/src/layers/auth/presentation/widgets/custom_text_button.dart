import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_colors.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_font.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_values.dart';

class CustomTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final String textButton;
  final double? width;
  final double? height;

  const CustomTextButton({
    super.key,
    required this.textButton,
    required this.onPressed,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s12)),
        ),
        padding: const EdgeInsets.all(0),
      ),
      child: Ink(
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s12)),
        ),
        child: Container(
          width: AppSize.s335,
          height: AppSize.s50,
          alignment: Alignment.center,
          child: Text(
            textButton,
            style: GoogleFonts.workSans(
              fontSize: AppFontSize.s22,
              fontWeight: AppFontWeight.bold,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
