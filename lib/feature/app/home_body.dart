import 'package:flutter/material.dart';
import 'package:online_exam/feature/app/result/presentation/pages/result_screen.dart';
import 'package:online_exam/feature/app/profile/presentation/page/edit_profile_screen.dart';

import 'explore/presentation/pages/home_screen.dart';

class HomeBody extends StatefulWidget {
  static const String routeName = 'home_body';

  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(1);

  static final List<Widget> _pages = <Widget>[
    HomeScreen(),
    ResultScreen(),
    EditProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _selectedIndex,
        builder: (context, index, child) {
          return BottomNavigationBar(
            currentIndex: index,
            onTap: (newIndex) => _selectedIndex.value = newIndex,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Explore",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.assignment), label: "Results"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile"),
            ],
          );
        },
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: _selectedIndex,
        builder: (context, index, child) {
          return _pages[index];
        },
      ),
    );
  }
}
