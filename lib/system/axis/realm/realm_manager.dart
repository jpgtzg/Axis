/// Written by Juan Pablo Gutiérrez
/// 3 - 08 - 2023

import 'package:axis/system/api_manager.dart';
import 'package:axis/system/axis/realm/realm_models.dart';
import 'package:realm/realm.dart';

import '../../tba/system_constants.dart';

Realm? realm;

void setRealm(Configuration realmConfig) async {
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
}

void write(var addFunction) async {
  if (realm == null) setClient();
  realm?.write(() => addFunction);
}

Future<bool> isDeviceOnline() async {
  //TODO ADD LOGIC

  return true;
}
