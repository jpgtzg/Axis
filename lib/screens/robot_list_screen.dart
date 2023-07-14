/// Written by Juan Pablo Gutiérrez
/// 12 - 07- 2023

import 'package:axis/system/tba/event/event_getter.dart';
import 'package:axis/widgets/gradient_scaffold.dart';
import 'package:axis/widgets/standart_spacer.dart';
import 'package:axis/widgets/team_card.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../system/tba/event/event.dart';

class RobotListScreen extends StatelessWidget {
  final Event event;
  const RobotListScreen({required this.event, super.key});

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
          child: FutureBuilder(
            future: getEventTeams(event),
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
                    "No registered robots yet, check back later",
                    style: smallerDefaultStyle,
                    textAlign: TextAlign.center,
                  ),
                );
              }
              return ListView.builder(
                physics: const ScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const StandardSpacer(height: standartSpacerHeight),
                      TeamCard(team: data[index]),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
