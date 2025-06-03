import 'package:flutter/material.dart';

class AppTheme {
  final bool isDarkmode;

  AppTheme({required this.isDarkmode});

  ThemeData getTheme() => isDarkmode ? ThemeData.dark() : ThemeData.light();
}
