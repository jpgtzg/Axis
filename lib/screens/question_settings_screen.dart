import 'package:axis/constants.dart';
import 'package:axis/system/axis/realm/realm_manager.dart';
import 'package:axis/system/axis/realm/realm_models.dart';
import 'package:axis/widgets/forms/text_form.dart';
import 'package:axis/widgets/gradient_scaffold.dart';
import 'package:axis/widgets/standart_spacer.dart';
import 'package:axis/widgets/submit_button.dart';
import 'package:axis/widgets/top_bar.dart';
import 'package:flutter/material.dart';

class QuestionSettingsScreen extends StatelessWidget {
  final int index;
  final Question question;
  final Origin origin;

  final TextEditingController questionController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController availableAnswersController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  QuestionSettingsScreen(
      {Question? question,
      required this.index,
      required this.origin,
      super.key})
      : question = question ?? Question("", "");

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final Question updatedQuestion =
          Question(questionController.text, typeController.text);

      if (availableAnswersController.text.isNotEmpty) {
        for (var element in availableAnswersController.text.split(", ")) {
          updatedQuestion.availableAnswers.add(element);
        }
      }

      updateQuestion(updatedQuestion, index, origin);

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
          paleteLightBlue,
          paletePurple,
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            children: [
              const TopBar(topText: "   Match Forms settings"),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextForm(
                          text: "Question",
                          inputText: "Enter question",
                          padding: 20,
                          controller: questionController
                            ..value = TextEditingValue(
                              text: question.question.toString(),
                            ),
                        ),
                        TextForm(
                          text: "Type",
                          inputText: "Enter type",
                          padding: 20,
                          controller: typeController
                            ..value = TextEditingValue(
                              text: question.type.toString(),
                            ),
                        ),
                        question.availableAnswers.isNotEmpty
                            ? TextForm(
                                text: "Available Answers)",
                                inputText: "Enter available answers",
                                padding: 20,
                                controller: availableAnswersController
                                  ..value = TextEditingValue(
                                    text: question.availableAnswers.join(', '),
                                  ),
                              )
                            : const SizedBox(),
                        const StandardSpacer(height: mediumSpacerHeight),
                        Center(
                          child: SubmitButton(onPressed: _submitForm),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
