/// Written by Juan Pablo Gutiérrez
/// 25 - 08 - 2023

import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';

import '../../system/axis/realm/realm_models.dart';

class SingleFrom extends StatefulWidget {
  final Question question;
  final double padding;
  final TextEditingController controller;
  SingleFrom(
      {required this.question,
      required this.padding,
      required this.controller,
      super.key}){
        items = question.availableAnswers
            .map((question) =>  S2Choice<String>(value: question, title: question))
            .toList();
      }

  late final items;

  @override
  State<SingleFrom> createState() => _SingleFromState();
}

class _SingleFromState extends State<SingleFrom> {
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
                const EdgeInsets.only(bottom: 10.0, right: 12.5, left: 12.5),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              border: Border.all(
                color: Colors.black.withOpacity(0.4),
                width: 0.7,
              ),
            ),
            child: SmartSelect.single(title: widget.question.question, placeholder: "Select one", selectedValue: null,onChange:(value) {
              
            }, choiceItems: widget.items)
          ),
        ),
      ],
    );
  }
}
