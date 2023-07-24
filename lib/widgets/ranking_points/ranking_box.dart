/// Written by Juan Pablo Gutiérrez
/// 24 - 07 - 2023

import 'package:axis/system/tba/event/event.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../system/tba/event/event_getter.dart';
import 'ranking_bar.dart';

class RankingBox extends StatelessWidget {
  final Event event;
  const RankingBox({required this.event, super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 13 / 9,
      child: Container(
        padding: const EdgeInsets.all(8.0),
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
            borderRadius: BorderRadius.circular(30)),
        child: FutureBuilder(
          future: getEventRankings(event),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            final data = snapshot.data;

            if (data == null || data.isEmpty) {
              return const Center(
                child: Text(
                  "No data was found, check back later",
                  style: smallerDefaultStyle,
                  textAlign: TextAlign.center,
                ),
              );
            }

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: RankingBar(
                data: data,
              ),
            );
          },
        ),
      ),
    );
  }
}
