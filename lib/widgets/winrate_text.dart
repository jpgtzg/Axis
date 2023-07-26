/// Written by Juan Pablo Gutiérrez
/// 26 - 07 - 2023
import 'package:flutter/material.dart';

import '../constants.dart';
import '../system/statbotics/statbotics_getter.dart';

class WinrateText extends StatelessWidget {
  final String teamNumber;
  final String eventKey;
  const WinrateText(
      {required this.teamNumber, required this.eventKey, super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FutureBuilder(
        future: getEPA(teamNumber, eventKey),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          final data = snapshot.data;

          if (data == null) {
            return const Center(
              child: Text(
                "No data",
                style: smallerDefaultStyle,
                textAlign: TextAlign.center,
              ),
            );
          }

          return Text(
            "${data.wins} - ${data.looses} - ${data.ties}",
            style: defaultStyle,
          );
        },
      ),
    );
  }
}
