/// Written by Juan Pablo Gutiérrez
/// 04 - 07 - 2023

import 'package:flutter/material.dart';

class GradientScaffold extends StatelessWidget {
  final LinearGradient gradient;
  final Widget body;

  const GradientScaffold({
    required this.gradient,
    required this.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(gradient: gradient),
          ),
          body,
        ],
      ),
    );
  }
}
