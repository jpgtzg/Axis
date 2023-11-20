import 'dart:math';

import 'package:axis/constants.dart';
import 'package:axis/system/axis/realm/realm_models.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieGraph extends StatefulWidget {
  final List data;
  final PieGraphWidgetData pieGraphWidgetData;
  final String widgetTitle;
  final Future? dashboardDataFuture;
  const PieGraph(
      {required this.data,
      required this.pieGraphWidgetData,
      required this.widgetTitle,
      required this.dashboardDataFuture,
      super.key});

  @override
  State<StatefulWidget> createState() => PieGraphState();
}

class PieGraphState extends State<PieGraph> {
  List<Color> colorList = [
    paleteBlue,
    paleteDarkColar,
    paleteLighGreen,
    paleteLightBlue,
    paleteOrange,
    paleteCoral,
    paletePink,
    paletePurple,
    paleteYellow
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: paleteBlue,
      ),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.widgetTitle,
              style: smallerDefaultStyle,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return _IndividualPieGraph(
                  pieGraphWidgetData: widget.pieGraphWidgetData,
                  matchData: widget.data[index],
                  dataFuture: widget.dashboardDataFuture,
                );
              },
              shrinkWrap: true,
              itemCount: widget.data.length,
            ),
          ],
        ),
      ),
    );
  }
}

class _IndividualPieGraph extends StatefulWidget {
  final MatchDataSchema matchData;
  final PieGraphWidgetData pieGraphWidgetData;
  final Future? dataFuture;
  const _IndividualPieGraph(
      {required this.matchData,
      required this.pieGraphWidgetData,
      required this.dataFuture});

  @override
  State<_IndividualPieGraph> createState() => _IndividualPieGraphState();
}

class _IndividualPieGraphState extends State<_IndividualPieGraph> {
  List<PieChartSectionData> _mainDataSections = [];
  List<Color> _sectionColors = [];
  List<Widget> _children = [];

  int touchedIndex = -1;
  int graphTitleIndex = 0;

  @override
  void initState() {
    super.initState();
    _generateSectionColors();
    _updatePieChartSections();
    _generateChildren();
  }

  void _generateSectionColors() {
    final random = Random();
    _sectionColors = List.generate(
      widget.pieGraphWidgetData.percentageIndex.length,
      (index) {
        final baseColor = Color.fromRGBO(
          random.nextInt(206), // Ensure value is between 0-255
          random.nextInt(206), // Ensure value is between 0-255
          random.nextInt(126), // Ensure value is between 0-255
          1, // Alpha
        );

        return baseColor.withOpacity(1 - index * 0.15);
      },
    );
  }

  Future<void> _updatePieChartSections() async {
    var value = await widget.dataFuture as MatchFormSettingsSchema;
    _mainDataSections =
        widget.pieGraphWidgetData.percentageIndex.asMap().entries.map((entry) {
      int i = entry.key;
      var dataObjectID = entry.value;

      int trueIndex = value.questionsArray
          .indexWhere((element) => element.questionID == dataObjectID);

      graphTitleIndex = value.questionsArray.indexWhere((element) =>
          element.questionID == widget.pieGraphWidgetData.titleIndex);

      var element = widget.matchData.answers[trueIndex];

      final isTouched = i == touchedIndex;
      final radius = isTouched ? 60.0 : 50.0;

      return PieChartSectionData(
        color: _sectionColors[i],
        value: double.parse(element.value.toString()),
        title: element.value.toString(),
        radius: radius,
        titleStyle: smallerDefaultStyle,
        borderSide: isTouched
            ? const BorderSide(color: Colors.white, width: 6)
            : BorderSide(color: Colors.white.withOpacity(0)),
      );
    }).toList();

    setState(() {}); // Call setState to trigger a rebuild
  }

  Future<void> _generateChildren() async {
    var value = await widget.dataFuture as MatchFormSettingsSchema;
    _children =
        widget.pieGraphWidgetData.percentageIndex.asMap().entries.map((entry) {
      int i = entry.key;
      var dataObjectID = entry.value;

      int trueIndex = value.questionsArray
          .indexWhere((element) => element.questionID == dataObjectID);

      var element = widget.matchData.questions[trueIndex];

      return Row(
        children: [
          Container(
            width: touchedIndex == i ? 20 : 16,
            height: touchedIndex == i ? 20 : 16,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
          ),
          Expanded(
            child: Text(
              "${element.value}: ${element.value.toString()}",
              style: substitleStyle,
              overflow: TextOverflow.clip,
            ),
          ),
        ],
      );
    }).toList();

    setState(() {}); // Call setState to trigger a rebuild
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
            "${widget.pieGraphWidgetData.graphTitle} ${widget.matchData.answers[graphTitleIndex].value.toString()}",
            style: smallerDefaultStyle),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: _children,
        ),
        AspectRatio(
          aspectRatio: 1,
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex = -1;
                    } else {
                      touchedIndex =
                          pieTouchResponse.touchedSection!.touchedSectionIndex;
                    }
                    _updatePieChartSections();
                  });
                },
              ),
              borderData: FlBorderData(
                show: false,
              ),
              sectionsSpace: 0,
              centerSpaceRadius: 70,
              centerSpaceColor: Colors.white,
              sections: _mainDataSections,
            ),
          ),
        ),
      ],
    );
  }
}
