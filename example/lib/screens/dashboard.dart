import 'package:example/screens/screen_one.dart';
import 'package:example/screens/screen_two.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [ScreenOne(), ScreenTwo()];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _screens[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Random icon
            label: 'Screen 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star), // Random icon
            label: 'Screen 2',
          ),
        ],
      ),
    );
  }
}
