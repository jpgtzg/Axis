/// Written by Juan Pablo Gutiérrez
/// 02 01 2023

import 'package:axis/constants.dart';
import 'package:axis/system/axis/realm/realm_manager.dart';
import 'package:axis/system/axis/realm/realm_models.dart';
import 'package:axis/system/tba/event/event.dart';
import 'package:axis/system/tba/team/team.dart';
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
  late Future<PitDashboardSchema?>? dashboardDataFuture;
  late Future<List<PitDataSchema>> pitDataFuture;

  @override
  void initState() {
    super.initState();
    dashboardDataFuture = getPitDashboardSettings();
    dashboardDataFuture!.then((dashboardData) {
      if (dashboardData != null) {
        pitDataFuture = getPitData(widget.team, widget.event);
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
                        TextBox(
                          pitData: pitData,
                          dataIndex: dashboardData.dashboardWidgets[index].textData!.dataIndex,
                          title: dashboardData.dashboardWidgets[index].title,
                        ),
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
