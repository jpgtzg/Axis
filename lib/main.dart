/// Written by Juan Pablo Gutiérrez
/// 23 - 05 - 2023
///
/// Main file

import 'package:axis/screens/home_screen.dart';
import 'package:axis/system/tba/team/team_getter.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

void main() {
  getTeamEvents();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Axis Scouting',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: paleteBlue)),
      home: const HomeScreen(),
    );
  }
}
