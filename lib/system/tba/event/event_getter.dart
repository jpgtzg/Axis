import 'package:axis/system/tba/event/event.dart';
import 'package:axis/system/tba/event/rank.dart';
import 'package:axis/system/tba/tba_constants.dart';
import 'package:axis/system/tba/tba_manager.dart';

/// Written by Juan Pablo Gutiérrez
/// 06 - 07 - 2023
/// Gets event-related data

/// Gets the rankings for a specific event
///
/// @param {Event} event Event from which to retrieve rankings
///
/// @return a List of rankings
Future<List<Rank>?>? getEventRankings(Event event) async {
  final url = "$baseURL/event/${event.eventKey}/rankings$authURL";

  final data = await getMapData(url);
  
  if (data == null) return null;

  final List<Rank> rankingList = [];

  for (Map<String, dynamic> element in data["rankings"]) {
    Rank rank = Rank.fromJson(element);
    rankingList.add(rank);
  }

  return rankingList;
}

Future<List<dynamic>?>? getEventStatus(Event event) async {
  return null;
}