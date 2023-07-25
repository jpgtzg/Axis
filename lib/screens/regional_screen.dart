/// Written by Juan Pablo Gutiérrez
/// 05 - 07 - 2023

import 'package:axis/widgets/back_icon.dart';
import 'package:axis/widgets/gradient_scaffold.dart';
import 'package:axis/widgets/match_widget.dart';
import 'package:axis/widgets/standart_spacer.dart';
import 'package:axis/widgets/top_bar.dart';
import 'package:axis/widgets/view_teams_button.dart';
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
                TopBar(event: event),
                const StandardSpacer(height: standartSpacerHeight),
                MatchWidget(event: event),
                const StandardSpacer(height: standartSpacerHeight),
                RankingBox(event: event),
                const StandardSpacer(height: standartSpacerHeight),
                ViewTeamsButton(event: event),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
