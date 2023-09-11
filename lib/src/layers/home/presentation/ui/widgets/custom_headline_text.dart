import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_colors.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_font.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_values.dart';


class CustomHeadLineText extends StatelessWidget {
  final String headLine;
  const CustomHeadLineText({Key? key, required this.headLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      headLine,
      style: GoogleFonts.merriweather(
        fontSize: AppSize.s18,
        fontWeight: AppFontWeight.extraBold,
        letterSpacing: 0.15,
        color: AppColors.primaryColor,
      ),
    );
  }
}
