/// Written by Juan Pablo Gutiérrez
/// 23 - 05 - 2023
///
/// Main file

import 'package:axis/screens/home_screen.dart';
import 'package:axis/system/api_manager.dart';
import 'package:axis/system/axis/realm/_MatchSchema.dart';
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
    [MatchSchema.schema],
  );

  late Realm realm;
  if (await isDeviceOnline()) {
    realm = await Realm.open(realmConfig);
  } else {
    realm = Realm(realmConfig);
  }
  // Check if the subscription already exists before adding
  /*  final userTodoSub = realm.subscriptions.findByName('getMatchData');
  if (userTodoSub == null) {
    realm.subscriptions.update((mutableSubscriptions) {
      // server-side rules ensure user only downloads their own Todos
      mutableSubscriptions.add(realm.all<MatchSchema>(), name: 'getMatchData');
    });
  } */

  final match = MatchSchema(
    ObjectId(),
  );

  realm.write(() {
    realm.add(match);
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
