import 'dart:math';

import 'package:axis/constants.dart';
import 'package:axis/system/axis/realm/realm_models.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieGraph extends StatefulWidget {
  final List<MatchDataSchema> matchData;
  final PieGraphWidgetData pieGraphWidgetData;
  final String widgetTitle;
  const PieGraph(
      {required this.matchData,
      required this.pieGraphWidgetData,
      required this.widgetTitle,
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
                  matchData: widget.matchData[index],
                );
              },
              shrinkWrap: true,
              itemCount: widget.matchData.length,
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
  const _IndividualPieGraph(
      {required this.matchData, required this.pieGraphWidgetData, super.key});

  @override
  State<_IndividualPieGraph> createState() => _IndividualPieGraphState();
}

class _IndividualPieGraphState extends State<_IndividualPieGraph> {
  List<PieChartSectionData> _mainDataSections = [];
  List<Color> _sectionColors = [];
  int touchedIndex = -1;

  @override
  void initState() {
    super.initState();
    _generateSectionColors();
    _updatePieChartSections();
  }

  void _generateSectionColors() {
    final random = Random();
    _sectionColors = List.generate(
      widget.pieGraphWidgetData.percentageIndex.length,
      (index) {
        final baseColor = Color.fromRGBO(
          random.nextInt(256) + 40,
          random.nextInt(256) + 40,
          random.nextInt(256) + 130, // Blue
          1, // Alpha
        );

        return baseColor.withOpacity(1 - index * 0.15);
      },
    );
  }

  void _updatePieChartSections() {
    _mainDataSections = List.generate(
      widget.pieGraphWidgetData.percentageIndex.length,
      (index) {
        var element = widget.matchData
            .answers[widget.pieGraphWidgetData.percentageIndex[index]];

        final isTouched = index == touchedIndex;
        final radius = isTouched ? 60.0 : 50.0;

        return PieChartSectionData(
          color: _sectionColors[index],
          value: double.parse(element.value.toString()),
          title: element.value.toString(),
          radius: radius,
          titleStyle: smallerDefaultStyle,
          borderSide: isTouched
              ? const BorderSide(color: Colors.white, width: 6)
              : BorderSide(color: Colors.white.withOpacity(0)),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
            "${widget.pieGraphWidgetData.graphTitle} ${widget.matchData.answers[widget.pieGraphWidgetData.graphTitleIndex].value.toString()}",
            style: smallerDefaultStyle),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
              widget.pieGraphWidgetData.percentageIndex.length, (secondIndex) {
            var element = widget.matchData.questions[
                widget.pieGraphWidgetData.percentageIndex[secondIndex]];
            return Row(
              children: [
                Container(
                  width: touchedIndex == secondIndex ? 20 : 16,
                  height: touchedIndex == secondIndex ? 20 : 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _mainDataSections[secondIndex].color,
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
          }),
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
