import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_colors.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_font.dart';

class CustomText extends StatelessWidget {
  final String title;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomText({
    Key? key,
    required this.title,
    this.fontSize = AppFontSize.s22,
    this.fontWeight = AppFontWeight.regular,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.workSans(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: AppColors.black,
      ),
    );
  }
}
