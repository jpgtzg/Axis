/// Written by Juan Pablo Gutiérrez
/// 08 11 2023

import 'package:axis/constants.dart';
import 'package:axis/widgets/standart_spacer.dart';
import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final List data;
  final int dataIndex;
  final String title;
  const TextBox(
      {required this.data,
      required this.dataIndex,
      required this.title,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: paleteBlack,
      ),
      padding: const EdgeInsets.only(
        right: 24,
        left: 24,
        top: 24,
        bottom: 24,
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: smallerDefaultStyle,
            ),
          ),
          const StandardSpacer(height: standartSpacerHeight),
          ...List.generate(
            data.length,
            (index) {
              return Align(
                alignment: Alignment.center,
                child: Text(
                  data[index].answers[dataIndex].value.toString(),
                  style: smallerDefaultStyle,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
