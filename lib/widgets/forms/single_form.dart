import 'package:axis/constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

import '../../system/axis/realm/realm_models.dart';

class SingleForm extends StatefulWidget {
  final Question question;
  final double padding;
  final TextEditingController controller;
  late final List<DropdownMenuItem<String>> items;

  SingleForm({
    Key? key,
    Question? question,
    required this.padding,
    required this.controller,
    String? title,
    String? availableAnswers,
  })  : question = question ?? Question(ObjectId(), title ?? "", singleValue),
        super(key: key) {
    if (availableAnswers != null) {
      for (var answer in availableAnswers.split(',')) {
        this.question.availableAnswers.add(answer);
      }
    }

    items = this
        .question
        .availableAnswers
        .map((question) =>
            DropdownMenuItem<String>(value: question, child: Text(question)))
        .toList();
  }

  @override
  State<SingleForm> createState() => _SingleFormState();
}

class _SingleFormState extends State<SingleForm> {
  late String _selectedOption = "";

  @override
  void initState() {
    super.initState();

    if (widget.controller.text.isNotEmpty) {
      _selectedOption = widget.controller.text;
    } else {
      _selectedOption = widget.items.first.value!;
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
          child: DropdownButtonFormField2<String>(
            value: widget.items.any((item) => item.value == _selectedOption)
                ? _selectedOption
                : null,
            items: widget.items,
            validator: (value) {
              if (value == null) {
                return "Enter Valid Answer";
              } else {
                _selectedOption = value;
                widget.controller.text = value;
                return null;
              }
            },
            decoration: InputDecoration(
              labelText: widget.question.question,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(),
              ),
            ),
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.only(right: 10),
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
            onChanged: (String? newValue) {
              setState(
                () {
                  widget.controller.text = newValue ?? '';
                  _selectedOption = newValue ?? '';
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
