/// Written by Juan Pablo Gutiérrez
/// 05 - 07 - 2023

import 'package:axis/constants.dart';
import 'package:flutter/material.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        BackButton(),
        SizedBox(
          width: 5,
        ),
        Text(
          "Back",
          style:defaultStyle
        ),
      ],
    );
  }
}
