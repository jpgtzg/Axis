/// Written by Juan Pablo Gutiérrez
/// 12 - 06 - 2023
///
/// This is the main page
/// 
import 'package:axis/widget/bigbutton.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 3,
          bottom: 3,
          left: 2,
          right: 2,
        ),
        child: Column(
          children: [
            BigButton(title: "Scouting", pressAction: () {}, image: null),
            BigButton(title: "Scouting", pressAction: () {}, image: null),
            BigButton(title: "Scouting", pressAction: () {}, image: null)
          ],
        ),
      ),
    );
  }
}
