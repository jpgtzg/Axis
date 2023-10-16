/// Written by Juan Pablo Gutierrez
/// 02 10 2023

import 'package:axis/system/axis/realm/realm_manager.dart';
import 'package:axis/system/tba/event/event.dart';
import 'package:axis/system/tba/team/team.dart';
import 'package:axis/widgets/graph/line_graph.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class MatchDashboardScreen extends StatelessWidget {
  final Event event;
  final Team team;
  const MatchDashboardScreen(
      {required this.event, required this.team, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getMatchData(team, event),
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
        return PresetLineChart();
        //return Text(data.first.answers.toString());
      },
    );
  }
}
