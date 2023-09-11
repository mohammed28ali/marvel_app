import 'package:flutter/material.dart';

class CustomSizedBoxTvShow extends StatelessWidget {
  final Widget child;
  const CustomSizedBoxTvShow({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: child,
    );
  }
}
