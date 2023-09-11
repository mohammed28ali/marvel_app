import 'package:flutter/material.dart';

class CustomSizedBoxHeight extends StatelessWidget {
  final double height;
  const CustomSizedBoxHeight({Key? key, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
