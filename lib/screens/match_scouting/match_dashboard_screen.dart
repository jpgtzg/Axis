/// Written by Juan Pablo Gutierrez
/// 02 10 2023

import 'package:axis/system/axis/realm/realm_manager.dart';
import 'package:axis/system/axis/realm/realm_models.dart';
import 'package:axis/system/tba/event/event.dart';
import 'package:axis/system/tba/team/team.dart';
import 'package:axis/widgets/graph/line_graph.dart';
import 'package:axis/widgets/graph/pie_graph.dart';
import 'package:axis/widgets/standart_spacer.dart';
import 'package:axis/widgets/text_box.dart';
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
  late Future<MatchFormSettingsSchema?>? matchFormSettingsFuture;

  @override
  void initState() {
    super.initState();
    dashboardDataFuture = getMatchDashboardSettings();
    matchFormSettingsFuture = getMatchFormSettings();
    dashboardDataFuture!.then((dashboardData) {
      if (dashboardData != null) {
        matchDataFuture = getMatchData(widget.team, widget.event);
      }
    });
  }

  Widget getWidget(
      String type, List data, MatchDashboardSchema dashboardData, int index) {
    switch (type) {
      case "line":
        return PresetLineChart(
          data: data,
          tableData: dashboardData.dashboardWidgets[index].lineTableData!,
          title: dashboardData.dashboardWidgets[index].title,
          formsFuture: matchFormSettingsFuture,
        );
      case "text":
        return TextBox(
            data: data,
            textWidgetData: dashboardData.dashboardWidgets[index].textData!,
            title: dashboardData.dashboardWidgets[index].title,
            formsFuture: matchFormSettingsFuture);
      case "pie":
        return PieGraph(
          data: data,
          pieGraphWidgetData:
              dashboardData.dashboardWidgets[index].pieGraphData!,
          widgetTitle: dashboardData.dashboardWidgets[index].title,
          dashboardDataFuture: matchFormSettingsFuture,
        );
      default:
        return Container();
    }
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

            if (matchData == null || matchData.isEmpty) {
              return const Center(
                child: Text(
                  "No data available yet",
                  style: smallerDefaultStyle,
                  textAlign: TextAlign.center,
                ),
              );
            }

            return SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: List.generate(
                  dashboardData.widgetNumber,
                  (index) {
                    return Column(
                      children: [
                        getWidget(dashboardData.dashboardWidgets[index].type,
                            matchData, dashboardData, index),
                        const StandardSpacer(height: standartSpacerHeight)
                      ],
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
