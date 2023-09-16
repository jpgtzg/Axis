import 'package:flutter/material.dart';

import '../../system/axis/realm/realm_models.dart';

class SingleFormTest extends StatefulWidget {
  final Question question;
  final double padding;
  final TextEditingController controller;
  final GlobalKey<FormState> formKey; // Add a form key

  SingleFormTest({
    required this.question,
    required this.padding,
    required this.controller,
    required this.formKey, // Pass the form key as a parameter
  }) {
    items = question.availableAnswers
        .map((question) =>
            DropdownMenuItem<String>(value: question, child: Text(question)))
        .toList();
  }

  late final items;

  @override
  State<SingleFormTest> createState() => _SingleFormTestState();
}

class _SingleFormTestState extends State<SingleFormTest> {
  late String? _selectedOption;

  // Add a method to reset the widget's state
  void reset() {
    setState(() {
      widget.controller.text = _selectedOption ?? '';
    });
  }

  @override
  void initState() {
    super.initState();

    // Check if there is at least one item in widget.items
    if (widget.items.isNotEmpty) {
      _selectedOption = widget.items.first.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedOption,
      items: widget.items,
      validator: (value) {
        if (value == null) {
          return "Enter Valid Answer";
        } else {
          _selectedOption = "";
          widget.controller.text = _selectedOption ?? '';
          return null;
        }
      },
      onChanged: (String? newValue) {
        setState(() {
          _selectedOption = newValue;
          widget.controller.text = newValue ?? '';
        });
      },
    );
  }
}
