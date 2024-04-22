import 'package:flutter/material.dart';

class ThemeDark {
  var theme = ThemeData(
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
        )),
  );
}
