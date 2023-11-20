/// Written by Juan Pablo Gutiérrez
///
/// 09 11 2023

import 'package:axis/constants.dart';
import 'package:axis/system/axis/realm/realm_manager.dart';
import 'package:axis/widgets/gradient_scaffold.dart';
import 'package:axis/widgets/settings/add_button.dart';
import 'package:axis/widgets/settings/question_display_box.dart';
import 'package:axis/widgets/standart_spacer.dart';
import 'package:axis/widgets/top_bar.dart';
import 'package:flutter/material.dart';

class MatchFormsSettingsScreen extends StatelessWidget {
  const MatchFormsSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      gradient: const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          paleteBlue,
          paletePurple,
          paleteCoral,
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            children: [
              const TopBar(topText: "   Match Forms settings"),
              const StandardSpacer(height: standartSpacerHeight),
              Expanded(
                child: FutureBuilder(
                  future: getMatchFormSettings(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Fetching robots...",
                              style: defaultStyle,
                            ),
                            StandardSpacer(height: standartSpacerHeight),
                            CircularProgressIndicator(),
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    final data = snapshot.data;

                    if (data == null) {
                      return const Center(
                        child: Text(
                          "No form settings yet, ask your coach to set them up!",
                          style: smallerDefaultStyle,
                          textAlign: TextAlign.center,
                        ),
                      );
                    }
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: data.questionNumber + 1,
                            itemBuilder: (context, index) {
                              if (index == data.questionNumber) {
                                return AddButton(
                                  index: index,
                                  origin: Origin.match,
                                  purpose: Purpose.forms,
                                );
                              } else {
                                return Column(
                                  children: [
                                    QuestionDisplayBox(
                                      question: data.questionsArray[index],
                                      index: index,
                                      origin: Origin.match,
                                      primaryColor:
                                          paleteLightBlue.withOpacity(0.9),
                                      buttonColor: paleteCoral,
                                    ),
                                    const StandardSpacer(
                                        height: standartSpacerHeight),
                                  ],
                                );
                              }
                            },
                          ),
                        ),
                      ],
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
