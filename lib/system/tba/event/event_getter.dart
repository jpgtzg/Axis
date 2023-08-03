/// Written by Juan Pablo Gutiérrez
/// 06 - 07 - 2023
/// Gets event-related data

import 'package:axis/system/tba/event/event.dart';
import 'package:axis/system/tba/event/rank.dart';
import 'package:axis/system/tba/system_constants.dart';
import 'package:axis/system/api_manager.dart';
import 'package:axis/system/tba/team/team.dart';
import 'package:axis/system/tba/team/team_getter.dart';

/// Gets the rankings for a specific event
///
/// @param {Event} event Event from which to retrieve rankings
///
/// @return a List of rankings
Future<List<Rank>?>? getEventRankings(Event event) async {
  final url = "$baseTBAURL/event/${event.eventKey}/rankings$authURL";

  final data = await getMapData(url);

  if (data == null) return null;

  final List<Rank> rankingList = [];

  for (Map<String, dynamic> element in data["rankings"]) {
    Rank rank = Rank.fromJson(element);
    rankingList.add(rank);
  }

  return rankingList;
}

Future<List<Team>?>? getEventTeams(Event event) async {
  final url = "$baseTBAURL/event/${event.eventKey}/teams$authURL";

  final data = await getListData(url);

  if (data == null) return null;

  List<Team> teamsList = [];

  for (Map<String, dynamic> element in data) {
    Team team = Team.fromJson(element);
    teamsList.add(team);
  }

  teamsList = await getListURL(teamsList);

  teamsList = await getListCOPR(teamsList, event.eventKey);

  return teamsList;
}

Future<List<Team>> getListURL(List<Team> teamsLists) async {
  final year = DateTime.now().year.toString();
  for (var element in teamsLists) {
    String teamURL = await getImageUrl(element.teamNumber, year);
    element.setImgUrl(teamURL);
  }

  return teamsLists;
}

Future<List<Team>> getListCOPR(List<Team> teamsLists, String eventKey) async {
  Map? coprList = await getEventCOPR(eventKey);

  if (coprList == null) return teamsLists;

  for (var team in teamsLists) {
    team.setOpr(coprList["oprs"]["frc${team.teamNumber}"]);
    team.setDpr(coprList["dprs"]["frc${team.teamNumber}"]);
    team.setCcwm(coprList["ccwms"]["frc${team.teamNumber}"]);
  }

  return teamsLists;
}

Future<Map?> getEventCOPR(String eventKey) async {
  final url = "$baseTBAURL/event/$eventKey/oprs$authURL";

  final data = await getMapData(url);

  if (data == null) return null;

  return data;
}
