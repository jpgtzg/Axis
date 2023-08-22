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
      clientResetHandler:
          ManualRecoveryHandler((clientResetError) => print(clientResetError)));

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
    var setting = fullList;

    realm!.write(() {
      setting.questionNumber = matchFormSettings.questionNumber;
      setting.questionsArray.clear();
      setting.questionsArray.addAll(matchFormSettings.questionsArray);
    });
  }
}

Future<MatchFormSettingsSchema> getMatchFormSettings() async {
  if (realm == null) {
    await setRealm();
  }

  return realm!.all<MatchFormSettingsSchema>().first;
}

Future<Object?> get(String schemaType) async {
  if (realm == null) {
    await setRealm();
  }

  switch (schemaType) {
    case 'MatchSchema':
      return realm!.all<MatchSchema>();
    case 'MatchFormSettingsSchema':
      return realm!.all<MatchFormSettingsSchema>().first;
    default:
      return null;
  }
}

Future<bool> isDeviceOnline() async {
  //TODO ADD LOGIC

  return true;
}
