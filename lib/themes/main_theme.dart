import 'package:flutter/material.dart';

var defaultColor = Color(0xff414141);
var backgroundColor = Color(0xff000000);

final nicknameTheme = TextStyle(
  color: Colors.white,
  fontSize: 26,
  fontWeight: FontWeight.w900,
);
final userDetailNicknameTheme = TextStyle(
  color: Colors.white,
  fontSize: 32,
  fontWeight: FontWeight.w900,
);
final detailTextTheme = TextStyle(
  color: Colors.white,
  fontSize: 18,
  fontWeight: FontWeight.w700,
);

final theme = ThemeData(
  fontFamily: 'NanumSquare',
  appBarTheme: AppBarTheme(
    color: defaultColor,
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w900,
      ),
    ),
  ),
  backgroundColor: backgroundColor,
);
