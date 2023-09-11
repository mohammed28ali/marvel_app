import 'package:flutter/material.dart';

class CustomSizedBoxMovie extends StatelessWidget {
  final Widget child;
  const CustomSizedBoxMovie({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: child,
    );
  }
}
