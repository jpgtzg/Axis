/// Written by Juan Pablo Gutiérrez
/// 12 - 07 - 2import 'package:flutter/material.dart';
///
import 'package:flutter/material.dart';
import '../system/tba/team/team.dart';

class TeamCard extends StatelessWidget {
  final Team team;

  const TeamCard({required this.team, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: MediaQuery.of(context).size.height / 2.5,
      height: MediaQuery.of(context).size.height / 2.5,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Image.network(
        team.imgUrl ?? "",
        fit: BoxFit.cover,
      ),
    );
  }
}
