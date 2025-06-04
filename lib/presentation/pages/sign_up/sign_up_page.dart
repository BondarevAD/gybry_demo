import 'package:flutter/material.dart';
import 'package:gybry_demo/presentation/pages/sign_up/widgets/sign_up_page_body.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpPageBody(), // а в нём уже вся форма
    );
  }
}
