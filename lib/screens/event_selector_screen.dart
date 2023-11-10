/// Written by Juan Pablo Gutiérrez
/// 05 - 08 - 2023

import 'package:axis/constants.dart';
import 'package:axis/screens/match_scouting/match_form_screen.dart';
import 'package:axis/screens/pit_scouting/pit_forms_screen.dart';
import 'package:axis/system/tba/team/team_getter.dart';
import 'package:axis/widgets/gradient_scaffold.dart';
import 'package:axis/widgets/selection_button.dart';
import 'package:axis/widgets/standart_spacer.dart';
import 'package:axis/widgets/top_bar.dart';
import 'package:flutter/material.dart';

class EventSelectorScreen extends StatelessWidget {
  final Origin selector;
  const EventSelectorScreen({required this.selector, super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          paletePink,
          paleteDarkOrange,
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            children: [
              TopBar(
                topText: (selector == Origin.match)
                    ? "Match Scouting"
                    : "Pit Scouting",
              ),
              const StandardSpacer(height: standartSpacerHeight),
              Expanded(
                child: FutureBuilder(
                  future: getTeamEvents(DateTime.now().year, true),
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
                          textAlign: TextAlign.center,
                        ),
                      );
                    }

                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            const StandardSpacer(height: standartSpacerHeight),
                            SelectionButton(
                              titleText: data[index].name,
                              widgetScreen: (selector == Origin.match)
                                  ? MatchFormScreen(event: data[index])
                                  : PitFormScreen(event: data[index]),
                              primaryColor: paletePurple,
                              buttonColor: paletePink,
                            ),
                          ],
                        );
                      },
                      itemCount: data.length,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
