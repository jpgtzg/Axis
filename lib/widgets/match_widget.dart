/// Writtn by Juan Pablo Gutiérrez
/// 20 - 07 - 2023

import 'package:axis/system/tba/event/event.dart';
import 'package:axis/system/tba/team/match.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../system/tba/team/team_getter.dart';

class MatchWidget extends StatelessWidget {
  final Event event;
  const MatchWidget({required this.event, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getTeamMatches(event),
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

        return CarouselSlider(
          options: CarouselOptions(
            enableInfiniteScroll: false,
            aspectRatio: 16 / 4,
            enlargeCenterPage: true,
          ),
          items: data
              .map((item) => MatchCard(
                    match: item,
                  ))
              .toList(),
        );
      },
    );
  }
}

class MatchCard extends StatelessWidget {
  final FRCMatch match;
  const MatchCard({required this.match, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            match.matchNumType,
            style: substitleStyle,
          ),
          const VerticalDivider(
            thickness: 1,
            color: Colors.white,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  match.redAlliance!
                      .toString()
                      .substring(1, match.redAlliance!.toString().length - 1),
                  style: redAllianceStyle,
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.white,
                  height: 20,
                ),
                Text(
                  match.blueAlliance!
                      .toString()
                      .substring(1, match.blueAlliance!.toString().length - 1),
                  style: blueAllianceStyle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
