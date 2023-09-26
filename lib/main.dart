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

  PitFormSettingsSchema schema = PitFormSettingsSchema(ObjectId(), 0);
  schema.questionsArray.add(Question("Numero de equipo", "int"));
  schema.questionsArray.add(Question("Nombre de equipo", "string"));
  schema.questionsArray.add(Question("Ciclos de equipo", "int"));
  schema.questionsArray.add(Question("Colocaciones", "multiple")
    ..availableAnswers.add("Middle Grid")
    ..availableAnswers.add("Left Grid")
    ..availableAnswers.add("Right grid"));

  schema.questionNumber = schema.questionsArray.length;

  updatePitFormSettings(schema);
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
