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

  MatchFormSettingsSchema matchFormSettingsSchema = MatchFormSettingsSchema(ObjectId(), 26);
  
  matchFormSettingsSchema.questionsArray.add(Question("Numero de equipo", "String input")); 
  matchFormSettingsSchema.questionsArray.add(Question("Nombre de equipo", "String input")); 
  matchFormSettingsSchema.questionsArray.add(Question("Puntos de equipo", "Int input")); 
  matchFormSettingsSchema.questionsArray.add(Question("Puntos en auto de equipo", "Int input")); 
  matchFormSettingsSchema.questionsArray.add(Question("Puntos en teleop de equipo", "Int input")); 
  matchFormSettingsSchema.questionsArray.add(Question("Puntos en endgame de equipo", "Int input")); 
  matchFormSettingsSchema.questionNumber = matchFormSettingsSchema.questionsArray.length;

  updateMatchForm(matchFormSettingsSchema);

/*   write(matchFormSettingsSchema);
 */
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
