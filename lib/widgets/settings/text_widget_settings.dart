/// Written by Juan Pablo Gutiérrez
/// 19 11 2023

import 'package:axis/constants.dart';
import 'package:axis/system/axis/realm/realm_manager.dart';
import 'package:axis/system/axis/realm/realm_models.dart';
import 'package:axis/widgets/forms/text_form.dart';
import 'package:axis/widgets/forms/widget_single_form.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

class TextWidgetSettings extends StatelessWidget {
  final DashboardWidget dashboardWidget;
  final Origin origin;
  late final TextWidgetData textWidgetData;
  late final TextEditingController titleController;
  late final TextEditingController dataController;

  TextWidgetSettings(
      {required this.dashboardWidget, required this.origin, super.key})
      : titleController =
            TextEditingController(text: dashboardWidget.textData?.title ?? ''),
        dataController = TextEditingController(
            text: dashboardWidget.textData?.dataIndex.hexString ?? '') {
    textWidgetData = dashboardWidget.textData ?? TextWidgetData(ObjectId(), "");

    titleController.addListener(() {
      textWidgetData.title = titleController.text;
    });

    dataController.addListener(() {
      textWidgetData.dataIndex = ObjectId.fromHexString(dataController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextForm(
          text: "Column title",
          inputText: "Enter column title",
          padding: 20,
          controller: titleController
            ..value = TextEditingValue(
              text: textWidgetData.title,
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
                      title: "Enter column question",
                      labelText: "Enter column question",
                      padding: 20,
                      controller: dataController,
                      availableAnswers: data.questionsArray),
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
                    title: "Enter column question",
                    labelText: "Enter column question",
                    padding: 20,
                    controller: dataController,
                    availableAnswers: data.questionsArray),
              ],
            );
          },
        ),
      ],
    );
  }
}
