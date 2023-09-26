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
    String question,
    String type, {
    Iterable<String> availableAnswers = const [],
  }) {
    RealmObjectBase.set(this, 'question', question);
    RealmObjectBase.set(this, 'type', type);
    RealmObjectBase.set<RealmList<String>>(
        this, 'availableAnswers', RealmList<String>(availableAnswers));
  }

  Question._();

  @override
  RealmList<String> get availableAnswers =>
      RealmObjectBase.get<String>(this, 'availableAnswers')
          as RealmList<String>;
  @override
  set availableAnswers(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  String get question =>
      RealmObjectBase.get<String>(this, 'question') as String;
  @override
  set question(String value) => RealmObjectBase.set(this, 'question', value);

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
      SchemaProperty('availableAnswers', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('question', RealmPropertyType.string),
      SchemaProperty('type', RealmPropertyType.string),
    ]);
  }
}

class PitFormSettingsSchema extends _PitFormSettingsSchema
    with RealmEntity, RealmObjectBase, RealmObject {
  PitFormSettingsSchema(
    ObjectId id,
    int questionNumber, {
    Iterable<Question> questionsArray = const [],
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'questionNumber', questionNumber);
    RealmObjectBase.set<RealmList<Question>>(
        this, 'questionsArray', RealmList<Question>(questionsArray));
  }

  PitFormSettingsSchema._();

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
  Stream<RealmObjectChanges<PitFormSettingsSchema>> get changes =>
      RealmObjectBase.getChanges<PitFormSettingsSchema>(this);

  @override
  PitFormSettingsSchema freeze() =>
      RealmObjectBase.freezeObject<PitFormSettingsSchema>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(PitFormSettingsSchema._);
    return const SchemaObject(ObjectType.realmObject, PitFormSettingsSchema,
        'PitFormSettingsSchema', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('questionNumber', RealmPropertyType.int),
      SchemaProperty('questionsArray', RealmPropertyType.object,
          linkTarget: 'Question', collectionType: RealmCollectionType.list),
    ]);
  }
}

class PitSchema extends _PitSchema
    with RealmEntity, RealmObjectBase, RealmObject {
  PitSchema(
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

  PitSchema._();

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
  Stream<RealmObjectChanges<PitSchema>> get changes =>
      RealmObjectBase.getChanges<PitSchema>(this);

  @override
  PitSchema freeze() => RealmObjectBase.freezeObject<PitSchema>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(PitSchema._);
    return const SchemaObject(ObjectType.realmObject, PitSchema, 'PitSchema', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('answers', RealmPropertyType.mixed,
          optional: true, collectionType: RealmCollectionType.list),
      SchemaProperty('questions', RealmPropertyType.mixed,
          optional: true, collectionType: RealmCollectionType.list),
    ]);
  }
}
