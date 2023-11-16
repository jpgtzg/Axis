/// Written by Juan Pablo Gutiérrez
/// 3 - 08 - 2023

import 'package:axis/constants.dart';
import 'package:axis/system/axis/realm/realm_models.dart';
import 'package:axis/system/tba/event/event.dart';
import 'package:axis/system/tba/team/team.dart';
import 'package:realm/realm.dart';

import '../../tba/system_constants.dart';

Realm? realm;

/// Initializes the realm with an anonymous configuration
Future<bool> setRealm() async {
  final appConfig = AppConfiguration(appID);
  final app = App(appConfig);

  final user = await app.logIn(Credentials.anonymous());
  final realmConfig = Configuration.flexibleSync(
      user,
      [
        MatchDataSchema.schema,
        PitDataSchema.schema,
        Question.schema,
        MatchFormSettingsSchema.schema,
        PitFormSettingsSchema.schema,
        MatchDashboardSchema.schema,
        PitDashboardSchema.schema,
        DashboardWidget.schema,
        LineTableWidgetData.schema,
        PieGraphWidgetData.schema,
        TextWidgetData.schema
      ],
      clientResetHandler: const DiscardUnsyncedChangesHandler());

  if (await isDeviceOnline()) {
    realm = await Realm.open(realmConfig);
  } else {
    realm = Realm(realmConfig);
  }

  final userMatchSub = realm!.subscriptions.findByName('getMatchData');
  if (userMatchSub == null) {
    realm!.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(realm!.all<MatchDataSchema>(),
          name: 'getMatchData');
    });
  }

  final userMatchFormSub = realm!.subscriptions.findByName('getMatchFormsData');
  if (userMatchFormSub == null) {
    realm!.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(realm!.all<MatchFormSettingsSchema>(),
          name: 'getMatchFormsData');
    });
  }

  final userMatchDashboardSub =
      realm!.subscriptions.findByName('getMatchDashboardData');
  if (userMatchDashboardSub == null) {
    realm!.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(realm!.all<MatchDashboardSchema>(),
          name: 'getMatchDashboardData');
    });
  }

  final userPitSub = realm!.subscriptions.findByName('getPitData');
  if (userPitSub == null) {
    realm!.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(realm!.all<PitDataSchema>(), name: 'getPitData');
    });
  }

  final userPitFormSub = realm!.subscriptions.findByName('getPitFormsData');
  if (userPitFormSub == null) {
    realm!.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(realm!.all<PitFormSettingsSchema>(),
          name: 'getPitFormsData');
    });
  }

  final userPitDashboardSub =
      realm!.subscriptions.findByName('getPitDashboardData');
  if (userPitDashboardSub == null) {
    realm!.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(realm!.all<PitDashboardSchema>(),
          name: 'getPitDashboardData');
    });
  }

  return realm == null;
}

void write(RealmObject schemaObject) async {
  if (realm == null) {
    await setRealm();
  }
  realm!.write(() {
    realm!.add(schemaObject);
  });
}

void updateMatchFormSettings(MatchFormSettingsSchema matchFormSettings) async {
  var fullList = await getMatchFormSettings();

  if (fullList != null) {
    realm!.write(() {
      fullList.questionNumber = matchFormSettings.questionNumber;
      fullList.questionsArray.clear();
      fullList.questionsArray.addAll(matchFormSettings.questionsArray);
    });
  } else {
    realm!.write(() {
      realm!.add(matchFormSettings);
    });
  }
}

Future<MatchFormSettingsSchema?>? getMatchFormSettings() async {
  if (realm == null) {
    await setRealm();
  }
  try {
    return realm!.all<MatchFormSettingsSchema>().first;
  } catch (e) {
    return null;
  }
}

void updatePitFormSettings(PitFormSettingsSchema pitFormSettings) async {
  var fullList = await getPitFormSettings();

  if (fullList != null) {
    realm!.write(() {
      fullList.questionNumber = pitFormSettings.questionNumber;
      fullList.questionsArray.clear();
      fullList.questionsArray.addAll(pitFormSettings.questionsArray);
    });
  } else {
    realm!.write(() {
      realm!.add(pitFormSettings);
    });
  }
}

Future<PitFormSettingsSchema?>? getPitFormSettings() async {
  if (realm == null) {
    await setRealm();
  }

  try {
    return realm!.all<PitFormSettingsSchema>().first;
  } catch (e) {
    return null;
  }
}

void updateQuestion(Question updatedQuestion, int index, Origin origin) async {
  if (realm == null) {
    await setRealm();
  }

  switch (origin) {
    case Origin.match:
      var fullList = await getMatchFormSettings();

      if (fullList != null) {
        try {
          realm!.write(() {
            fullList.questionsArray[index].question = updatedQuestion.question;
            fullList.questionsArray[index].type = updatedQuestion.type;
            fullList.questionsArray[index].availableAnswers.clear();
            fullList.questionsArray[index].availableAnswers
                .addAll(updatedQuestion.availableAnswers);
          });
        } catch (e) {
          realm!.write(() {
            fullList.questionsArray.add(updatedQuestion);
            fullList.questionNumber = fullList.questionsArray.length;
          });
        }
      }
      break;
    case Origin.pit:
      var fullList = await getPitFormSettings();

      if (fullList != null) {
        try {
          realm!.write(() {
            fullList.questionsArray[index].question = updatedQuestion.question;
            fullList.questionsArray[index].type = updatedQuestion.type;
            fullList.questionsArray[index].availableAnswers.clear();
            fullList.questionsArray[index].availableAnswers
                .addAll(updatedQuestion.availableAnswers);
          });
        } catch (e) {
          realm!.write(() {
            fullList.questionsArray.add(updatedQuestion);
            fullList.questionNumber = fullList.questionsArray.length;
          });
        }
      }
      break;
    default:
  }
}

Future<bool> isDeviceOnline() async {
  //TODO ADD LOGIC

  return true;
}

/// Returns the match data for a given team and event
///
/// @param team The team to get the data for
///
/// @param event The event to get the data for
///
/// @return A list of match data for the given team and event
Future<List<MatchDataSchema>> getMatchData(Team team, Event event) async {
  if (realm == null) {
    await setRealm();
  }

  final results = realm!.query<MatchDataSchema>(
      'teamNumber == "${team.teamNumber}" AND eventKey == "${event.eventKey}"');

  return List.from(results);
}

/// Returns the pit data for a given team and event
///
/// @param team The team to get the data for
/// @param event The event to get the data for
///
/// @return A list of pit data for the given team and event
Future<List<PitDataSchema>> getPitData(Team team, Event event) async {
  if (realm == null) {
    await setRealm();
  }
  final results = realm!.query<PitDataSchema>(
      'teamNumber == "${team.teamNumber}" AND eventKey == "${event.eventKey}"');

  return List.from(results);
}

/// Returns the match dashboard data for a given team and event

Future<MatchDashboardSchema?>? getMatchDashboardSettings() async {
  if (realm == null) {
    await setRealm();
  }

  try {
    return realm!.all<MatchDashboardSchema>().first;
  } catch (e) {
    return null;
  }
}

Future<PitDashboardSchema?>? getPitDashboardSettings() async {
  if (realm == null) {
    await setRealm();
  }

  try {
    return realm!.all<PitDashboardSchema>().first;
  } catch (e) {
    return null;
  }
}

void updateMatchDashboardSetting(
    MatchDashboardSchema matchDashboardSettings) async {
  var fullList = await getMatchDashboardSettings();

  if (fullList != null) {
    realm!.write(() {
      fullList.widgetNumber = matchDashboardSettings.widgetNumber;
      fullList.dashboardWidgets.clear();
      fullList.dashboardWidgets.addAll(matchDashboardSettings.dashboardWidgets);
    });
  } else {
    realm!.write(() {
      realm!.add(matchDashboardSettings);
    });
  }
}

void updatePitDashboardSetting(PitDashboardSchema pitDashboardSettings) async {
  var fullList = await getPitDashboardSettings();

  if (fullList != null) {
    realm!.write(() {
      fullList.widgetNumber = pitDashboardSettings.widgetNumber;
      fullList.dashboardWidgets.clear();
      fullList.dashboardWidgets.addAll(pitDashboardSettings.dashboardWidgets);
    });
  } else {
    realm!.write(() {
      realm!.add(pitDashboardSettings);
    });
  }
}
