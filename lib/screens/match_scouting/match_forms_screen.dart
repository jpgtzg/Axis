/// Written by Juan Pablo Gutiérrez
/// 8 - 08 - 2023

import 'package:axis/widgets/gradient_scaffold.dart';
import 'package:axis/widgets/top_bar.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class MatchFormScreen extends StatelessWidget {
  const MatchFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const GradientScaffold(
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          paleteBlue,
          paleteLightBlue,
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            children: [
              TopBar(topText: "Match Scouting"),
            ],
          ),
        ),
      ),
    );
  }
}
