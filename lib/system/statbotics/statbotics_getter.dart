/// Written by Juan Pablo Gutiérrez
/// 26 - 07 - 2023

import 'package:axis/system/api_manager.dart';
import 'package:axis/system/tba/system_constants.dart';

import 'epa.dart';

/// Get the Expected Point Added (EPA) of a team in a specific event
///
/// [teamKey] is the key of the team
/// [eventKey] is the key of the event
Future<EPA?> getEPA(String teamKey, String eventKey) async {
  final url = "$baseSTABURL/team_event/$teamKey/$eventKey";

  final data = await getMapData(url);

  if (data == null) return null;

  return EPA.fromJson(data);
}
