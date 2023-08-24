/// Written by Juan Pablo Gutiérrez
/// 8 - 08 - 2023

import 'dart:ffi';

import 'package:axis/system/axis/realm/realm_manager.dart';
import 'package:axis/system/axis/realm/realm_models.dart';
import 'package:axis/widgets/forms/text_form.dart';
import 'package:axis/widgets/gradient_scaffold.dart';
import 'package:axis/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

import '../../constants.dart';
import '../../widgets/standart_spacer.dart';

class MatchFormScreen extends StatelessWidget {
  MatchFormScreen({super.key});

  final List<TextEditingController> controllers = [];
  final _formKey = GlobalKey<FormState>();
  late MatchFormSettingsSchema globalData;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      MatchSchema matchSchema = MatchSchema(ObjectId());
      globalData.questionsArray.forEach((element) {
        matchSchema.questions.add(RealmValue.string(element.question));
        matchSchema.answers.add(RealmValue.string(controllers
            .elementAt(globalData.questionsArray.indexOf(element))
            .text));
      });

      write(matchSchema);

      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      gradient: const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          paletePink,
          paletePurple,
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            children: [
              const TopBar(topText: "Match Scouting"),
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

                    for (var i = 0; i < data.questionNumber; i++) {
                      controllers.add(TextEditingController());
                    }
                    globalData = data;

                    return Form(
                      key: _formKey,
                      child: ListView.builder(
                        itemCount: data.questionNumber,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              TextForm(
                                text: data.questionsArray[index].question,
                                inputText:
                                    "Enter ${data.questionsArray[index].type}",
                                padding: 5,
                                controller: controllers.elementAt(index),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  _submitForm();
                },
                icon: const Icon(Icons.send),
                label: const Text("Send Info"),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
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
