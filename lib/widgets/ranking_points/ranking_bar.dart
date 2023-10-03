/// Written by Juan Pablo Gutiérrez
/// 24 - 07 - 2023

import 'package:axis/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../system/tba/event/rank.dart';


class RankingBar extends StatefulWidget {
  final List<Rank> data;
  const   RankingBar({required this.data, super.key});

  @override
  State<StatefulWidget> createState() => RankingBarState();
}

class RankingBarState extends State<RankingBar> {
  final Duration animDuration = const Duration(milliseconds: 250);

  bool isPlaying = false;

  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: (widget.data.length / 6) / 1,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text(
                  'Ranking points',
                  style: defaultStyle,
                ),
                const SizedBox(
                  height: 38,
                ),
                Expanded(
                  child: BarChart(
                    mainBarData(),
                    swapAnimationDuration: animDuration,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: isTouched ? Colors.blue : paletePink ,
          width: width,
          borderSide: isTouched
              ? const BorderSide(color: Colors.yellow)
              : const BorderSide(color: Colors.blue, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: widget.data[0].rankingPoints + 1,
            color: Colors.purple,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipHorizontalAlignment: FLHorizontalAlignment.right,
          tooltipMargin: -10,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            return BarTooltipItem(
              '${group.x.toInt().toString()}\n',
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: (rod.toY).toString(),
                  style: const TextStyle(
                    color: Colors.yellow,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: widget.data.asMap().entries.map((e) {
        return makeGroupData(
          int.parse(e.value.team),
          e.value.rankingPoints,
          isTouched: e.key == touchedIndex,
        );
      }).toList(),
      gridData: const FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: Text(
        value.toString().substring(0, value.toString().length - 2),
        style: style,
      ),
    );
  }
}
