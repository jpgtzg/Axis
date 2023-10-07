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
      .add(Question("Numero de equipo", "int"));
  matchFormSettingsSchema.questionsArray
      .add(Question("Nombre de equipo", "string"));
  matchFormSettingsSchema.questionsArray
      .add(Question("Numero de match", "int"));
  matchFormSettingsSchema.questionsArray
      .add(Question("Color de alianza", "string"));
  matchFormSettingsSchema.questionsArray
      .add(Question("Salio de community?", "single")
        ..availableAnswers.add("Yes")
        ..availableAnswers.add("No"));
  matchFormSettingsSchema.questionsArray
      .add(Question("Piezas en bottom row (autonomo)", "int"));
  matchFormSettingsSchema.questionsArray
      .add(Question("Piezas en middle row (autonomo)", "int"));
  matchFormSettingsSchema.questionsArray
      .add(Question("Piezas en top row (autonomo)", "int"));
  matchFormSettingsSchema.questionsArray
      .add(Question("Docking (autonomo)?", "single")
        ..availableAnswers.add("Yes")
        ..availableAnswers.add("No"));

  matchFormSettingsSchema.questionsArray
      .add(Question("Piezas en bottom row (teleop)", "int"));
  matchFormSettingsSchema.questionsArray
      .add(Question("Piezas en middle row (teleop)", "int"));
  matchFormSettingsSchema.questionsArray
      .add(Question("Piezas en top row (teleop)", "int"));
  matchFormSettingsSchema.questionsArray.add(Question("Defendió?", "single")
    ..availableAnswers.add("Yes")
    ..availableAnswers.add("No"));
  matchFormSettingsSchema.questionsArray
      .add(Question("Defendieron al robot?", "single")
        ..availableAnswers.add("Yes")
        ..availableAnswers.add("No"));
  matchFormSettingsSchema.questionsArray
      .add(Question("Docking en endgame?", "single")
        ..availableAnswers.add("Yes")
        ..availableAnswers.add("No"));
  matchFormSettingsSchema.questionsArray
      .add(Question("Numero de fouls", "int"));
  matchFormSettingsSchema.questionsArray
      .add(Question("Numero de tech fouls", "int"));
  matchFormSettingsSchema.questionsArray
      .add(Question("Links generados", "int"));
  matchFormSettingsSchema.questionsArray
      .add(Question("Puntuación de alianza", "int"));
  matchFormSettingsSchema.questionsArray.add(Question("Ranking points", "int"));
  matchFormSettingsSchema.questionsArray
      .add(Question("Ganó su alianza?", "single")
        ..availableAnswers.add("Yes")
        ..availableAnswers.add("No"));
  matchFormSettingsSchema.questionsArray.add(Question("Comentarios", "string"));

  matchFormSettingsSchema.questionNumber =
      matchFormSettingsSchema.questionsArray.length;

  updateMatchFormSettings(matchFormSettingsSchema);

  PitFormSettingsSchema pitFormsSettingsSchema =
      PitFormSettingsSchema(ObjectId(), 0);
  pitFormsSettingsSchema.questionsArray
      .add(Question("Numero de equipo", "int"));
  pitFormsSettingsSchema.questionsArray
      .add(Question("Nombre de equipo", "string"));
  pitFormsSettingsSchema.questionsArray
      .add(Question("Ciclos del robot", "int"));
  pitFormsSettingsSchema.questionsArray
      .add(Question("Medidas del robot", "string"));
  pitFormsSettingsSchema.questionsArray.add(Question("Colocaciones", "multiple")
    ..availableAnswers.add("Middle Grid")
    ..availableAnswers.add("Left Grid")
    ..availableAnswers.add("Right grid"));
  pitFormsSettingsSchema.questionsArray
      .add(Question("Que hacen en autonomo?", "string"));
  pitFormsSettingsSchema.questionsArray.add(Question("Tipo de juego?", "single")
    ..availableAnswers.add("Defensa")
    ..availableAnswers.add("Ofensivo")
    ..availableAnswers.add("Hibrido"));
  pitFormsSettingsSchema.questionsArray
      .add(Question("Que piezas pueden agarrar?", "single")
        ..availableAnswers.add("Cubos")
        ..availableAnswers.add("Conos")
        ..availableAnswers.add("Ambos"));
  pitFormsSettingsSchema.questionsArray
      .add(Question("Tipo de chassis?", "single")
        ..availableAnswers.add("Mecanum")
        ..availableAnswers.add("Swerve")
        ..availableAnswers.add("Tanque"));
  pitFormsSettingsSchema.questionsArray
      .add(Question("Se pueden balancear en autonomo?", "single")
        ..availableAnswers.add("Yes")
        ..availableAnswers.add("No"));
  pitFormsSettingsSchema.questionsArray.add(Question("Comentarios", "string"));

  pitFormsSettingsSchema.questionNumber =
      pitFormsSettingsSchema.questionsArray.length;

  updatePitFormSettings(pitFormsSettingsSchema);

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
