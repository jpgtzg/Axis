/// Written by Juan Pablo Gutiérrez
/// 3 - 08 - 2023

import 'package:axis/system/axis/realm/realm_models.dart';
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
        Question.schema,
        MatchFormSettingsSchema.schema,
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

  final userFormsSub = realm!.subscriptions.findByName('getFormsData');
  if (userFormsSub == null) {
    realm!.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(realm!.all<MatchFormSettingsSchema>(),
          name: 'getFormsData');
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

void updateMatchForm(MatchFormSettingsSchema matchFormSettings) async {
  var fullList = await getMatchFormSettings();

  if (fullList != null) {
    realm!.write(() {
      fullList.questionNumber = matchFormSettings.questionNumber;
      fullList.questionsArray.clear();
      fullList.questionsArray.addAll(matchFormSettings.questionsArray);
    });
  }
}

Future<MatchFormSettingsSchema> getMatchFormSettings() async {
  if (realm == null) {
    await setRealm();
  }

  return realm!.all<MatchFormSettingsSchema>().first;
}

Future<bool> isDeviceOnline() async {
  //TODO ADD LOGIC

  return true;
}
