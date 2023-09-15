/// Written by Juan Pablo Gutiérrez
/// 12 - 07 - 2import 'package:flutter/material.dart';

import 'package:axis/constants.dart';
import 'package:axis/screens/team_screen.dart';
import 'package:flutter/material.dart';
import '../system/tba/event/event.dart';
import '../system/tba/team/team.dart';

class TeamCard extends StatelessWidget {
  final Team team;
  final Event event;

  const TeamCard({required this.team, required this.event, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (builder) => TeamScreen(team: team, event: event,))),
      child: Container(
        width: MediaQuery.of(context).size.height / 2.5,
        height: MediaQuery.of(context).size.height / 2.5,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(team.imgUrl ?? ""),
            fit: BoxFit.cover,
          ),
          color: Colors.red,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  alignment: Alignment.center,
                  height: constraints.maxHeight / 3.5,
                  width: constraints.maxWidth / 1.5,
                  decoration: BoxDecoration(
                    color: paletePink
                        .withAlpha(240), // Theme.of(context).highlightColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    team.teamNumber,
                    style: defaultStyle,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
