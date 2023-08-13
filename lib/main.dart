/// Written by Juan Pablo Gutiérrez
/// 23 - 05 - 2023
///
/// Main file

import 'package:axis/screens/home_screen.dart';
import 'package:axis/system/api_manager.dart';
import 'package:axis/system/axis/realm/realm_models.dart';
import 'package:axis/system/axis/realm/realm_manager.dart';
import 'package:axis/system/tba/system_constants.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

import 'constants.dart';

void main() async {
  setClient();

  final appConfig = AppConfiguration(appID);
  final app = App(appConfig);

  final user = await app.logIn(Credentials.anonymous());
  final realmConfig = Configuration.flexibleSync(
    user,
    [
      MatchSchema.schema,
      Question.schema,
      MatchFormSettingsSchema.schema,

    ],clientResetHandler: ManualRecoveryHandler((clientResetError) => print(clientResetError))
  );

  late Realm realm;
  if (await isDeviceOnline()) {
    realm = await Realm.open(realmConfig);
  } else {
    realm = Realm(realmConfig);
  }
  /* final match = MatchSchema(ObjectId());

  match.answers.add(const RealmValue.string("Ans 2"));
  match.questions.add(const RealmValue.string("Ques 2"));

  final matchSub = realm.subscriptions.findByName('getMatchSchema');
  if (matchSub == null) {
    realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(realm.all<MatchSchema>(),
          name: 'getMatchSchema');
    });
  }
 */
  final matchSettingsSub =
      realm.subscriptions.findByName('getMatchFormsSetting');
  if (matchSettingsSub == null) {
    realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(realm.all<MatchFormSettingsSchema>(),
          name: 'getMatchFormsSetting');
    });
  }

  final matchFormSettings = MatchFormSettingsSchema(ObjectId());

  matchFormSettings.questionsArray.add(Question("Input", "Numero de equipo"));

  realm.write(() {
    realm.add(matchFormSettings);
  });

/*   var r = await getTeamEvents(2023, true);
 */ /* var x = await getFullEPA("4635");
  print(x!.end); */
/*   r!.forEach((element) => print(element.name));
 */
/*   getImageUrl(1678.toString(), 2022.toString());
 */
  runApp(const AxisApp());
}

class AxisApp extends StatelessWidget {
  const AxisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Axis Scouting',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: paleteBlue),
      ),
      home: const HomeScreen(),
    );
  }
}
