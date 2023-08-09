import 'package:realm/realm.dart';
part '_match.g.dart';

@RealmModel()
@MapTo('match')
class _MatchSchema {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late List<RealmValue> answers;
 
  late List<RealmValue> questions;
}