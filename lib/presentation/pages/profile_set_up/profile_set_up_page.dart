import 'package:flutter/material.dart';
import 'package:gybry_demo/presentation/pages/profile_set_up/widgets/profile_set_up_page_body.dart';

class ProfileSetUpPage extends StatelessWidget {
  const ProfileSetUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: BackButton(
      //     onPressed: () => Navigator.pop(context),
      //     color: darkPurple,
      //   ),
      //   backgroundColor: Colors.transparent,
      // ),
      body: const ProfileSetUpPageBody(),
    );
  }
}
