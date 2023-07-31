import 'package:realm/realm.dart';

part '_MatchSchema.g.dart';

// NOTE: These Realm models are private and therefore should be copied into the same .dart file.

@RealmModel()
class _MatchSchema {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  late List<RealmValue> answers;

  late List<RealmValue> questions;
}
