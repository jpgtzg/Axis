/// Written by Juan Pablo Gutiérrez
/// 24 - 07 - 2023

import 'package:flutter/material.dart';

import '../constants.dart';
import '../system/tba/event/event.dart';
import 'back_icon.dart';

class TopBar extends StatelessWidget {
  final Event event;
  const TopBar({required this.event, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const BackIcon(),
        Flexible(
          child: Text(
            event.name,
            textAlign: TextAlign.right,
            style: defaultStyle,
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    );
  }
}
