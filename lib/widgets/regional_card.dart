/// Written by Juan Pablo Gutiérrez
/// 05 - 07 - 2023
import 'package:axis/constants.dart';
import 'package:axis/screens/regional_screen.dart';
import 'package:flutter/material.dart';

import '../system/tba/event/event.dart';

class RegionalCard extends StatelessWidget {
  final Event event;
  const RegionalCard({required this.event, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>  RegionalScreen(event: event))),
      child: Container(
        width: MediaQuery.of(context).size.width / (1 / 8),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                (DateTime.parse(event.startDate).isAfter(DateTime.now()))
                    ? "Next event:"
                    : "Past event:",
                style: substitleStyle,
              ),
              Text(
                event.name,
                style: defaultStyle,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
