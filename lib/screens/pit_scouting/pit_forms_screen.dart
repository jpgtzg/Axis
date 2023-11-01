/// Written by Juan Pablo Gutiérrez
/// 25 09 2023

import 'package:axis/constants.dart';
import 'package:axis/system/axis/realm/realm_manager.dart';
import 'package:axis/system/axis/realm/realm_models.dart';
import 'package:axis/system/tba/event/event.dart';
import 'package:axis/widgets/event_name_text.dart';
import 'package:axis/widgets/forms/int_form.dart';
import 'package:axis/widgets/forms/multiple_form.dart';
import 'package:axis/widgets/forms/single_form.dart';
import 'package:axis/widgets/forms/text_form.dart';
import 'package:axis/widgets/gradient_scaffold.dart';
import 'package:axis/widgets/standart_spacer.dart';
import 'package:axis/widgets/submit_button.dart';
import 'package:axis/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

// ignore: must_be_immutable
class PitFormScreen extends StatelessWidget {
  final List<TextEditingController> controllers = [];
  final _formKey = GlobalKey<FormState>();
  late PitFormSettingsSchema globalData;
  final Event event;

  PitFormScreen({required this.event, super.key});

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      PitDataSchema pitSchema = PitDataSchema(
          ObjectId(), event.eventKey, int.parse(controllers.first.text));

      for (var element in globalData.questionsArray) {
        pitSchema.questions.add(RealmValue.string(element.question));
        pitSchema.answers.add(RealmValue.string(controllers
            .elementAt(globalData.questionsArray.indexOf(element))
            .text));
      }

      write(pitSchema);

      _formKey.currentState!.reset();
      for (var element in controllers) {
        element.clear();
      }
    }
  }

  Widget getWidget(PitFormSettingsSchema data, int index) {
    switch (data.questionsArray[index].type) {
      case "string":
        return TextForm(
          text: data.questionsArray[index].question,
          inputText: "Enter ${data.questionsArray[index].type}",
          padding: 5,
          controller: controllers.elementAt(index),
        );
      case "int":
        return IntForm(
          text: data.questionsArray[index].question,
          inputText: "Enter ${data.questionsArray[index].type}",
          padding: 5,
          controller: controllers.elementAt(index),
        );
      case "multiple":
        return MultipleForm(
          question: data.questionsArray[index],
          padding: 5,
          controller: controllers.elementAt(index),
        );
      case "single":
        return SingleForm(
          question: data.questionsArray[index],
          padding: 5,
          controller: controllers.elementAt(index),
          formKey: _formKey,
        );
      default:
        return const Text("Error");
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
              const TopBar(topText: "Pit Scouting"),
              EventNameText(event: event),
              const StandardSpacer(height: standartSpacerHeight),
              Expanded(
                child: FutureBuilder(
                  future: getPitFormSettings(),
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
                          return getWidget(data, index);
                        },
                      ),
                    );
                  },
                ),
              ),
              SubmitButton(onPressed: _submitForm),
            ],
          ),
        ),
      ),
    );
  }
}
