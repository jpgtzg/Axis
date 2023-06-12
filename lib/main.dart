/// Written by Juan Pablo Gutiérrez
/// 23 - 05 - 2023
/// 
/// Main file

import 'package:axis/screens/homepage.dart';
import 'package:axis/widget/bottom_bar_interface.dart';
import 'package:flutter/material.dart';
void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Axis Scouting',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
