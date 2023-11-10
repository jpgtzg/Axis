/// Written by Juan Pablo Gutiérrez

import 'package:axis/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 13 / 4,
      child: DottedBorder(
        dashPattern: const [10],
        borderType: BorderType.RRect,
        radius: const Radius.circular(25),
        color: paleteBlue,
        strokeWidth: 3.5,
        child: ClipRRect(
          child: Container(
            color: paleteBlue.withOpacity(0.2),
            height: 150,
            width: double.infinity,
            child: IconButton(
                icon: const Icon(
                  Icons.add,
                  size: 50,
                  color: paleteBlue,
                ),
                onPressed: () {}),
          ),
        ),
      ),
    );
  }
}
