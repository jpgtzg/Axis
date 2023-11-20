/// Written by Juan Pablo Gutiérrez
/// 19 11 2023

import 'package:axis/constants.dart';
import 'package:axis/system/axis/realm/realm_manager.dart';
import 'package:axis/system/axis/realm/realm_models.dart';
import 'package:axis/widgets/forms/text_form.dart';
import 'package:axis/widgets/forms/widget_single_form.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

class LineWidgetSettings extends StatelessWidget {
  final DashboardWidget dashboardWidget;
  late final LineTableWidgetData lineTableWidgetData;
  late final TextEditingController titleController;
  late final TextEditingController columnController;
  late final TextEditingController rowController;
  final Origin origin;

  LineWidgetSettings(
      {required this.dashboardWidget, required this.origin, super.key})
      : titleController = TextEditingController(
            text: dashboardWidget.lineTableData?.columnTitle ?? ''),
        columnController = TextEditingController(
            text: dashboardWidget.lineTableData?.columnIndex.hexString ?? ''),
        rowController = TextEditingController(
            text: dashboardWidget.lineTableData?.rowIndex.hexString ?? '') {
    lineTableWidgetData = dashboardWidget.lineTableData ??
        LineTableWidgetData(ObjectId(), "", ObjectId());

    titleController.addListener(() {
      lineTableWidgetData.columnTitle = titleController.text;
    });

    columnController.addListener(() {
      lineTableWidgetData.columnIndex =
          ObjectId.fromHexString(columnController.text);
    });

    rowController.addListener(() {
      lineTableWidgetData.rowIndex = ObjectId.fromHexString(rowController.text);
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
              text: lineTableWidgetData.columnTitle,
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

              return Column(
                children: [
                  WidgetSingleForm(
                    title: "Enter column question",
                    labelText: "Enter column question",
                    padding: 20,
                    controller: columnController,
                    availableAnswers: data.questionsArray
                            .any((element) => element.type == intValue)
                        ? data.questionsArray
                            .where((element) => element.type == intValue)
                            .toList()
                        : data.questionsArray,
                  ),
                  WidgetSingleForm(
                    title: "Enter row question",
                    labelText: "Enter row question",
                    padding: 20,
                    controller: rowController,
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

            return Column(
              children: [
                WidgetSingleForm(
                  title: "Enter column question",
                  labelText: "Enter column question",
                  padding: 20,
                  controller: columnController,
                  availableAnswers: data.questionsArray
                          .any((element) => element.type == intValue)
                      ? data.questionsArray
                          .where((element) => element.type == intValue)
                          .toList()
                      : data.questionsArray,
                ),
                WidgetSingleForm(
                  title: "Enter row question",
                  labelText: "Enter row question",
                  padding: 20,
                  controller: rowController,
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
