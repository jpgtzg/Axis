/// Written by Juan Pablo Gutiérrez
/// 05 - 07 - 2023
import 'package:axis/constants.dart';
import 'package:flutter/material.dart';

import '../system/tba/team/event.dart';

class RegionalCard extends StatelessWidget {
  final Event event;
  const RegionalCard({required this.event, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / (1 / 8),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          event.name,
          style: defaultStyle,
        ),
      ),
    );
  }
}
