/// Written by Juan Pablo Gutiérrez
/// 03 10 2023

import 'package:axis/constants.dart';
import 'package:axis/system/tba/team/team_getter.dart';
import 'package:axis/widgets/regional_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class EventCarousel extends StatelessWidget {
  const EventCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getTeamEvents(DateTime.now().year, true),
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
            enableInfiniteScroll: true,
            aspectRatio: 16 / 9,
            enlargeCenterPage: true,
          ),
          items: data.map((item) => RegionalCard(event: item)).toList(),
        );
      },
    );
  }
}
