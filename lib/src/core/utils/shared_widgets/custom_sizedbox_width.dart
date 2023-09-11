import 'package:flutter/material.dart';

class CustomSizedBoxWidth extends StatelessWidget {
  final double width;
  const CustomSizedBoxWidth({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
