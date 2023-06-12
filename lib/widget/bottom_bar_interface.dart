/// Written by Juan Pablo Gutiérrez
/// 23 - 05 - 2023
///
/// Represents the bottom bar interface on the main page

import 'package:axis/screens/statistics_screen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class BottomBarInterface extends StatefulWidget {
  const BottomBarInterface({super.key});

  @override
  State<BottomBarInterface> createState() => _BottomBarInterfaceState();
}

class _BottomBarInterfaceState extends State<BottomBarInterface> {
  int currentIndex = 0;
  final Duration durationTime = const Duration(milliseconds: 225);
  final Curve animationCurve = Curves.easeIn;

  late final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => currentIndex = index);
          },
          children: <Widget>[
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.blue,
            ),
            const StatisticScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: const Text(
              'Home',
              style: TextStyle(fontFamily: "Manrope"),
            ),
            icon: const Icon(Icons.home),
            activeColor: Colors.lightBlue,
          ),
          BottomNavyBarItem(
            title: const Text(
              'Robots',
              style: TextStyle(fontFamily: "Manrope"),
            ),
            icon: const Icon(Icons.apps),
            activeColor: Colors.lightBlue,
          ),
          BottomNavyBarItem(
            title: const Text(
              'Settings',
              style: TextStyle(fontFamily: "Manrope"),
            ),
            icon: const Icon(Icons.settings),
            activeColor: Colors.lightBlue,
          ),
        ],
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
            _pageController.animateToPage(currentIndex,
                duration: durationTime, curve: animationCurve);
          });
        },
      ),
    );
  }
}
