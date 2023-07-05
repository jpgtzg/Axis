/// Written by Juan Pablo Gutiérrez
/// 02 - 07 - 2023

import 'package:axis/constants.dart';
import 'package:axis/system/tba/team/team_getter.dart';
import 'package:axis/widgets/gradient_scaffold.dart';
import 'package:axis/widgets/logo.dart';
import 'package:axis/widgets/regional_card.dart';
import 'package:axis/widgets/selection_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../widgets/standart_spacer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      gradient: backGroundGradient,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AxisLogo(),
                    IconButton(
                      onPressed: () => print("PRESSED"),
                      icon: menuIcon,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const StandardSpacer(),
                      FutureBuilder(
                        future: getTeamEvents(DateTime.now().year, true),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          final data = snapshot.data;

                          return CarouselSlider(
                            options: CarouselOptions(
                              enableInfiniteScroll: true,
                              aspectRatio: 16 / 9,
                              enlargeCenterPage: true,
                            ),
                            items: data!
                                .map((item) => RegionalCard(event: item))
                                .toList(),
                          );
                        },
                      ),
                      const StandardSpacer(),
                      SelectionButton(),
                      const StandardSpacer(),
                      SelectionButton(),
                      const StandardSpacer(),
                      SelectionButton(),
                      const StandardSpacer(),
                      SelectionButton()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
width: MediaQuery.of(context).size.width /
                                        (1 / 8),*/