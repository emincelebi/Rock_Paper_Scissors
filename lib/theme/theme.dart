import 'package:flutter/material.dart';

class ThemeDark {
  var theme = ThemeData(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: Colors.transparent,
    ),
    textTheme: const TextTheme(
      labelLarge: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),
      labelSmall: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.black,
      foregroundColor: Colors.grey[400],
    ),
  );
}
