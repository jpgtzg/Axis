/// Written by Juan Pablo Gutiérrez
/// 04 10 2023

import 'package:axis/constants.dart';
import 'package:axis/screens/settings_selector_screen.dart';
import 'package:axis/widgets/logo.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AxisLogo(),
          IconButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder:(context) => const SettingsSelectorScreen(),)),
            icon: menuIcon,
          ),
        ],
      ),
    );
  }
}
