/// Written by Juan Pablo Gutiérrez
/// 05 - 07 - 2023

import 'package:axis/screens/match_scouting/match_form_screen.dart';
import 'package:axis/screens/pit_scouting/pit_forms_screen.dart';
import 'package:axis/widgets/gradient_scaffold.dart';
import 'package:axis/widgets/match_widget.dart';
import 'package:axis/widgets/selection_button.dart';
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
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          paleteBlue.withOpacity(0.9),
          paletePurple.withOpacity(0.8),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TopBar(topText: event.name),
                const StandardSpacer(height: standartSpacerHeight),
                MatchWidget(event: event),
                const StandardSpacer(height: standartSpacerHeight),
                RankingBox(event: event),
                const StandardSpacer(height: standartSpacerHeight),
                ViewTeamsButton(event: event),
                const StandardSpacer(
                  height: standartSpacerHeight,
                ),
                SelectionButton(
                  titleText: "Match Scouting",
                  widgetScreen: MatchFormScreen(
                    event: event,
                  ),
                  primaryColor: paletePink,
                  secondaryColor: paletePurple,
                  buttonColor: Colors.lightBlue,
                ),
                const StandardSpacer(
                  height: standartSpacerHeight,
                ),
                SelectionButton(
                  titleText: "Pit Scouting",
                  widgetScreen: PitFormScreen(
                    event: event,
                  ),
                  primaryColor: paletePink,
                  secondaryColor: paletePurple,
                  buttonColor: Colors.lightBlue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
