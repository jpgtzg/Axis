/// Written by Juan Pablo Gutiérrez
/// 05 - 07 - 2023

import 'package:axis/screens/robot_list_screen.dart';
import 'package:axis/widgets/back_icon.dart';
import 'package:axis/widgets/gradient_scaffold.dart';
import 'package:axis/widgets/match_widget.dart';
import 'package:axis/widgets/standart_spacer.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../system/tba/event/event.dart';
import '../widgets/ranking_points/ranking_box.dart';

class RegionalScreen extends StatelessWidget {
  final Event event;
  const RegionalScreen({required this.event, super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      gradient: const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          paleteBlue,
          paletePurple,
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BackIcon(),
                    Text(
                      event.name,
                      style: defaultStyle,
                    ),
                  ],
                ),
                const StandardSpacer(height: standartSpacerHeight),
                MatchWidget(event: event),
                const StandardSpacer(height: standartSpacerHeight),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RobotListScreen(event: event),
                    ),
                  ),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Center(
                        child: Text(
                          "View Teams",
                          style: defaultStyle,
                        ),
                      ),
                    ),
                  ),
                ),
                const StandardSpacer(height: standartSpacerHeight),
                RankingBox(event: event),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
