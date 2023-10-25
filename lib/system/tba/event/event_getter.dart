/// Written by Juan Pablo Gutiérrez
/// 06 - 07 - 2023
/// Gets event-related data

import 'package:axis/system/tba/event/event.dart';
import 'package:axis/system/tba/event/rank.dart';
import 'package:axis/system/tba/system_constants.dart';
import 'package:axis/system/api_manager.dart';
import 'package:axis/system/tba/team/team.dart';

/// Gets the rankings for a specific event
///
/// @param {Event} event Event from which to retrieve rankings
///
/// @return a List of rankings
Future<List<Rank>?>? getEventRankings(Event event) async {
  final url = "$baseTBAURL/event/${event.eventKey}/rankings$authURL";


  print(url);
  final data = await getMapData(url);

  if (data == null) return null;

  final List<Rank> rankingList = [];

  for (Map<String, dynamic> element in data["rankings"]) {
    Rank rank = Rank.fromJson(element);
    rankingList.add(rank);
  }

  return rankingList;
}

/// Gets all of the teams attending a certain event
///
/// @param {Event} event Event from which to retrieve teams
///
/// @return a List of teams
Future<List<Team>?>? getEventTeams(Event event) async {
  final url = "$baseTBAURL/event/${event.eventKey}/teams$authURL";

  final data = await getListData(url);

  if (data == null) return null;

  List<Team> teamsList = [];

  for (Map<String, dynamic> element in data) {
    Team team = Team.fromJson(element);
    teamsList.add(team);
  }

  return teamsList;
}

/// Gets the OPRs for a specific event
///
/// @param {String} eventKey Event key from which to retrieve OPRs
///
/// @return a Map of OPRs
Future<Map?> getEventCOPR(String eventKey) async {
  final url = "$baseTBAURL/event/$eventKey/oprs$authURL";

  final data = await getMapData(url);

  if (data == null) return null;

  return data;
}
