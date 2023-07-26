/// Written by Juan Pablo Gutiérrez
/// 24 - 07 - 2023

import 'package:axis/widgets/copr/copr_chart.dart';
import 'package:axis/widgets/gradient_scaffold.dart';
import 'package:axis/widgets/top_bar.dart';
import 'package:axis/widgets/winrate_text.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../system/tba/event/event.dart';
import '../system/tba/team/team.dart';
import '../widgets/standart_spacer.dart';

class TeamScreen extends StatelessWidget {
  final Team team;
  final Event event;
  const TeamScreen({required this.team, required this.event, super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      gradient: const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          paletePink,
          paleteDarkColar,
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBar(topText: team.teamNumber),
              const StandardSpacer(height: smallerSpacerHeight),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        team.teamName,
                        style: defaultStyle,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                    WinrateText(
                        teamNumber: team.teamNumber, eventKey: event.eventKey)
                  ],
                ),
              ),
              COPRRadarChart(
                team: team,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
