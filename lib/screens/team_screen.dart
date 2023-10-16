/// Written by Juan Pablo Gutiérrez
/// 24 - 07 - 2023

import 'package:axis/screens/match_scouting/match_dashboard_screen.dart';
import 'package:axis/screens/pit_scouting/pit_dashboard_screen.dart';
import 'package:axis/system/tba/team/team_getter.dart';
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
            children: [
              TopBar(topText: team.teamNumber),
              const StandardSpacer(height: smallerSpacerHeight),
              Flexible(
                child: FutureBuilder(
                    future: getTeamData(team, event.eventKey),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
              
                      final data = snapshot.data;
              
                      if (data == null) {
                        return const Center(
                          child: Text(
                            "No data available",
                            style: smallerDefaultStyle,
                            textAlign: TextAlign.center,
                          ),
                        );
                      }
              
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                    team: team,
                                  )
                                ],
                              ),
                            ),
                            COPRRadarChart(
                              team: team,
                              eventKey: event.eventKey,
                            ),
                            const StandardSpacer(height: standartSpacerHeight),
                            MatchDashboardScreen(team: team, event:  event,),
                            PitDashboardScreen(team: team, event:  event,)
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
