import 'package:flutter/material.dart';

void navigateAndPop(context) {
  Navigator.pop(context);
}

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => widget,
      ),
    );

void navigateAndPushNamed(context, nameWidget, Object? arguments) =>
    Navigator.pushNamed(
      context,
      nameWidget,
      arguments: arguments,
    );
