import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    backgroundColor: Colors.white,
    elevation: 0.0,
  ),
  textTheme: const TextTheme(
    headline4: TextStyle(
      fontWeight: FontWeight.bold,
    ),
  ),
);