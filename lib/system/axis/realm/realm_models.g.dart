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

class MatchDataSchema extends _MatchDataSchema
    with RealmEntity, RealmObjectBase, RealmObject {
  MatchDataSchema(
    ObjectId id,
    String eventKey,
    int teamNumber, {
    Iterable<RealmValue> answers = const [],
    Iterable<RealmValue> questions = const [],
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'eventKey', eventKey);
    RealmObjectBase.set(this, 'teamNumber', teamNumber);
    RealmObjectBase.set<RealmList<RealmValue>>(
        this, 'answers', RealmList<RealmValue>(answers));
    RealmObjectBase.set<RealmList<RealmValue>>(
        this, 'questions', RealmList<RealmValue>(questions));
  }

  MatchDataSchema._();

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
  String get eventKey =>
      RealmObjectBase.get<String>(this, 'eventKey') as String;
  @override
  set eventKey(String value) => RealmObjectBase.set(this, 'eventKey', value);

  @override
  RealmList<RealmValue> get questions =>
      RealmObjectBase.get<RealmValue>(this, 'questions')
          as RealmList<RealmValue>;
  @override
  set questions(covariant RealmList<RealmValue> value) =>
      throw RealmUnsupportedSetError();

  @override
  int get teamNumber => RealmObjectBase.get<int>(this, 'teamNumber') as int;
  @override
  set teamNumber(int value) => RealmObjectBase.set(this, 'teamNumber', value);

  @override
  Stream<RealmObjectChanges<MatchDataSchema>> get changes =>
      RealmObjectBase.getChanges<MatchDataSchema>(this);

  @override
  MatchDataSchema freeze() =>
      RealmObjectBase.freezeObject<MatchDataSchema>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(MatchDataSchema._);
    return const SchemaObject(
        ObjectType.realmObject, MatchDataSchema, 'MatchDataSchema', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('answers', RealmPropertyType.mixed,
          optional: true, collectionType: RealmCollectionType.list),
      SchemaProperty('eventKey', RealmPropertyType.string),
      SchemaProperty('questions', RealmPropertyType.mixed,
          optional: true, collectionType: RealmCollectionType.list),
      SchemaProperty('teamNumber', RealmPropertyType.int),
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

class PitDataSchema extends _PitDataSchema
    with RealmEntity, RealmObjectBase, RealmObject {
  PitDataSchema(
    ObjectId id,
    String eventKey,
    int teamNumber, {
    Iterable<RealmValue> answers = const [],
    Iterable<RealmValue> questions = const [],
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'eventKey', eventKey);
    RealmObjectBase.set(this, 'teamNumber', teamNumber);
    RealmObjectBase.set<RealmList<RealmValue>>(
        this, 'answers', RealmList<RealmValue>(answers));
    RealmObjectBase.set<RealmList<RealmValue>>(
        this, 'questions', RealmList<RealmValue>(questions));
  }

  PitDataSchema._();

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
  String get eventKey =>
      RealmObjectBase.get<String>(this, 'eventKey') as String;
  @override
  set eventKey(String value) => RealmObjectBase.set(this, 'eventKey', value);

  @override
  RealmList<RealmValue> get questions =>
      RealmObjectBase.get<RealmValue>(this, 'questions')
          as RealmList<RealmValue>;
  @override
  set questions(covariant RealmList<RealmValue> value) =>
      throw RealmUnsupportedSetError();

  @override
  int get teamNumber => RealmObjectBase.get<int>(this, 'teamNumber') as int;
  @override
  set teamNumber(int value) => RealmObjectBase.set(this, 'teamNumber', value);

  @override
  Stream<RealmObjectChanges<PitDataSchema>> get changes =>
      RealmObjectBase.getChanges<PitDataSchema>(this);

  @override
  PitDataSchema freeze() => RealmObjectBase.freezeObject<PitDataSchema>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(PitDataSchema._);
    return const SchemaObject(
        ObjectType.realmObject, PitDataSchema, 'PitDataSchema', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('answers', RealmPropertyType.mixed,
          optional: true, collectionType: RealmCollectionType.list),
      SchemaProperty('eventKey', RealmPropertyType.string),
      SchemaProperty('questions', RealmPropertyType.mixed,
          optional: true, collectionType: RealmCollectionType.list),
      SchemaProperty('teamNumber', RealmPropertyType.int),
    ]);
  }
}

class MatchDashboardSchema extends _MatchDashboardSchema
    with RealmEntity, RealmObjectBase, RealmObject {
  MatchDashboardSchema(
    ObjectId id,
    int widgetNumber, {
    Iterable<DashboardWidget> dashboardWidgets = const [],
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'widgetNumber', widgetNumber);
    RealmObjectBase.set<RealmList<DashboardWidget>>(
        this, 'dashboardWidgets', RealmList<DashboardWidget>(dashboardWidgets));
  }

  MatchDashboardSchema._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  RealmList<DashboardWidget> get dashboardWidgets =>
      RealmObjectBase.get<DashboardWidget>(this, 'dashboardWidgets')
          as RealmList<DashboardWidget>;
  @override
  set dashboardWidgets(covariant RealmList<DashboardWidget> value) =>
      throw RealmUnsupportedSetError();

  @override
  int get widgetNumber => RealmObjectBase.get<int>(this, 'widgetNumber') as int;
  @override
  set widgetNumber(int value) =>
      RealmObjectBase.set(this, 'widgetNumber', value);

  @override
  Stream<RealmObjectChanges<MatchDashboardSchema>> get changes =>
      RealmObjectBase.getChanges<MatchDashboardSchema>(this);

  @override
  MatchDashboardSchema freeze() =>
      RealmObjectBase.freezeObject<MatchDashboardSchema>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(MatchDashboardSchema._);
    return const SchemaObject(
        ObjectType.realmObject, MatchDashboardSchema, 'MatchDashboardSchema', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('dashboardWidgets', RealmPropertyType.object,
          linkTarget: 'DashboardWidget',
          collectionType: RealmCollectionType.list),
      SchemaProperty('widgetNumber', RealmPropertyType.int),
    ]);
  }
}

class PitDashboardSchema extends _PitDashboardSchema
    with RealmEntity, RealmObjectBase, RealmObject {
  PitDashboardSchema(
    ObjectId id,
    int widgetNumber, {
    Iterable<DashboardWidget> dashboardWidgets = const [],
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'widgetNumber', widgetNumber);
    RealmObjectBase.set<RealmList<DashboardWidget>>(
        this, 'dashboardWidgets', RealmList<DashboardWidget>(dashboardWidgets));
  }

  PitDashboardSchema._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  RealmList<DashboardWidget> get dashboardWidgets =>
      RealmObjectBase.get<DashboardWidget>(this, 'dashboardWidgets')
          as RealmList<DashboardWidget>;
  @override
  set dashboardWidgets(covariant RealmList<DashboardWidget> value) =>
      throw RealmUnsupportedSetError();

  @override
  int get widgetNumber => RealmObjectBase.get<int>(this, 'widgetNumber') as int;
  @override
  set widgetNumber(int value) =>
      RealmObjectBase.set(this, 'widgetNumber', value);

  @override
  Stream<RealmObjectChanges<PitDashboardSchema>> get changes =>
      RealmObjectBase.getChanges<PitDashboardSchema>(this);

  @override
  PitDashboardSchema freeze() =>
      RealmObjectBase.freezeObject<PitDashboardSchema>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(PitDashboardSchema._);
    return const SchemaObject(
        ObjectType.realmObject, PitDashboardSchema, 'PitDashboardSchema', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('dashboardWidgets', RealmPropertyType.object,
          linkTarget: 'DashboardWidget',
          collectionType: RealmCollectionType.list),
      SchemaProperty('widgetNumber', RealmPropertyType.int),
    ]);
  }
}

class DashboardWidget extends _DashboardWidget
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  DashboardWidget(
    String title,
    String type, {
    LineTableWidgetData? lineTableData,
    PieGraphWidgetData? pieGraphData,
    TextWidgetData? textData,
  }) {
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'type', type);
    RealmObjectBase.set(this, 'lineTableData', lineTableData);
    RealmObjectBase.set(this, 'pieGraphData', pieGraphData);
    RealmObjectBase.set(this, 'textData', textData);
  }

  DashboardWidget._();

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  String get type => RealmObjectBase.get<String>(this, 'type') as String;
  @override
  set type(String value) => RealmObjectBase.set(this, 'type', value);

  @override
  LineTableWidgetData? get lineTableData =>
      RealmObjectBase.get<LineTableWidgetData>(this, 'lineTableData')
          as LineTableWidgetData?;
  @override
  set lineTableData(covariant LineTableWidgetData? value) =>
      RealmObjectBase.set(this, 'lineTableData', value);

  @override
  PieGraphWidgetData? get pieGraphData =>
      RealmObjectBase.get<PieGraphWidgetData>(this, 'pieGraphData')
          as PieGraphWidgetData?;
  @override
  set pieGraphData(covariant PieGraphWidgetData? value) =>
      RealmObjectBase.set(this, 'pieGraphData', value);

  @override
  TextWidgetData? get textData =>
      RealmObjectBase.get<TextWidgetData>(this, 'textData') as TextWidgetData?;
  @override
  set textData(covariant TextWidgetData? value) =>
      RealmObjectBase.set(this, 'textData', value);

  @override
  Stream<RealmObjectChanges<DashboardWidget>> get changes =>
      RealmObjectBase.getChanges<DashboardWidget>(this);

  @override
  DashboardWidget freeze() =>
      RealmObjectBase.freezeObject<DashboardWidget>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(DashboardWidget._);
    return const SchemaObject(
        ObjectType.embeddedObject, DashboardWidget, 'DashboardWidget', [
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('type', RealmPropertyType.string),
      SchemaProperty('lineTableData', RealmPropertyType.object,
          optional: true, linkTarget: 'LineTableWidgetData'),
      SchemaProperty('pieGraphData', RealmPropertyType.object,
          optional: true, linkTarget: 'PieGraphWidgetData'),
      SchemaProperty('textData', RealmPropertyType.object,
          optional: true, linkTarget: 'TextWidgetData'),
    ]);
  }
}

class LineTableWidgetData extends _LineTableWidgetData
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  LineTableWidgetData(
    int columnIndex,
    String columnTitle,
    int rowIndex,
  ) {
    RealmObjectBase.set(this, 'columnIndex', columnIndex);
    RealmObjectBase.set(this, 'columnTitle', columnTitle);
    RealmObjectBase.set(this, 'rowIndex', rowIndex);
  }

  LineTableWidgetData._();

  @override
  int get columnIndex => RealmObjectBase.get<int>(this, 'columnIndex') as int;
  @override
  set columnIndex(int value) => RealmObjectBase.set(this, 'columnIndex', value);

  @override
  String get columnTitle =>
      RealmObjectBase.get<String>(this, 'columnTitle') as String;
  @override
  set columnTitle(String value) =>
      RealmObjectBase.set(this, 'columnTitle', value);

  @override
  int get rowIndex => RealmObjectBase.get<int>(this, 'rowIndex') as int;
  @override
  set rowIndex(int value) => RealmObjectBase.set(this, 'rowIndex', value);

  @override
  Stream<RealmObjectChanges<LineTableWidgetData>> get changes =>
      RealmObjectBase.getChanges<LineTableWidgetData>(this);

  @override
  LineTableWidgetData freeze() =>
      RealmObjectBase.freezeObject<LineTableWidgetData>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(LineTableWidgetData._);
    return const SchemaObject(
        ObjectType.embeddedObject, LineTableWidgetData, 'LineTableWidgetData', [
      SchemaProperty('columnIndex', RealmPropertyType.int),
      SchemaProperty('columnTitle', RealmPropertyType.string),
      SchemaProperty('rowIndex', RealmPropertyType.int),
    ]);
  }
}

class PieGraphWidgetData extends _PieGraphWidgetData
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  PieGraphWidgetData(
    int percentageIndex,
    int titleIndex,
    String title,
  ) {
    RealmObjectBase.set(this, 'percentageIndex', percentageIndex);
    RealmObjectBase.set(this, 'titleIndex', titleIndex);
    RealmObjectBase.set(this, 'title', title);
  }

  PieGraphWidgetData._();

  @override
  int get percentageIndex =>
      RealmObjectBase.get<int>(this, 'percentageIndex') as int;
  @override
  set percentageIndex(int value) =>
      RealmObjectBase.set(this, 'percentageIndex', value);

  @override
  int get titleIndex => RealmObjectBase.get<int>(this, 'titleIndex') as int;
  @override
  set titleIndex(int value) => RealmObjectBase.set(this, 'titleIndex', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  Stream<RealmObjectChanges<PieGraphWidgetData>> get changes =>
      RealmObjectBase.getChanges<PieGraphWidgetData>(this);

  @override
  PieGraphWidgetData freeze() =>
      RealmObjectBase.freezeObject<PieGraphWidgetData>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(PieGraphWidgetData._);
    return const SchemaObject(
        ObjectType.embeddedObject, PieGraphWidgetData, 'PieGraphWidgetData', [
      SchemaProperty('percentageIndex', RealmPropertyType.int),
      SchemaProperty('titleIndex', RealmPropertyType.int),
      SchemaProperty('title', RealmPropertyType.string),
    ]);
  }
}

class TextWidgetData extends _TextWidgetData
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  TextWidgetData(
    int dataIndex,
    String title,
  ) {
    RealmObjectBase.set(this, 'dataIndex', dataIndex);
    RealmObjectBase.set(this, 'title', title);
  }

  TextWidgetData._();

  @override
  int get dataIndex => RealmObjectBase.get<int>(this, 'dataIndex') as int;
  @override
  set dataIndex(int value) => RealmObjectBase.set(this, 'dataIndex', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  Stream<RealmObjectChanges<TextWidgetData>> get changes =>
      RealmObjectBase.getChanges<TextWidgetData>(this);

  @override
  TextWidgetData freeze() => RealmObjectBase.freezeObject<TextWidgetData>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(TextWidgetData._);
    return const SchemaObject(
        ObjectType.embeddedObject, TextWidgetData, 'TextWidgetData', [
      SchemaProperty('dataIndex', RealmPropertyType.int),
      SchemaProperty('title', RealmPropertyType.string),
    ]);
  }
}
