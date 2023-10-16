/// Written by Juan Pablo Gutiérrez
/// 3 - 08 - 2023

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
        MatchSchema.schema,
        PitSchema.schema,
        Question.schema,
        MatchFormSettingsSchema.schema,
        PitFormSettingsSchema.schema,
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
      mutableSubscriptions.add(realm!.all<MatchSchema>(), name: 'getMatchData');
    });
  }

  final userMatchFormSub = realm!.subscriptions.findByName('getMatchFormsData');
  if (userMatchFormSub == null) {
    realm!.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(realm!.all<MatchFormSettingsSchema>(),
          name: 'getMatchFormsData');
    });
  }

  final userPitSub = realm!.subscriptions.findByName('getPitData');
  if (userPitSub == null) {
    realm!.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(realm!.all<PitSchema>(), name: 'getPitData');
    });
  }

  final userPitFormSub = realm!.subscriptions.findByName('getPitFormsData');
  if (userPitFormSub == null) {
    realm!.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(realm!.all<PitFormSettingsSchema>(),
          name: 'getPitFormsData');
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

Future<bool> isDeviceOnline() async {
  //TODO ADD LOGIC

  return true;
}

Future<List<MatchSchema>> getMatchData(Team team, Event event) async {
  if (realm == null) {
    await setRealm();
  }

  final results = realm!.query<MatchSchema>(
      'teamNumber == "${team.teamNumber}" AND eventKey == "${event.eventKey}"');

  return List.from(results);
}

Future<List<PitSchema>> getPitData(Team team, Event event) async {
  if (realm == null) {
    await setRealm();
  }
  final results = realm!.query<PitSchema>(
      'teamNumber == "${team.teamNumber}" AND eventKey == "${event.eventKey}"');

  return List.from(results);
}
