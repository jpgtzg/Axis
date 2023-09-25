/// Written by Juan Pablo Gutiérrez
/// 24 - 08 - 2023

import 'package:axis/constants.dart';
import 'package:axis/system/axis/realm/realm_models.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class MultipleForm extends StatefulWidget {
  final Question question;
  final double padding;
  final TextEditingController controller;
  MultipleForm(
      {required this.question,
      required this.padding,
      required this.controller,
      super.key}) {
    items = question.availableAnswers
        .map((question) => MultiSelectItem<String>(question, question))
        .toList();
  }

  late final List<MultiSelectItem<String>> items;

  @override
  State<MultipleForm> createState() => _MultipleFormState();
}

class _MultipleFormState extends State<MultipleForm> {
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
              widget.question.question,
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
              title: Text(widget.question.question),
              buttonText: Text(
                widget.question.question,
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
