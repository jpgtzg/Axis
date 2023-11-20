/// Written by Juan Pablo Gutiérrez
/// 19 - 11 - 2023

import 'package:axis/constants.dart';
import 'package:axis/system/axis/realm/realm_models.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class WidgetMultipleForm extends StatefulWidget {
  final String title;
  final String labelText;
  final double padding;
  final TextEditingController controller;
  WidgetMultipleForm({
    super.key,
    required this.title,
    required this.labelText,
    required this.padding,
    required this.controller,
    required List<Question> availableAnswers,
  }) {
    items = availableAnswers
        .map((question) =>
            MultiSelectItem<String>(question.questionID.hexString, question.question))
        .toList();
  }

  late final List<MultiSelectItem<String>> items;

  @override
  State<WidgetMultipleForm> createState() => _WidgetMultipleFormState();
}

class _WidgetMultipleFormState extends State<WidgetMultipleForm> {
  final List<String> _selectedQuestion = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.padding,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0, left: 30),
            child: Text(
              widget.title,
              style: const TextStyle(
                fontFamily: "Manrope",
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 221, 221, 221),
                fontSize: 20,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10, right: 30, left: 30),
          child: Container(
            padding:
                const EdgeInsets.only(bottom: 10.0, right: 15.5, left: 15.5),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              border: Border.all(
                color: Colors.black.withOpacity(0.4),
                width: 0.7,
              ),
            ),
            child: MultiSelectBottomSheetField(
              items: widget.items,
              isDismissible: false,
              searchable: true,
              title: Text(widget.title),
              buttonText: Text(
                widget.labelText,
                style: const TextStyle(
                  fontSize: 15,
                  fontFamily: "Poppins",
                ),
              ),
              listType: MultiSelectListType.CHIP,
              onConfirm: (values) {
                for (var element in values) {
                  _selectedQuestion.add(element.toString());
                }

                widget.controller.text = _selectedQuestion.toString();
              },
              chipDisplay: MultiSelectChipDisplay(
                textStyle: smallerDefaultStyle,
                chipColor: paletePink,
                onTap: (value) {
                  _selectedQuestion.remove(value);
                  return _selectedQuestion;
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
