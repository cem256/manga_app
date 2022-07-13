import 'package:flutter/material.dart';

class AppTheme {
  get appTheme => ThemeData(
        colorScheme: const ColorScheme.dark(primary: Colors.white, secondary: Colors.white),
        appBarTheme: const AppBarTheme(centerTitle: true),
      );
}
