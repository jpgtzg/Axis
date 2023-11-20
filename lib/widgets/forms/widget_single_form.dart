/// Written by Juan Pablo Gutiérrez
/// 19 11 2023

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../system/axis/realm/realm_models.dart';

class WidgetSingleForm extends StatefulWidget {
  final String title;
  final String labelText;
  final double padding;
  final TextEditingController controller;
  late final List<DropdownMenuItem<Question>> items;

  WidgetSingleForm({
    super.key,
    required this.title,
    required this.labelText,
    required this.padding,
    required this.controller,
    required List<Question> availableAnswers,
  }) {
    items = availableAnswers
        .map((question) => DropdownMenuItem<Question>(
            value: question,
            child: Text(
              question.question,
              overflow: TextOverflow.visible,
            )))
        .toList();
  }

  @override
  State<WidgetSingleForm> createState() => _WidgetSingleFormState();
}

class _WidgetSingleFormState extends State<WidgetSingleForm> {
  late String _selectedOption = "";

  @override
  void initState() {
    super.initState();

    if (widget.controller.text.isNotEmpty) {
      _selectedOption = widget.controller.text;
    } else {
      _selectedOption = widget.items.first.value!.questionID.toString();
    }

    widget.controller.text = _selectedOption;
  }

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
          padding: const EdgeInsets.only(bottom: 10, right: 15, left: 30),
          child: DropdownButtonFormField2<Question>(
            value: widget.items.any((item) =>
                    item.value!.questionID.hexString == _selectedOption)
                ? widget.items
                    .firstWhere((item) =>
                        item.value!.questionID.hexString == _selectedOption)
                    .value
                : null,
            items: widget.items,
            validator: (value) {
              if (value == null) {
                return "Enter Valid Answer";
              } else {
                _selectedOption = value.questionID.toString();
                widget.controller.text = value.questionID.toString();
                return null;
              }
            },
            decoration: InputDecoration(
              labelText: widget.labelText,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(),
              ),
            ),
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.only(right: 5),
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.black45,
              ),
              iconSize: 24,
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
            ),
            onChanged: (Question? newValue) {
              setState(
                () {
                  widget.controller.text =
                      newValue?.questionID.toString() ?? '';
                  _selectedOption = newValue?.questionID.toString() ?? '';
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
