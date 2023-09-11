import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_colors.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_font.dart';

class CustomRichText extends StatelessWidget {
  final String mainText;
  final String highlightText;
  final Widget nextWidget;
  final double? fontSize;
  final Color? colorMainText;
  final Color? colorHighlightText;
  final TextDecoration? highlightTextDecoration;

  const CustomRichText({
    super.key,
    required this.mainText,
    required this.highlightText,
    required this.nextWidget,
    this.fontSize,
    this.colorMainText,
    this.colorHighlightText,
    this.highlightTextDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: mainText,
        style: GoogleFonts.workSans(
          fontSize: fontSize ?? AppFontSize.s16,
          fontWeight: AppFontWeight.regular,
          color: colorMainText ?? AppColors.black,
        ),
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Future.delayed(Duration.zero, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => nextWidget),
                  );
                });
              },
            text: highlightText,
            style: GoogleFonts.workSans(
              fontSize: fontSize ?? AppFontSize.s16,
              fontWeight: AppFontWeight.bold,
              color: colorHighlightText ?? AppColors.primaryColor,
              decoration: highlightTextDecoration,
            ),
          ),
        ],
      ),
    );
  }
}
