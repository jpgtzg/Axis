import 'package:axis/constants.dart';
import 'package:axis/system/axis/realm/realm_manager.dart';
import 'package:axis/system/axis/realm/realm_models.dart';
import 'package:axis/widgets/forms/single_form.dart';
import 'package:axis/widgets/forms/text_form.dart';
import 'package:axis/widgets/gradient_scaffold.dart';
import 'package:axis/widgets/standart_spacer.dart';
import 'package:axis/widgets/submit_button.dart';
import 'package:axis/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

class QuestionSettingsScreen extends StatefulWidget {
  final int index;
  final Question question;
  final Origin origin;

  QuestionSettingsScreen(
      {Question? question,
      required this.index,
      required this.origin,
      super.key})
      : question = question ?? Question(ObjectId(), "", "");

  @override
  State<QuestionSettingsScreen> createState() => _QuestionSettingsScreenState();
}

class _QuestionSettingsScreenState extends State<QuestionSettingsScreen> {
  final TextEditingController questionController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController availableAnswersController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  late final ValueNotifier<String> _typeNotifier;

  @override
  void initState() {
    super.initState();
    _typeNotifier = ValueNotifier<String>(widget.question.type);

    typeController.addListener(() {
      _typeNotifier.value = typeController.text;
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final Question updatedQuestion =
          Question(ObjectId(), questionController.text, typeController.text);

      if (availableAnswersController.text.isNotEmpty) {
        for (var element in availableAnswersController.text.split(", ")) {
          updatedQuestion.availableAnswers.add(element);
        }
      }

      updateQuestion(updatedQuestion, widget.index, widget.origin);
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
              TopBar(
                  topText: widget.origin == Origin.match
                      ? "Match Forms settings"
                      : "Pit Forms settings"),
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
                              text: widget.question.question.toString(),
                            ),
                        ),
                        SingleForm(
                          padding: 20,
                          controller: typeController
                            ..value = TextEditingValue(
                              text: widget.question.type.toString(),
                            ),
                          title: "Enter Type",
                          availableAnswers:
                              "$intValue,$stringValue,$singleValue,$multipleValue,",
                        ),
                        ValueListenableBuilder(
                          valueListenable: _typeNotifier,
                          builder: (context, value, child) {
                            if (value == multipleValue ||
                                value == singleValue) {
                              return TextForm(
                                text: "Available Answers",
                                inputText: "Enter available answers",
                                padding: 20,
                                controller: availableAnswersController
                                  ..value = TextEditingValue(
                                    text: widget.question.availableAnswers
                                        .join(', '),
                                  ),
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
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
