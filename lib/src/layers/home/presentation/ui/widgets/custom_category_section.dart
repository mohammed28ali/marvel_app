import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_colors.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_font.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_strings.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_values.dart';
import 'package:marvel_app/src/layers/home/presentation/ui/widgets/custom_headline_text.dart';

class CustomCategorySection extends StatelessWidget {
  final String nameOfCategory;
  final VoidCallback pressSeeMore;
  final Widget widgetOfCategory;

  const CustomCategorySection({
    Key? key,
    required this.nameOfCategory,
    required this.pressSeeMore,
    required this.widgetOfCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: AppEdgeInsetsMargins.customCategoryMargin,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomHeadLineText(headLine: nameOfCategory),
              GestureDetector(
                onTap: pressSeeMore,
                child: Container(
                  width: AppSize.s60,
                  height: AppSize.s30,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.grey3,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(AppSize.s14),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.seeMore,
                      style: GoogleFonts.mulish(
                        fontSize: AppFontSize.s10,
                        fontWeight: AppFontWeight.regular,
                        color: AppColors.grey2,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        widgetOfCategory,
      ],
    );
  }
}
