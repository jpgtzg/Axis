/// Written by Juan Pablo Gutiérrez
/// 09 11 2023

import 'package:axis/constants.dart';
import 'package:axis/screens/match_scouting/match_dashboard_settings_screen.dart';
import 'package:axis/screens/match_scouting/match_forms_settings_screen.dart';
import 'package:axis/screens/pit_scouting/pit_dashboard_settings_screen.dart';
import 'package:axis/screens/pit_scouting/pit_forms_settings_screen.dart';
import 'package:axis/widgets/gradient_scaffold.dart';
import 'package:axis/widgets/selection_button.dart';
import 'package:axis/widgets/standart_spacer.dart';
import 'package:axis/widgets/top_bar.dart';
import 'package:flutter/material.dart';

class SettingsSelectorScreen extends StatelessWidget {
  const SettingsSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const GradientScaffold(
      gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            paleteGreen,
            paleteBlue,
          ]),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopBar(topText: "Settings"),
                StandardSpacer(height: standartSpacerHeight),
                SelectionButton(
                  titleText: "Match Forms Setting",
                  widgetScreen: MatchFormsSettingsScreen(),
                  primaryColor: paleteCoral,
                  buttonColor: paleteLightBlue,
                ),
                StandardSpacer(height: standartSpacerHeight),
                SelectionButton(
                  titleText: "Pit Forms Setting",
                  widgetScreen: PitFormsSettingsScreen(),
                  primaryColor: paleteCoral,
                  buttonColor: paleteLightBlue,
                ),
                StandardSpacer(height: standartSpacerHeight),
                SelectionButton(
                  titleText: "Match Dashboard Setting",
                  widgetScreen: MatchDashboardSettingsScreen(),
                  primaryColor: paleteCoral,
                  buttonColor: paleteLightBlue,
                ),
                StandardSpacer(height: standartSpacerHeight),
                SelectionButton(
                  titleText: "Pit Dashboard Setting",
                  widgetScreen: PitDashboardSettingsScreen(),
                  primaryColor: paleteCoral,
                  buttonColor: paleteLightBlue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
