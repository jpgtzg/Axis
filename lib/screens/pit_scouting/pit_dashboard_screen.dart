/// Written by Juan Pablo Gutiérrez
/// 02 01 2023

import 'package:axis/constants.dart';
import 'package:axis/system/axis/realm/realm_manager.dart';
import 'package:axis/system/axis/realm/realm_models.dart';
import 'package:axis/system/tba/event/event.dart';
import 'package:axis/system/tba/team/team.dart';
import 'package:axis/widgets/graph/line_graph.dart';
import 'package:axis/widgets/graph/pie_graph.dart';
import 'package:axis/widgets/standart_spacer.dart';
import 'package:axis/widgets/text_box.dart';
import 'package:flutter/material.dart';

class PitDashboardScreen extends StatefulWidget {
  final Event event;
  final Team team;
  const PitDashboardScreen(
      {required this.team, required this.event, super.key});

  @override
  State<PitDashboardScreen> createState() => _PitDashboardScreenState();
}

class _PitDashboardScreenState extends State<PitDashboardScreen> {
  late Future<PitDashboardSchema?>? pitDashboardSettingsFuture;
  late Future<List<PitDataSchema>> pitDataFuture;
  late Future<PitFormSettingsSchema?>? pitFormSettingsFuture;

  @override
  void initState() {
    super.initState();
    pitDashboardSettingsFuture = getPitDashboardSettings();
    pitFormSettingsFuture = getPitFormSettings();
    pitDashboardSettingsFuture!.then((dashboardData) {
      if (dashboardData != null) {
        pitDataFuture = getPitData(widget.team, widget.event);
      }
    });
  }

  Widget getWidget(
      String type, List data, PitDashboardSchema dashboardData, int index) {
    switch (type) {
      case "line":
        return PresetLineChart(
          data: data,
          tableData: dashboardData.dashboardWidgets[index].lineTableData!,
          title: dashboardData.dashboardWidgets[index].title,
          formsFuture: pitFormSettingsFuture,
        );
      case "text":
        return TextBox(
            data: data,
            textWidgetData: dashboardData.dashboardWidgets[index].textData!,
            title: dashboardData.dashboardWidgets[index].title,
            formsFuture: pitFormSettingsFuture);
      case "pie":
        return PieGraph(
          data: data,
          pieGraphWidgetData:
              dashboardData.dashboardWidgets[index].pieGraphData!,
          widgetTitle: dashboardData.dashboardWidgets[index].title,
          dashboardDataFuture: pitFormSettingsFuture ,
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: pitDashboardSettingsFuture,
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
          future: pitDataFuture,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            final pitData = snapshot.data;

            if (pitData == null || pitData.isEmpty) {
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
                            pitData, dashboardData, index),
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
