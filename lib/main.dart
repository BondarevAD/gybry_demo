import 'package:flutter/material.dart';
import 'package:gybry_demo/presentation/pages/sign_up/sign_up_page.dart';
import 'package:gybry_demo/presentation/themes/themes.dart';
import 'package:gybry_demo/presentation/utils/app_colors.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: const SignUpPage(), backgroundColor: white),
      theme: lightTheme,
    );
  }
}
