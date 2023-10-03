/// Written by Juan Pablo Gutiérrez
/// 25 - 07 - 2023

import 'package:axis/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../system/tba/team/team.dart';

class COPRRadarChart extends StatefulWidget {
  final Team team;
  final String eventKey;
  const COPRRadarChart({required this.team, required this.eventKey, super.key});

  @override
  State<COPRRadarChart> createState() => _COPRRadarChartState();
}

class _COPRRadarChartState extends State<COPRRadarChart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 3.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'OPR: ${widget.team.opr ?? "No data"}',
                  style: smallerDefaultStyle,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                ),
                Text(
                  'DPR: ${widget.team.dpr ?? "No data"}',
                  style: smallerDefaultStyle,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                ),
                Text(
                  'CCWM: ${widget.team.ccwm ?? "No data"}',
                  style: smallerDefaultStyle,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                ),
                Text(
                  'EPA: ${widget.team.epa?.mean.toString() ?? "No data"}',
                  style: smallerDefaultStyle,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                ),
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 1,
            child: RadarChart(
              RadarChartData(
                dataSets: showingDataSets(),
                radarTouchData: RadarTouchData(
                  touchCallback: (FlTouchEvent event, response) {},
                ),
                radarBackgroundColor: Colors.transparent,
                borderData: FlBorderData(show: false),
                radarBorderData: const BorderSide(color: Colors.transparent),
                titlePositionPercentageOffset: 0.2,
                titleTextStyle:
                    const TextStyle(color: Colors.white, fontSize: 14),
                getTitle: (index, angle) {
                  switch (index) {
                    case 0:
                      return const RadarChartTitle(text: 'OPR', angle: 0);
                    case 1:
                      return const RadarChartTitle(text: 'DPR', angle: 0);
                    case 2:
                      return const RadarChartTitle(text: 'CCWM', angle: 0);
                    case 3:
                      return const RadarChartTitle(text: 'EPA', angle: 0);
                    default:
                      return const RadarChartTitle(text: '');
                  }
                },
                tickCount: 1,
                ticksTextStyle:
                    const TextStyle(color: Colors.transparent, fontSize: 10),
                tickBorderData: const BorderSide(color: Colors.transparent),
                gridBorderData:
                    BorderSide(color: Colors.white.withOpacity(0.4), width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<RadarDataSet> showingDataSets() {
    return rawDataSets().asMap().entries.map((entry) {
      final rawDataSet = entry.value;

      return RadarDataSet(
        fillColor: rawDataSet.color.withOpacity(0.2),
        borderColor: rawDataSet.color,
        entryRadius: 6,
        dataEntries:
            rawDataSet.values.map((e) => RadarEntry(value: e)).toList(),
        borderWidth: 3,
      );
    }).toList();
  }

  List<RawDataSet> rawDataSets() {
    return [
      RawDataSet(
        title: 'COPR',
        color: Colors.purple,
        values: [
          widget.team.opr ?? 0,
          widget.team.dpr ?? 0,
          widget.team.ccwm ?? 0,
          widget.team.epa?.mean ?? 0,
        ],
      ),
    ];
  }
}

class RawDataSet {
  RawDataSet({
    required this.title,
    required this.color,
    required this.values,
  });

  final String title;
  final Color color;
  final List<double> values;
}
