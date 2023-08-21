import 'package:realm/realm.dart';

part 'realm_models.g.dart';

@RealmModel()
class _MatchFormSettingsSchema {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  late int questionNumber;

  late List<_Question> questionsArray;
}


@RealmModel()
class _MatchSchema {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  late List<RealmValue> answers;

  late List<RealmValue> questions;
}

@RealmModel(ObjectType.embeddedObject)
class _Question {
  late String question;
  
  late String type;
}
