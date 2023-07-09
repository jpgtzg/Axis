/// Written by Juan Pablo Gutiérrez
/// 05 - 07 - 2023
import 'package:axis/system/tba/event/event_getter.dart';
import 'package:axis/system/tba/team/team_getter.dart';
import 'package:axis/widgets/back_icon.dart';
import 'package:axis/widgets/gradient_scaffold.dart';
import 'package:axis/widgets/standart_spacer.dart';
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
                const StandardSpacer(
                  height: standartSpacerHeight,
                ),
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Competing matches:",
                                style: smallerDefaultStyle,
                              ),
                              Expanded(
                                child: FutureBuilder(
                                  future: getTeamMatches(event),
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
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

                                    return ListView.builder(
                                      itemCount: data.length,
                                      itemBuilder: (context, index) {
                                        return Text(
                                          "${data[index].matchNumType} ${(data[index].blueAlliance!.contains("6647")) ? data[index].blueAlliance.toString() : (data[index].redAlliance!.contains("6647")) ? data[index].redAlliance.toString() : "No alliance known yet"}",
                                          style: substitleStyle,
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Rankings:",
                                style: smallerDefaultStyle,
                              ),
                              const StandardSpacer(
                                height: smallerSpacerHeight,
                              ),
                              Expanded(
                                child: FutureBuilder(
                                  future: getEventRankings(event),
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
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

                                    return ListView.builder(
                                      itemCount: data.length,
                                      itemBuilder: (context, index) {
                                        return Text(
                                          "${data[index].rank}. ${data[index].team} : ${data[index].rankingPoints}",
                                          style: substitleStyle,
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
