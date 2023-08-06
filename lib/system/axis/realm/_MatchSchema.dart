// ignore: file_names
import 'package:realm/realm.dart';

part '_MatchSchema.g.dart';

@RealmModel()
class _MatchSchema {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  @MapTo("answers")
  late List<RealmValue> answers;

  @MapTo("questions")
  late List<RealmValue> questions;
}
