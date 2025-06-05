import 'package:flutter/material.dart';
import 'package:gybry_demo/presentation/pages/login/login_page.dart';
import 'package:gybry_demo/presentation/pages/sign_up/sign_up_page.dart';
import 'package:gybry_demo/presentation/pages/splash/splash_screen.dart';
import 'package:gybry_demo/presentation/themes/themes.dart';
import 'package:gybry_demo/presentation/utils/app_colors.dart';
import 'package:gybry_telegram_web_app/telegram_web_wrapper_stub.dart';

final telegram = TelegramWebWrapperImpl();

void main() async {
  if (telegram.isSupported) {
    telegram.ready();
    print('Привет, ${telegram.userFirstName}');
  } else {
    print('Telegram Web App недоступен');
  }

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Scaffold(body: SplashScreen(), backgroundColor: white),
      theme: lightTheme,
      routes: {
        '/login': (context) => const LoginPage(),
        '/sign-up': (context) => const SignUpPage(),
      },
    );
  }
}
