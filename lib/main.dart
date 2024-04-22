import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/theme/theme.dart';
import 'package:rock_paper_scissors/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeDark().theme,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
