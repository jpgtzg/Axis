/// Written by Juan Pablo Gutierrez
/// 02 10 2023

import 'package:axis/system/axis/realm/realm_manager.dart';
import 'package:axis/system/axis/realm/realm_models.dart';
import 'package:axis/system/tba/event/event.dart';
import 'package:axis/system/tba/team/team.dart';
import 'package:axis/widgets/graph/line_graph.dart';
import 'package:axis/widgets/standart_spacer.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class MatchDashboardScreen extends StatefulWidget {
  final Event event;
  final Team team;
  const MatchDashboardScreen(
      {required this.event, required this.team, super.key});

  @override
  State<MatchDashboardScreen> createState() => _MatchDashboardScreenState();
}

class _MatchDashboardScreenState extends State<MatchDashboardScreen> {
  late Future<MatchDashboardSchema?>? dashboardDataFuture;
  late Future<List<MatchDataSchema>> matchDataFuture;

  @override
  void initState() {
    super.initState();
    dashboardDataFuture = getMatchDashboardSettings();
    dashboardDataFuture!.then((dashboardData) {
      if (dashboardData != null) {
        matchDataFuture = getMatchData(widget.team, widget.event);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: dashboardDataFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        final dashboardData = snapshot.data;

        if (dashboardData == null) {
          return const Center(
            child: Text(
              "No data available",
              style: smallerDefaultStyle,
              textAlign: TextAlign.center,
            ),
          );
        }

        return FutureBuilder(
          future: matchDataFuture,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            final matchData = snapshot.data;

            if (matchData == null) {
              return const Center(
                child: Text(
                  "No data available",
                  style: smallerDefaultStyle,
                  textAlign: TextAlign.center,
                ),
              );
            }

            return SizedBox(
              height: 600,
              child: ListView.builder(
                itemCount: dashboardData.widgetNumber,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      PresetLineChart(
                        matchData: matchData,
                        tableData:
                            dashboardData.dashboardWidgets[index].lineTableData!,
                        title: dashboardData.dashboardWidgets[index].title,
                      ),
                      const StandardSpacer(height: standartSpacerHeight)
                    ],
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
