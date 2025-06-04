import 'package:flutter/material.dart';
import 'package:gybry_demo/presentation/pages/profile/tabs/cabinet/my_cabinet_page.dart';
import 'package:gybry_demo/presentation/pages/profile/tabs/team/team_page.dart';
import 'package:gybry_demo/presentation/pages/profile/tabs/tests/tests_page.dart';

class ProfilePageBody extends StatefulWidget {
  const ProfilePageBody({super.key});

  @override
  State<ProfilePageBody> createState() => _ProfilePageBodyState();
}

class _ProfilePageBodyState extends State<ProfilePageBody> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [MyCabinetPage(), TestsPage(), TeamPage()];

  final List<String> _titles = ['Мой кабинет', 'Тесты', 'Команда'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap:
            (index) => setState(() {
              _currentIndex = index;
            }),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Кабинет'),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer),
            label: 'Тесты',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Команда'),
        ],
      ),
    );
  }
}
