/// Written by Juan Pablo Gutiérrez
/// 04 - 07 - 2023

/// Represents an entire event
class Event {
  final String name;

  final String startDate;
  final String endDate;
  final String eventType;
  final String eventKey;

  Event(
      {required this.name,
      required this.startDate,
      required this.endDate,
      required this.eventType,
      required this.eventKey});

  factory Event.fromJson(Map<String, dynamic> jsonEvent) {
    return Event(
        name: jsonEvent["name"] as String,
        startDate: jsonEvent["start_date"] as String,
        endDate: jsonEvent["end_date"] as String,
        eventType: jsonEvent["event_type_string"] as String,
        eventKey: jsonEvent["key"] as String);
  }
}
