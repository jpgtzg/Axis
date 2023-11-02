import 'package:axis/constants.dart';
import 'package:axis/system/axis/realm/realm_models.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PresetLineChart extends StatefulWidget {
  final List<MatchDataSchema> matchData;
  final LineTableWidgetData tableData;
  final String title;
  const PresetLineChart(
      {required this.matchData,
      required this.tableData,
      required this.title,
      super.key});

  @override
  State<PresetLineChart> createState() => _PresetLineChartState();
}

class _PresetLineChartState extends State<PresetLineChart> {
  List<Color> gradientColors = [paleteLightBlue, paleteLighGreen];
  List<FlSpot> mainDataList = [];

  @override
  void initState() {
    super.initState();
    mainDataList = List.generate(
      widget.matchData.length,
      (index) {
        var element = widget.matchData[index];
        return FlSpot(
          double.parse(
              element.answers[widget.tableData.columnIndex].value.toString()),
          double.parse(
              element.answers[widget.tableData.rowIndex].value.toString()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: paleteBlack,
      ),
      padding: const EdgeInsets.only(
        right: 24,
        left: 24,
        top: 24,
        bottom: 24,
      ),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              widget.title,
              style: smallerDefaultStyle,
            ),
          ),
          AspectRatio(
            aspectRatio: 1.70,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: LineChart(
                mainData(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    bool exists = mainDataList.any((element) => element.x == value);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        exists ? value.toInt().toString() : "",
        style: substitleStyle,
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    return Text(value.toInt().toString(),
        style: substitleStyle, textAlign: TextAlign.center);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 1,
        drawHorizontalLine: true,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: paleteLightBlue,
            strokeWidth: 0.5,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: paleteBlack,
            strokeWidth: 0.5,
          );
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
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minY: 0,
      lineBarsData: [
        LineChartBarData(
          spots: mainDataList,
          isCurved: false,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: true,
          ),
        ),
      ],
    );
  }
}
