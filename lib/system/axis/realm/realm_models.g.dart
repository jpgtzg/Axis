// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realm_models.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class MatchFormSettingsSchema extends _MatchFormSettingsSchema
    with RealmEntity, RealmObjectBase, RealmObject {
  MatchFormSettingsSchema(
    ObjectId id,
    int questionNumber, {
    Iterable<Question> questionsArray = const [],
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'questionNumber', questionNumber);
    RealmObjectBase.set<RealmList<Question>>(
        this, 'questionsArray', RealmList<Question>(questionsArray));
  }

  MatchFormSettingsSchema._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  int get questionNumber =>
      RealmObjectBase.get<int>(this, 'questionNumber') as int;
  @override
  set questionNumber(int value) =>
      RealmObjectBase.set(this, 'questionNumber', value);

  @override
  RealmList<Question> get questionsArray =>
      RealmObjectBase.get<Question>(this, 'questionsArray')
          as RealmList<Question>;
  @override
  set questionsArray(covariant RealmList<Question> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<MatchFormSettingsSchema>> get changes =>
      RealmObjectBase.getChanges<MatchFormSettingsSchema>(this);

  @override
  MatchFormSettingsSchema freeze() =>
      RealmObjectBase.freezeObject<MatchFormSettingsSchema>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(MatchFormSettingsSchema._);
    return const SchemaObject(ObjectType.realmObject, MatchFormSettingsSchema,
        'MatchFormSettingsSchema', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('questionNumber', RealmPropertyType.int),
      SchemaProperty('questionsArray', RealmPropertyType.object,
          linkTarget: 'Question', collectionType: RealmCollectionType.list),
    ]);
  }
}

class MatchSchema extends _MatchSchema
    with RealmEntity, RealmObjectBase, RealmObject {
  MatchSchema(
    ObjectId id, {
    Iterable<RealmValue> answers = const [],
    Iterable<RealmValue> questions = const [],
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set<RealmList<RealmValue>>(
        this, 'answers', RealmList<RealmValue>(answers));
    RealmObjectBase.set<RealmList<RealmValue>>(
        this, 'questions', RealmList<RealmValue>(questions));
  }

  MatchSchema._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  RealmList<RealmValue> get answers =>
      RealmObjectBase.get<RealmValue>(this, 'answers') as RealmList<RealmValue>;
  @override
  set answers(covariant RealmList<RealmValue> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<RealmValue> get questions =>
      RealmObjectBase.get<RealmValue>(this, 'questions')
          as RealmList<RealmValue>;
  @override
  set questions(covariant RealmList<RealmValue> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<MatchSchema>> get changes =>
      RealmObjectBase.getChanges<MatchSchema>(this);

  @override
  MatchSchema freeze() => RealmObjectBase.freezeObject<MatchSchema>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(MatchSchema._);
    return const SchemaObject(
        ObjectType.realmObject, MatchSchema, 'MatchSchema', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('answers', RealmPropertyType.mixed,
          optional: true, collectionType: RealmCollectionType.list),
      SchemaProperty('questions', RealmPropertyType.mixed,
          optional: true, collectionType: RealmCollectionType.list),
    ]);
  }
}

class Question extends _Question
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  Question(
    String input,
    String type,
  ) {
    RealmObjectBase.set(this, 'input', input);
    RealmObjectBase.set(this, 'type', type);
  }

  Question._();

  @override
  String get input => RealmObjectBase.get<String>(this, 'input') as String;
  @override
  set input(String value) => RealmObjectBase.set(this, 'input', value);

  @override
  String get type => RealmObjectBase.get<String>(this, 'type') as String;
  @override
  set type(String value) => RealmObjectBase.set(this, 'type', value);

  @override
  Stream<RealmObjectChanges<Question>> get changes =>
      RealmObjectBase.getChanges<Question>(this);

  @override
  Question freeze() => RealmObjectBase.freezeObject<Question>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Question._);
    return const SchemaObject(ObjectType.embeddedObject, Question, 'Question', [
      SchemaProperty('input', RealmPropertyType.string),
      SchemaProperty('type', RealmPropertyType.string),
    ]);
  }
}
