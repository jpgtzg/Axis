/// Written by Juan Pablo Gutiérrez
/// 05 10 2023

import 'package:axis/constants.dart';
import 'package:flutter/material.dart';

import '../system/tba/event/event.dart';

class EventNameText extends StatelessWidget {
  final Event event;
  const EventNameText({required this.event, super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        event.name,
        textAlign: TextAlign.left,
        style: smallerDefaultStyle,
        overflow: TextOverflow.visible,
      ),
    );
  }
}
