import 'package:realm/realm.dart';

part 'realm_models.g.dart';

/// Represents the schema for the match form questions
@RealmModel()
class _MatchFormSettingsSchema {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  late int questionNumber;

  late List<_Question> questionsArray;
}

/// Represents the schema for the match form answers
@RealmModel()
class _MatchDataSchema {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late List<RealmValue> answers;
  late String eventKey;
  late List<RealmValue> questions;
  late int teamNumber;
}

/// Represents a question in the form
@RealmModel(ObjectType.embeddedObject)
class _Question {
  late List<String> availableAnswers;

  late String question;

  late String type;
}

/// Represents the schema for the pit form questions
@RealmModel()
class _PitFormSettingsSchema {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  late int questionNumber;

  late List<_Question> questionsArray;
}

/// Represents the schema for the pit form answers
@RealmModel()
class _PitDataSchema {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late List<RealmValue> answers;
  late String eventKey;
  late List<RealmValue> questions;
  late int teamNumber;
}

/// Represents the schema for the match dashboard
@RealmModel()
class _MatchDashboardSchema {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late List<_DashboardWidget> dashboardWidgets;
  late int widgetNumber;
}

/// Represents the schema for the pit dashboard
@RealmModel()
class _PitDashboardSchema {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late List<_DashboardWidget> dashboardWidgets;
  late int widgetNumber;
}

/// Represents a widget on the dashboard
@RealmModel(ObjectType.embeddedObject)
class _DashboardWidget {
  late String title;
  late String type;

  late _LineTableWidgetData? lineTableData;
  late _PieGraphWidgetData? pieGraphData;
}
/// Represents data for a table widget
@RealmModel(ObjectType.embeddedObject)
class _LineTableWidgetData {
  // Add properties specific to table widgets here.
  // You can define the schema for table data as needed.
  late int columnIndex;
  late String columnTitle;
  late int rowIndex;
}

/// Represents data for a graph widget
@RealmModel(ObjectType.embeddedObject)
class _PieGraphWidgetData {
  // Add properties specific to graph widgets here.
  // You can define the schema for graph data as needed.
  late int percentageIndex;
  late int titleIndex;
  late String title;
}
