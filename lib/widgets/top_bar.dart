/// Written by Juan Pablo Gutiérrez
/// 24 - 07 - 2023

import 'package:flutter/material.dart';

import '../constants.dart';
import 'back_icon.dart';

class TopBar extends StatelessWidget {
  final String topText;
  const TopBar({required this.topText, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const BackIcon(),
        Flexible(
          child: Text(
            topText,
            textAlign: TextAlign.right,
            style: defaultStyle,
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    );
  }
}
