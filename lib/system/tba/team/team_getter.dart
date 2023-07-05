/// Written by Juan Pablo Gutiérrez
/// Gets team-related data
import 'package:axis/system/tba/team/event.dart';

import '../tba_constants.dart';
import '../tba_manager.dart';

/// Gets events an specific team assisted on a specific season (year)
///
/// @param {int} year Year or season
/// @param {bool} order Orders the list to closest ones first
///
/// @return An event List, might be null if no data was obtained
Future<List<Event>?> getTeamEvents(int year, bool order) async {
  final url =
      "$baseURL/team/frc$teamNum/events/${year.toString()}?X-TBA-Auth-Key=$AUTHKEY";

  final data = await getData(url);

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
