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
class _MatchSchema {
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
class _PitSchema {
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
  late int questionIndex;
  late String title;
  late String type;
}
