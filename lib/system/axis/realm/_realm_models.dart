/// Written by Juan Pablo Gutiérrez
/// 5 - 09 - 2023
/// Manages all Realm Models

import 'package:realm/realm.dart';

part '_realm_models.g.dart';

@RealmModel()
class _MatchFormSettings {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  late List<_Question> questionsArray;
}

@RealmModel(ObjectType.embeddedObject)
class _Question {
  String? input;

  String? type;
}


@RealmModel()
@MapTo('match')
class _MatchSchema {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late List<RealmValue> answers;

  late List<RealmValue> questions;
}
