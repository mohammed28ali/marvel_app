import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_font.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_values.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType keyBoardType;
  final String? hintText;
  final String? labelText;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final bool readOnly;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;

  const CustomTextFormField({
    super.key,
    required this.textEditingController,
    required this.keyBoardType,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.suffix,
    this.readOnly = false,
    this.obscureText,
    this.validator,
    this.onSaved,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      
      child: TextFormField(
        controller: textEditingController,
        obscureText: obscureText ?? false,
        keyboardType: keyBoardType,
        readOnly: readOnly,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(AppSize.s12))),
            prefixIcon: prefixIcon,
            hintText: hintText,
            hintStyle: GoogleFonts.workSans(
              fontSize: AppFontSize.s22,
              fontWeight: AppFontWeight.regular,
            ),
            labelText: labelText,
            //errorText: 'Error',
            suffixIcon: suffixIcon,
            contentPadding: AppEdgeInsetsPaddings.textFormFieldPadding),
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
