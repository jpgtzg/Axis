/// Written by Juan Pablo Gutiérrez
/// 02 - 07 - 2023

import 'package:flutter/material.dart';

import '../constants.dart';

class AxisLogo extends StatelessWidget {
  const AxisLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      color: Colors.black,
      child: Center(
        child: Text(
          "Axis",
          style: bigTextStyle,
        ),
      ),
    );
  }
}
