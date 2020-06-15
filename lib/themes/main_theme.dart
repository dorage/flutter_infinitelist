import 'package:flutter/material.dart';

var defaultColor = Color(0xff414141);
var backgroundColor = Color(0xff000000);

final theme = ThemeData(
  fontFamily: 'NanumSquare',
  appBarTheme: AppBarTheme(
    color: defaultColor,
    textTheme: TextTheme(
      headline1: TextStyle(
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    ),
  ),
  backgroundColor: backgroundColor,
);
