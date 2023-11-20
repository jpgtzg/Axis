/// Written by Juan Pablo Gutierrez
/// 19 11 2023

import 'package:axis/constants.dart';
import 'package:axis/system/axis/realm/realm_manager.dart';
import 'package:axis/system/axis/realm/realm_models.dart';
import 'package:axis/widgets/forms/single_form.dart';
import 'package:axis/widgets/forms/text_form.dart';
import 'package:axis/widgets/gradient_scaffold.dart';
import 'package:axis/widgets/settings/line_widget_settings.dart';
import 'package:axis/widgets/settings/pie_widget_settings.dart';
import 'package:axis/widgets/settings/text_widget_settings.dart';
import 'package:axis/widgets/standart_spacer.dart';
import 'package:axis/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

import '../widgets/top_bar.dart';

class DashboardSettingsScreen extends StatefulWidget {
  final int index;
  final DashboardWidget dashboardWidget;
  final Origin origin;

  DashboardSettingsScreen(
      {required this.index,
      DashboardWidget? dashboardWidget,
      required this.origin,
      super.key})
      : dashboardWidget = dashboardWidget ?? DashboardWidget("title", "type");

  @override
  State<DashboardSettingsScreen> createState() =>
      _DashboardSettingsScreenState();
}

class _DashboardSettingsScreenState extends State<DashboardSettingsScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController typeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  late final ValueNotifier<String> _typeNotifier;
  late final DashboardWidget _dashboardWidget;

  @override
  void initState() {
    super.initState();
    _typeNotifier = ValueNotifier<String>(widget.dashboardWidget.type);

    typeController.addListener(() {
      _typeNotifier.value = typeController.text;
    });

    _dashboardWidget = DashboardWidget(
        widget.dashboardWidget.title, widget.dashboardWidget.type);

    if (widget.dashboardWidget.lineTableData == null) {
      _dashboardWidget.lineTableData =
          LineTableWidgetData(ObjectId(), "", ObjectId());
    } else {
      LineTableWidgetData updatedLinetableData = LineTableWidgetData(
          widget.dashboardWidget.lineTableData!.columnIndex,
          widget.dashboardWidget.lineTableData!.columnTitle,
          widget.dashboardWidget.lineTableData!.rowIndex);

      _dashboardWidget.lineTableData = updatedLinetableData;
    }

    if (widget.dashboardWidget.pieGraphData == null) {
      _dashboardWidget.pieGraphData =
          PieGraphWidgetData("", ObjectId(), "", ObjectId());
    } else {
      PieGraphWidgetData updatedPieGraphData = PieGraphWidgetData(
        widget.dashboardWidget.pieGraphData!.graphTitle,
        widget.dashboardWidget.pieGraphData!.graphTitleIndex,
        widget.dashboardWidget.pieGraphData!.title,
        widget.dashboardWidget.pieGraphData!.titleIndex,
      );
      for (var element
          in widget.dashboardWidget!.pieGraphData!.percentageIndex) {
        updatedPieGraphData.percentageIndex.add(element);
      }

      _dashboardWidget.pieGraphData = updatedPieGraphData;
    }

    if (widget.dashboardWidget.textData == null) {
      _dashboardWidget.textData = TextWidgetData(ObjectId(), "");
    } else {
      TextWidgetData updatedTextData = TextWidgetData(
        widget.dashboardWidget.textData!.dataIndex,
        widget.dashboardWidget.textData!.title,
      );

      _dashboardWidget.textData = updatedTextData;
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final DashboardWidget updatedWidget =
          DashboardWidget(titleController.text, typeController.text);

      switch (typeController.text) {
        case lineValue:
          LineTableWidgetData updatedLinetableData = LineTableWidgetData(
              _dashboardWidget.lineTableData!.columnIndex,
              _dashboardWidget.lineTableData!.columnTitle,
              _dashboardWidget.lineTableData!.rowIndex);

          updatedWidget.lineTableData = updatedLinetableData;
          break;
        case pieValue:
          PieGraphWidgetData updatedPieGraphData = PieGraphWidgetData(
            _dashboardWidget.pieGraphData!.graphTitle,
            _dashboardWidget.pieGraphData!.graphTitleIndex,
            _dashboardWidget.pieGraphData!.title,
            _dashboardWidget.pieGraphData!.titleIndex,
          );

          for (var index in _dashboardWidget.pieGraphData!.percentageIndex) {
            updatedPieGraphData.percentageIndex.add(index);
          }

          updatedWidget.pieGraphData = updatedPieGraphData;
          break;
        case textValue:
          TextWidgetData updatedTextData = TextWidgetData(
            _dashboardWidget.textData!.dataIndex,
            _dashboardWidget.textData!.title,
          );

          updatedWidget.textData = updatedTextData;
          break;
        default:
      }

      updateDashboardWidget(updatedWidget, widget.index, widget.origin);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      gradient: const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          paleteLightBlue,
          paletePurple,
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            children: [
              TopBar(
                  topText: widget.origin == Origin.match
                      ? "Match Dashboard settings"
                      : "Pit Dashboard settings"),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextForm(
                          text: "Title",
                          inputText: "Enter widget title",
                          padding: 20,
                          controller: titleController
                            ..value = TextEditingValue(
                              text: widget.dashboardWidget.title.toString(),
                            ),
                        ),
                        SingleForm(
                          padding: 20,
                          controller: typeController
                            ..value = TextEditingValue(
                              text: widget.dashboardWidget.type.toString(),
                            ),
                          title: "Enter Type",
                          availableAnswers: "$lineValue,$pieValue,$textValue",
                        ),
                        ValueListenableBuilder(
                          valueListenable: _typeNotifier,
                          builder: (context, value, child) {
                            if (value == "line") {
                              return LineWidgetSettings(
                                dashboardWidget: _dashboardWidget,
                                origin: widget.origin,
                              );
                            } else if (value == "pie") {
                              return PieWidgetSettings(
                                dashboardWidget: _dashboardWidget,
                                origin: widget.origin,
                              );
                            } else if (value == "text") {
                              return TextWidgetSettings(
                                dashboardWidget: _dashboardWidget,
                                origin: widget.origin,
                              );
                            }
                            return const SizedBox();
                          },
                        ),
                        const StandardSpacer(height: mediumSpacerHeight),
                        Center(
                          child: SubmitButton(onPressed: _submitForm),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
