/// Written by Juan Pablo Gutiérrez
/// 19 11 2023

import 'package:axis/constants.dart';
import 'package:axis/system/axis/realm/realm_manager.dart';
import 'package:axis/system/axis/realm/realm_models.dart';
import 'package:axis/widgets/forms/text_form.dart';
import 'package:axis/widgets/forms/widget_multiple_form.dart';
import 'package:axis/widgets/forms/widget_single_form.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

class PieWidgetSettings extends StatelessWidget {
  final DashboardWidget dashboardWidget;
  late final PieGraphWidgetData pieGraphWidgetData;
  late final TextEditingController titleController;
  late final TextEditingController titleIndexController;
  late final TextEditingController percentageIndexController;
  final Origin origin;

  PieWidgetSettings(
      {required this.dashboardWidget, required this.origin, super.key})
      : titleController = TextEditingController(
            text: dashboardWidget.pieGraphData?.graphTitle ?? ''),
        titleIndexController = TextEditingController(
            text: dashboardWidget.pieGraphData?.titleIndex.hexString ?? ''),
        percentageIndexController = TextEditingController(
            text: dashboardWidget.pieGraphData?.percentageIndex.toString() ??
                '') {
    pieGraphWidgetData = dashboardWidget.pieGraphData ??
        PieGraphWidgetData("", ObjectId(), "", ObjectId());

    titleController.addListener(() {
      pieGraphWidgetData.graphTitle = titleController.text;
    });

    titleIndexController.addListener(() {
      pieGraphWidgetData.titleIndex =
          ObjectId.fromHexString(titleIndexController.text);
    });

    percentageIndexController.addListener(() {
      percentageIndexController.text
          .replaceAll(RegExp(r'[\[\]]'), '')
          .split(",")
          .forEach((element) {
        pieGraphWidgetData.percentageIndex
            .add(ObjectId.fromHexString(element.trim()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextForm(
          text: "Graph title",
          inputText: "Enter graph title",
          padding: 20,
          controller: titleController
            ..value = TextEditingValue(
              text: pieGraphWidgetData.graphTitle,
            ),
        ),
        FutureBuilder(
          future: (origin == Origin.match)
              ? getMatchFormSettings()
              : getPitFormSettings(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Fetching data...",
                    ),
                    CircularProgressIndicator(),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            if (origin == Origin.match) {
              final data = snapshot.data as MatchFormSettingsSchema;

              if (data == null) {
                return const Center(
                  child: Text("No data"),
                );
              }

              return Column(
                children: [
                  WidgetSingleForm(
                    title: "Enter graph question",
                    labelText: "Enter graph question",
                    padding: 20,
                    controller: titleIndexController,
                    availableAnswers: data.questionsArray
                            .any((element) => element.type == intValue)
                        ? data.questionsArray
                            .where((element) => element.type == intValue)
                            .toList()
                        : data.questionsArray,
                  ),
                  WidgetMultipleForm(
                    title: "Enter percentage questions",
                    labelText: "Enter percentage questions",
                    padding: 20,
                    controller: percentageIndexController,
                    availableAnswers: data.questionsArray
                            .any((element) => element.type == intValue)
                        ? data.questionsArray
                            .where((element) => element.type == intValue)
                            .toList()
                        : data.questionsArray,
                  ),
                ],
              );
            } 

            final data = snapshot.data as PitFormSettingsSchema;

            if (data == null) {
              return const Center(
                child: Text("No data"),
              );
            }

            return Column(
              children: [
                WidgetSingleForm(
                  title: "Enter graph question",
                  labelText: "Enter graph question",
                  padding: 20,
                  controller: titleIndexController,
                  availableAnswers: data.questionsArray
                          .any((element) => element.type == intValue)
                      ? data.questionsArray
                          .where((element) => element.type == intValue)
                          .toList()
                      : data.questionsArray,
                ),
                WidgetMultipleForm(
                  title: "Enter percentage questions",
                  labelText: "Enter percentage questions",
                  padding: 20,
                  controller: percentageIndexController,
                  availableAnswers: data.questionsArray
                          .any((element) => element.type == intValue)
                      ? data.questionsArray
                          .where((element) => element.type == intValue)
                          .toList()
                      : data.questionsArray,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
