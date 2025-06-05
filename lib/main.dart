import 'package:flutter/material.dart';
import 'package:gybry_demo/presentation/pages/login/login_page.dart';
import 'package:gybry_demo/presentation/pages/sign_up/sign_up_page.dart';
import 'package:gybry_demo/presentation/themes/themes.dart';
import 'package:gybry_demo/presentation/utils/app_colors.dart';
import 'package:telegram_web_app/telegram_web_app.dart';

void main() async {
  try {
    if (TelegramWebApp.instance.isSupported) {
      TelegramWebApp.instance.ready();
      Future.delayed(
        const Duration(seconds: 1),
        TelegramWebApp.instance.expand,
      );
    }
  } catch (e) {
    print("Error happened in Flutter while loading Telegram $e");
    await Future.delayed(const Duration(milliseconds: 200));
    main();
    return;
  }

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: const LoginPage(), backgroundColor: white),
      theme: lightTheme,
      routes: {
        '/login': (context) => const LoginPage(),
        '/sign-up': (context) => const SignUpPage(),
      },
    );
  }
}
