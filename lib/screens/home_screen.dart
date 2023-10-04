/// Written by Juan Pablo Gutiérrez
/// 02 - 07 - 2023

import 'package:axis/constants.dart';
import 'package:axis/screens/match_scouting/match_form_screen.dart';
import 'package:axis/screens/pit_scouting/pit_forms_screen.dart';
import 'package:axis/widgets/event_carousel.dart';
import 'package:axis/widgets/gradient_scaffold.dart';
import 'package:axis/widgets/menu_button.dart';
import 'package:axis/widgets/selection_button.dart';
import 'package:flutter/material.dart';

import '../widgets/standart_spacer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      gradient: backGroundGradient,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MenuButton(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const StandardSpacer(
                        height: standartSpacerHeight,
                      ),
                      const EventCarousel(),
                      const StandardSpacer(
                        height: standartSpacerHeight,
                      ),
                      SelectionButton(
                          titleText: "Match Scouting",
                          widgetScreen: MatchFormScreen()),
                      const StandardSpacer(
                        height: standartSpacerHeight,
                      ),
                      SelectionButton(
                          titleText: "Pit Scouting",
                          widgetScreen: PitFormScreen()),
                      const StandardSpacer(
                        height: standartSpacerHeight,
                      ),
                      SelectionButton(
                          titleText: "View Data",
                          widgetScreen: MatchFormScreen()),
                      const StandardSpacer(
                        height: standartSpacerHeight,
                      ),
                      SelectionButton(
                          titleText: "titleText",
                          widgetScreen: MatchFormScreen()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
