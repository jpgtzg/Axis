/// Written by Juan Pablo Gutiérrez
/// 8 - 08 - 2023

import 'package:axis/system/axis/realm/realm_manager.dart';
import 'package:axis/widgets/gradient_scaffold.dart';
import 'package:axis/widgets/top_bar.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../widgets/standart_spacer.dart';

class MatchFormScreen extends StatelessWidget {
  const MatchFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          paleteBlue,
          paleteLightBlue,
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            children: [
              TopBar(topText: "Match Scouting"),
              FutureBuilder(
                future: get("MatchFormSettingsSchema"),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Fetching robots...",
                            style: defaultStyle,
                          ),
                          StandardSpacer(height: standartSpacerHeight),
                          CircularProgressIndicator(),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  final data = snapshot.data;

                  if (data == null) {
                    return const Center(
                      child: Text(
                        "No form settings yet, ask your coach to set them up!",
                        style: smallerDefaultStyle,
                        textAlign: TextAlign.center,
                      ),
                    );
                  }

                  return ListView.builder(
                    physics: const ScrollPhysics(),
                    itemCount: 21,
                    itemBuilder: (context, index) {
                      return Text("aaa");
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
