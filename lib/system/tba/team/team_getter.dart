/// Written by Juan Pablo Gutiérrez
/// Gets team-related data
import 'dart:math';

import 'package:axis/system/tba/event/event.dart';
import 'package:axis/system/tba/team/match.dart';

import '../tba_constants.dart';
import '../tba_manager.dart';

/// Gets events an specific team assisted on a specific season (year)
///
/// @param {int} year Year or season
/// @param {bool} order Orders the list to closest ones first
///
/// @return An event List, might be null if no data was obtained
Future<List<Event>?> getTeamEvents(int year, bool order) async {
  final url = "$baseURL/team/frc$teamNum/events/${year.toString()}$authURL";

  final data = await getListData(url);

  if (data == null) return null;

  final List<Event> eventList = [];

  for (Map<String, dynamic> element in data) {
    Event event = Event.fromJson(element);
    eventList.add(event);
  }

  /// Sorts the list by time of year
  if (order) {
    // Applies selection sort
    for (var i = 0; i < eventList.length - 1; i++) {
      int minDate = i;
      for (var j = i + 1; j < eventList.length; j++) {
        if (!(DateTime.parse(eventList[minDate].startDate)
            .isAfter(DateTime.parse(eventList[j].startDate)))) {
          minDate = j;
        }
      }

      // Swaps dates
      var tempEvent = eventList[minDate];
      eventList[minDate] = eventList[i];
      eventList[i] = tempEvent;
    }
  }

  return eventList;
}

/// Gets events an a List of matches for a specific event
///
/// @param {Event} event Event from which to list the matches
///
/// @return A Match List, might be null if no data was obtained
Future<List<FRCMatch>?> getTeamMatches(Event event) async {
  final url =
      "$baseURL/team/frc$teamNum/event/${event.eventKey}/matches$authURL";

  final data = await getListData(url);

  if (data == null) return null;

  final List<FRCMatch> matchlist = [];

  for (Map<String, dynamic> element in data) {
    FRCMatch event = FRCMatch.fromJson(element);
    matchlist.add(event);
  }

  // Applies selection sort to sort match numbers by ascending order

  List<FRCMatch> finalList = [];
  List<FRCMatch> qualsList = [];
  List<FRCMatch> semisList = [];

  for (var element in matchlist) {
    if (element.matchNumType.startsWith("F")) {
      finalList.add(element);
    } else if (element.matchNumType.startsWith("Q")) {
      qualsList.add(element);
    } else if (element.matchNumType.startsWith("S")) {
      semisList.add(element);
    }
  }

  matchlist.clear();
  matchlist.addAll(matchSelectionSort(qualsList, false));
  matchlist.addAll(matchSelectionSort(semisList, false));
  matchlist.addAll(matchSelectionSort(finalList, true));

  return matchlist;
}

/// Applies selection sort to sort the match by type and by number
///
/// @return A sorted list of matches
List<FRCMatch> matchSelectionSort(List<FRCMatch> list, bool finals) {
  if (finals) {
    for (var i = 0; i < list.length - 1; i++) {
      int minNum = i;
      for (var j = i + 1; j < list.length; j++) {
        if (int.parse(list[minNum].matchNumType.substring(6, 7)) >
            int.parse(list[j].matchNumType.substring(6, 7))) {
          minNum = j;
        }
      }

      // Swaps dates
      var tempEvent = list[minNum];
      list[minNum] = list[i];
      list[i] = tempEvent;
    }
  } else {
    for (var i = 0; i < list.length - 1; i++) {
      int minNum = i;
      for (var j = i + 1; j < list.length; j++) {
        if (int.parse(list[minNum].matchNumType.substring(5)) >
            int.parse(list[j].matchNumType.substring(5))) {
          minNum = j;
        }
      }

      // Swaps dates
      var tempEvent = list[minNum];
      list[minNum] = list[i];
      list[i] = tempEvent;
    }
  }

  return list;
}

/// Gets image media from team
///
/// @param {String} teamKey Key of the team to retrieve data from
/// @param {String} year Year from which to retrieve data from
///
/// @return String with image url
Future<String> getImageUrl(String teamKey, String year) async {
  final url = "$baseURL/team/frc$teamKey/media/$year$authURL";

  final List<dynamic>? data = await getListData(url);

  if (data == null)
    return "https://4.bp.blogspot.com/-3uyUTVhvMuo/WjAGEF31DhI/AAAAAAAAAEU/6EurwWD_ebc8o5bFfWoclQuhjSm1Aj5sQCK4BGAYYCw/s1600/FRC_Logo.svgS.jpg";

  String imageUrl;
  while (true) {
    if (data.length > 1) {
      int randomIndex = Random().nextInt(data.length - 1) + 1;
      imageUrl = data[randomIndex]['direct_url'];
    } else {
      imageUrl =
          'https://4.bp.blogspot.com/-3uyUTVhvMuo/WjAGEF31DhI/AAAAAAAAAEU/6EurwWD_ebc8o5bFfWoclQuhjSm1Aj5sQCK4BGAYYCw/s1600/FRC_Logo.svgS.jpg';
    }

    if (imageUrl.contains('imgur') || imageUrl.contains('blogspot')) {
      break;
    }
  }

  return imageUrl;
}
