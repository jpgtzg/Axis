/// Written by Juan Pablo Gutiérrez
/// 26 - 07 - 2023

import 'package:axis/system/api_manager.dart';
import 'package:axis/system/tba/tba_constants.dart';

import '../tba/event/event.dart';
import 'epa.dart';

Future<EPA?> getEPA(String teamKey, String eventKey) async {
  final url = "$baseSTABURL/team_event/$teamKey/$eventKey";

  final data = await getMapData(url);

  if (data == null) return null;

  return EPA.fromJson(data);
}

Future<EPA?> getFullEPA(String teamKey) async {
  final url = "$baseSTABURL/team_year/$teamKey/2023";

  final data = await getMapData(url);

  if (data == null) return null;

  return EPA.fromJson(data);
}
