/// Written by Juan Pablo Gutiérrez
/// 26 - 07 - 2023
import 'package:flutter/material.dart';

import '../constants.dart';
import '../system/tba/team/team.dart';

class WinrateText extends StatelessWidget {
  final Team team;
  const WinrateText({required this.team, super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        "${team.epa?.wins} - ${team.epa?.looses} - ${team.epa?.ties}",
        style: defaultStyle,
      ),
    );
  }
}
