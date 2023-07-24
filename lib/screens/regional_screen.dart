/// Written by Juan Pablo Gutiérrez
/// 05 - 07 - 2023

import 'package:axis/screens/robot_list_screen.dart';
import 'package:axis/system/tba/event/event_getter.dart';
import 'package:axis/widgets/back_icon.dart';
import 'package:axis/widgets/gradient_scaffold.dart';
import 'package:axis/widgets/match_widget.dart';
import 'package:axis/widgets/ranking_bar.dart';
import 'package:axis/widgets/standart_spacer.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../system/tba/event/event.dart';

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
                AspectRatio(
                  aspectRatio: 13 / 9,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30)),
                    child: FutureBuilder(
                      future: getEventRankings(event),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }

                        final data = snapshot.data;

                        if (data == null || data.isEmpty) {
                          return const Center(
                            child: Text(
                              "No data was found, check back later",
                              style: smallerDefaultStyle,
                              textAlign: TextAlign.center,
                            ),
                          );
                        }

                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: RankingBar(
                            data: data,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
