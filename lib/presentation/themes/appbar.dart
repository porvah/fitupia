import 'package:flutter/material.dart';

AppBar buildAppBar(
  String title,
  Color textColor,
  Color backgroundColor, {
  bool back = false,
}) {
  return AppBar(
    backgroundColor: backgroundColor,
    leading: back
        ? BackButton(
            color: textColor,
          )
        : null,
    title: Text(
      title,
      style: TextStyle(
        color: textColor,
      ),
    ),
    foregroundColor: textColor,
  );
}
