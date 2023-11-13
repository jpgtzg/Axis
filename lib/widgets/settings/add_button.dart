/// Written by Juan Pablo Gutiérrez

import 'package:axis/constants.dart';
import 'package:axis/screens/question_settings_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final int index;
  final Origin origin;
  const AddButton(
      {super.key, required this.index, required this.origin});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuestionSettingsScreen(
            index: index,
            origin: origin,
          ),
        ),
      ),
      child: AspectRatio(
        aspectRatio: 13 / 4,
        child: DottedBorder(
          dashPattern: const [10],
          borderType: BorderType.RRect,
          radius: const Radius.circular(25),
          color: paleteBlue,
          strokeWidth: 3.5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              color: paleteBlue.withOpacity(0.2),
              height: 150,
              width: double.infinity,
              child: const Icon(
                Icons.add,
                size: 50,
                color: paleteBlue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
