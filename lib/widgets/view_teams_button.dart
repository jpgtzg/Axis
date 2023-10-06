/// Written by Juan Pablo Gutiérrez
/// 24 - 07 - 2023

import 'package:flutter/material.dart';

import '../constants.dart';
import '../screens/robot_list_screen.dart';
import '../system/tba/event/event.dart';

class ViewTeamsButton extends StatelessWidget {
  final Event event;
  const ViewTeamsButton({required this.event, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RobotListScreen(event: event),
        ),
      ),
      child: AspectRatio(
        aspectRatio: 13 / 4,
        child: Container(
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  paletePink,
                  paletePurple,
                ],
              ),
              color: Colors.red,
              borderRadius: BorderRadius.circular(25)),
          child: const Center(
            child: Text(
              "View Teams",
              style: defaultStyle,
            ),
          ),
        ),
      ),
    );
  }
}
