/// Written by Juan Pablo Gutiérrez
/// 23 - 05 - 2023
///
/// Main file

import 'package:axis/screens/home_screen.dart';
import 'package:axis/system/api_manager.dart';
import 'package:axis/system/axis/realm/realm_manager.dart';
import 'package:axis/system/axis/realm/realm_models.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

import 'constants.dart';

void main() async {
  setClient();
  await setRealm();

  MatchFormSettingsSchema matchFormSettingsSchema =
      MatchFormSettingsSchema(ObjectId(), 1);

  matchFormSettingsSchema.questionsArray
      .add(Question(ObjectId(), "Numero de equipo", "int"));
  matchFormSettingsSchema.questionsArray
      .add(Question(ObjectId(), "Nombre de equipo", "string"));
  matchFormSettingsSchema.questionsArray
      .add(Question(ObjectId(), "Numero de match", "int"));
  matchFormSettingsSchema.questionsArray
      .add(Question(ObjectId(), "Color de alianza", "string"));
  matchFormSettingsSchema.questionsArray
      .add(Question(ObjectId(), "Salio de community?", "single")
        ..availableAnswers.add("Yes")
        ..availableAnswers.add("No"));
  matchFormSettingsSchema.questionsArray
      .add(Question(ObjectId(), "Piezas en bottom row (autonomo)", "int"));
  matchFormSettingsSchema.questionsArray
      .add(Question(ObjectId(), "Piezas en middle row (autonomo)", "int"));
  matchFormSettingsSchema.questionsArray
      .add(Question(ObjectId(), "Piezas en top row (autonomo)", "int"));
  matchFormSettingsSchema.questionsArray
      .add(Question(ObjectId(), "Docking (autonomo)?", "single")
        ..availableAnswers.add("Yes")
        ..availableAnswers.add("No"));

  matchFormSettingsSchema.questionsArray
      .add(Question(ObjectId(), "Piezas en bottom row (teleop)", "int"));
  matchFormSettingsSchema.questionsArray
      .add(Question(ObjectId(), "Piezas en middle row (teleop)", "int"));
  matchFormSettingsSchema.questionsArray
      .add(Question(ObjectId(), "Piezas en top row (teleop)", "int"));
  matchFormSettingsSchema.questionsArray
      .add(Question(ObjectId(), "Defendió?", "single")
        ..availableAnswers.add("Yes")
        ..availableAnswers.add("No"));
  matchFormSettingsSchema.questionsArray
      .add(Question(ObjectId(), "Defendieron al robot?", "single")
        ..availableAnswers.add("Yes")
        ..availableAnswers.add("No"));
  matchFormSettingsSchema.questionsArray
      .add(Question(ObjectId(), "Docking en endgame?", "single")
        ..availableAnswers.add("Yes")
        ..availableAnswers.add("No"));
  matchFormSettingsSchema.questionsArray
      .add(Question(ObjectId(), "Numero de fouls", "int"));
  matchFormSettingsSchema.questionsArray
      .add(Question(ObjectId(), "Numero de tech fouls", "int"));
  matchFormSettingsSchema.questionsArray
      .add(Question(ObjectId(), "Links generados", "int"));
  matchFormSettingsSchema.questionsArray
      .add(Question(ObjectId(), "Puntuación de alianza", "int"));
  matchFormSettingsSchema.questionsArray
      .add(Question(ObjectId(), "Ranking points", "int"));
  matchFormSettingsSchema.questionsArray
      .add(Question(ObjectId(), "Ganó su alianza?", "single")
        ..availableAnswers.add("Yes")
        ..availableAnswers.add("No"));
  matchFormSettingsSchema.questionsArray
      .add(Question(ObjectId(), "Comentarios", "string"));

  matchFormSettingsSchema.questionNumber =
      matchFormSettingsSchema.questionsArray.length;

  updateMatchFormSettings(matchFormSettingsSchema);

  MatchDashboardSchema matchDashboardSchema =
      MatchDashboardSchema(ObjectId(), 1);

  matchDashboardSchema.dashboardWidgets.add(DashboardWidget(
      "Piezas en bottom row (autonomo)", "line",
      lineTableData: LineTableWidgetData(
          ObjectId.fromHexString("655b01c3d76d8895a792001f"),
          "Match",
          ObjectId.fromHexString("655b01c3d76d8895a7920022"))));
/* 
  matchDashboardSchema.dashboardWidgets.add(DashboardWidget(
      "Piezas en middle row (autonomo)", "line",
      lineTableData: LineTableWidgetData(2, "Match" ,6 )));

  matchDashboardSchema.dashboardWidgets.add(DashboardWidget(
    "Porcentaje de piezas",
    "pie",
    pieGraphData: PieGraphWidgetData("Pieces", "Match", 2)
      ..percentageIndex.add(5)
      ..percentageIndex.add(6)
      ..percentageIndex.add(7)
      ..percentageIndex.add(9)
      ..percentageIndex.add(10)
      ..percentageIndex.add(11),
  )); */

  matchDashboardSchema.widgetNumber =
      matchDashboardSchema.dashboardWidgets.length;

  updateMatchDashboardSetting(matchDashboardSchema);

  PitFormSettingsSchema pitFormsSettingsSchema =
      PitFormSettingsSchema(ObjectId(), 0);
  pitFormsSettingsSchema.questionsArray
      .add(Question(ObjectId(), "Numero de equipo", "int"));
  pitFormsSettingsSchema.questionsArray
      .add(Question(ObjectId(), "Nombre de equipo", "string"));
  pitFormsSettingsSchema.questionsArray
      .add(Question(ObjectId(), "Ciclos del robot", "int"));
  pitFormsSettingsSchema.questionsArray
      .add(Question(ObjectId(), "Medidas del robot", "string"));
  pitFormsSettingsSchema.questionsArray
      .add(Question(ObjectId(), "Colocaciones", "multiple")
        ..availableAnswers.add("Middle Grid")
        ..availableAnswers.add("Left Grid")
        ..availableAnswers.add("Right grid"));
  pitFormsSettingsSchema.questionsArray
      .add(Question(ObjectId(), "Que hacen en autonomo?", "string"));
  pitFormsSettingsSchema.questionsArray
      .add(Question(ObjectId(), "Tipo de juego?", "single")
        ..availableAnswers.add("Defensa")
        ..availableAnswers.add("Ofensivo")
        ..availableAnswers.add("Hibrido"));
  pitFormsSettingsSchema.questionsArray
      .add(Question(ObjectId(), "Que piezas pueden agarrar?", "single")
        ..availableAnswers.add("Cubos")
        ..availableAnswers.add("Conos")
        ..availableAnswers.add("Ambos"));
  pitFormsSettingsSchema.questionsArray
      .add(Question(ObjectId(), "Tipo de chassis?", "single")
        ..availableAnswers.add("Mecanum")
        ..availableAnswers.add("Swerve")
        ..availableAnswers.add("Tanque"));
  pitFormsSettingsSchema.questionsArray
      .add(Question(ObjectId(), "Se pueden balancear en autonomo?", "single")
        ..availableAnswers.add("Yes")
        ..availableAnswers.add("No"));
  pitFormsSettingsSchema.questionsArray
      .add(Question(ObjectId(), "Comentarios", "string"));

  pitFormsSettingsSchema.questionNumber =
      pitFormsSettingsSchema.questionsArray.length;

  updatePitFormSettings(pitFormsSettingsSchema);

  PitDashboardSchema pitDashboardSchema = PitDashboardSchema(ObjectId(), 1);

  pitDashboardSchema.dashboardWidgets.add(DashboardWidget(
      "Ciclos del equipo", "text",
      textData: TextWidgetData(ObjectId(), "")));

  /* pitDashboardSchema.dashboardWidgets.add(DashboardWidget(
      "Tipo de chassis", "text",
      textData: TextWidgetData(8, "")));

  pitDashboardSchema.widgetNumber =
      pitDashboardSchema.dashboardWidgets.length;

 */
  updatePitDashboardSetting(pitDashboardSchema);
  runApp(const AxisApp());
}

class AxisApp extends StatelessWidget {
  const AxisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Axis Scouting',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: paleteBlue),
      ),
      home: const HomeScreen(),
    );
  }
}
