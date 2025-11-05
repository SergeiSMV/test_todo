// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ResponsibleTableTable extends ResponsibleTable
    with TableInfo<$ResponsibleTableTable, ResponsibleTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ResponsibleTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('active'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, phone, status];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'responsible_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ResponsibleTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ResponsibleTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ResponsibleTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $ResponsibleTableTable createAlias(String alias) {
    return $ResponsibleTableTable(attachedDatabase, alias);
  }
}

class ResponsibleTableData extends DataClass
    implements Insertable<ResponsibleTableData> {
  /// Идентификатор ответственного (автоинкремент)
  final int id;

  /// Имя ответственного
  final String name;

  /// Телефон ответственного
  final String phone;

  /// Статус записи (active / inactive)
  final String status;
  const ResponsibleTableData({
    required this.id,
    required this.name,
    required this.phone,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['phone'] = Variable<String>(phone);
    map['status'] = Variable<String>(status);
    return map;
  }

  ResponsibleTableCompanion toCompanion(bool nullToAbsent) {
    return ResponsibleTableCompanion(
      id: Value(id),
      name: Value(name),
      phone: Value(phone),
      status: Value(status),
    );
  }

  factory ResponsibleTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ResponsibleTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String>(json['phone']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String>(phone),
      'status': serializer.toJson<String>(status),
    };
  }

  ResponsibleTableData copyWith({
    int? id,
    String? name,
    String? phone,
    String? status,
  }) => ResponsibleTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    phone: phone ?? this.phone,
    status: status ?? this.status,
  );
  ResponsibleTableData copyWithCompanion(ResponsibleTableCompanion data) {
    return ResponsibleTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ResponsibleTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, phone, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ResponsibleTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.status == this.status);
}

class ResponsibleTableCompanion extends UpdateCompanion<ResponsibleTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> phone;
  final Value<String> status;
  const ResponsibleTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.status = const Value.absent(),
  });
  ResponsibleTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String phone,
    this.status = const Value.absent(),
  }) : name = Value(name),
       phone = Value(phone);
  static Insertable<ResponsibleTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (status != null) 'status': status,
    });
  }

  ResponsibleTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? phone,
    Value<String>? status,
  }) {
    return ResponsibleTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ResponsibleTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $TaskTableTable extends TaskTable
    with TableInfo<$TaskTableTable, TaskTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _responsibleIdMeta = const VerificationMeta(
    'responsibleId',
  );
  @override
  late final GeneratedColumn<int> responsibleId = GeneratedColumn<int>(
    'responsible_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priorityMeta = const VerificationMeta(
    'priority',
  );
  @override
  late final GeneratedColumn<String> priority = GeneratedColumn<String>(
    'priority',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dueDateMeta = const VerificationMeta(
    'dueDate',
  );
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
    'due_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<bool> status = GeneratedColumn<bool>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("status" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    description,
    responsibleId,
    priority,
    dueDate,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<TaskTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('responsible_id')) {
      context.handle(
        _responsibleIdMeta,
        responsibleId.isAcceptableOrUnknown(
          data['responsible_id']!,
          _responsibleIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_responsibleIdMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(
        _priorityMeta,
        priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta),
      );
    } else if (isInserting) {
      context.missing(_priorityMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(
        _dueDateMeta,
        dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta),
      );
    } else if (isInserting) {
      context.missing(_dueDateMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      responsibleId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}responsible_id'],
      )!,
      priority: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}priority'],
      )!,
      dueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}due_date'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $TaskTableTable createAlias(String alias) {
    return $TaskTableTable(attachedDatabase, alias);
  }
}

class TaskTableData extends DataClass implements Insertable<TaskTableData> {
  /// Идентификатор задачи (автоинкремент)
  final int id;

  /// Описание задачи
  final String description;

  /// Ответственный за задачу
  final int responsibleId;

  /// Приоритет задачи
  final String priority;

  /// Дата исполнения задачи
  final DateTime dueDate;

  /// Статус задачи (true - активна, false - неактивна)
  final bool status;
  const TaskTableData({
    required this.id,
    required this.description,
    required this.responsibleId,
    required this.priority,
    required this.dueDate,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['description'] = Variable<String>(description);
    map['responsible_id'] = Variable<int>(responsibleId);
    map['priority'] = Variable<String>(priority);
    map['due_date'] = Variable<DateTime>(dueDate);
    map['status'] = Variable<bool>(status);
    return map;
  }

  TaskTableCompanion toCompanion(bool nullToAbsent) {
    return TaskTableCompanion(
      id: Value(id),
      description: Value(description),
      responsibleId: Value(responsibleId),
      priority: Value(priority),
      dueDate: Value(dueDate),
      status: Value(status),
    );
  }

  factory TaskTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskTableData(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      responsibleId: serializer.fromJson<int>(json['responsibleId']),
      priority: serializer.fromJson<String>(json['priority']),
      dueDate: serializer.fromJson<DateTime>(json['dueDate']),
      status: serializer.fromJson<bool>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
      'responsibleId': serializer.toJson<int>(responsibleId),
      'priority': serializer.toJson<String>(priority),
      'dueDate': serializer.toJson<DateTime>(dueDate),
      'status': serializer.toJson<bool>(status),
    };
  }

  TaskTableData copyWith({
    int? id,
    String? description,
    int? responsibleId,
    String? priority,
    DateTime? dueDate,
    bool? status,
  }) => TaskTableData(
    id: id ?? this.id,
    description: description ?? this.description,
    responsibleId: responsibleId ?? this.responsibleId,
    priority: priority ?? this.priority,
    dueDate: dueDate ?? this.dueDate,
    status: status ?? this.status,
  );
  TaskTableData copyWithCompanion(TaskTableCompanion data) {
    return TaskTableData(
      id: data.id.present ? data.id.value : this.id,
      description: data.description.present
          ? data.description.value
          : this.description,
      responsibleId: data.responsibleId.present
          ? data.responsibleId.value
          : this.responsibleId,
      priority: data.priority.present ? data.priority.value : this.priority,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskTableData(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('responsibleId: $responsibleId, ')
          ..write('priority: $priority, ')
          ..write('dueDate: $dueDate, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, description, responsibleId, priority, dueDate, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskTableData &&
          other.id == this.id &&
          other.description == this.description &&
          other.responsibleId == this.responsibleId &&
          other.priority == this.priority &&
          other.dueDate == this.dueDate &&
          other.status == this.status);
}

class TaskTableCompanion extends UpdateCompanion<TaskTableData> {
  final Value<int> id;
  final Value<String> description;
  final Value<int> responsibleId;
  final Value<String> priority;
  final Value<DateTime> dueDate;
  final Value<bool> status;
  const TaskTableCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.responsibleId = const Value.absent(),
    this.priority = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.status = const Value.absent(),
  });
  TaskTableCompanion.insert({
    this.id = const Value.absent(),
    required String description,
    required int responsibleId,
    required String priority,
    required DateTime dueDate,
    this.status = const Value.absent(),
  }) : description = Value(description),
       responsibleId = Value(responsibleId),
       priority = Value(priority),
       dueDate = Value(dueDate);
  static Insertable<TaskTableData> custom({
    Expression<int>? id,
    Expression<String>? description,
    Expression<int>? responsibleId,
    Expression<String>? priority,
    Expression<DateTime>? dueDate,
    Expression<bool>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (responsibleId != null) 'responsible_id': responsibleId,
      if (priority != null) 'priority': priority,
      if (dueDate != null) 'due_date': dueDate,
      if (status != null) 'status': status,
    });
  }

  TaskTableCompanion copyWith({
    Value<int>? id,
    Value<String>? description,
    Value<int>? responsibleId,
    Value<String>? priority,
    Value<DateTime>? dueDate,
    Value<bool>? status,
  }) {
    return TaskTableCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      responsibleId: responsibleId ?? this.responsibleId,
      priority: priority ?? this.priority,
      dueDate: dueDate ?? this.dueDate,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (responsibleId.present) {
      map['responsible_id'] = Variable<int>(responsibleId.value);
    }
    if (priority.present) {
      map['priority'] = Variable<String>(priority.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (status.present) {
      map['status'] = Variable<bool>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskTableCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('responsibleId: $responsibleId, ')
          ..write('priority: $priority, ')
          ..write('dueDate: $dueDate, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ResponsibleTableTable responsibleTable = $ResponsibleTableTable(
    this,
  );
  late final $TaskTableTable taskTable = $TaskTableTable(this);
  late final ResponsibleDao responsibleDao = ResponsibleDao(
    this as AppDatabase,
  );
  late final TaskDao taskDao = TaskDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    responsibleTable,
    taskTable,
  ];
}

typedef $$ResponsibleTableTableCreateCompanionBuilder =
    ResponsibleTableCompanion Function({
      Value<int> id,
      required String name,
      required String phone,
      Value<String> status,
    });
typedef $$ResponsibleTableTableUpdateCompanionBuilder =
    ResponsibleTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> phone,
      Value<String> status,
    });

class $$ResponsibleTableTableFilterComposer
    extends Composer<_$AppDatabase, $ResponsibleTableTable> {
  $$ResponsibleTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ResponsibleTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ResponsibleTableTable> {
  $$ResponsibleTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ResponsibleTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ResponsibleTableTable> {
  $$ResponsibleTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$ResponsibleTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ResponsibleTableTable,
          ResponsibleTableData,
          $$ResponsibleTableTableFilterComposer,
          $$ResponsibleTableTableOrderingComposer,
          $$ResponsibleTableTableAnnotationComposer,
          $$ResponsibleTableTableCreateCompanionBuilder,
          $$ResponsibleTableTableUpdateCompanionBuilder,
          (
            ResponsibleTableData,
            BaseReferences<
              _$AppDatabase,
              $ResponsibleTableTable,
              ResponsibleTableData
            >,
          ),
          ResponsibleTableData,
          PrefetchHooks Function()
        > {
  $$ResponsibleTableTableTableManager(
    _$AppDatabase db,
    $ResponsibleTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ResponsibleTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ResponsibleTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ResponsibleTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> phone = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) => ResponsibleTableCompanion(
                id: id,
                name: name,
                phone: phone,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String phone,
                Value<String> status = const Value.absent(),
              }) => ResponsibleTableCompanion.insert(
                id: id,
                name: name,
                phone: phone,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ResponsibleTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ResponsibleTableTable,
      ResponsibleTableData,
      $$ResponsibleTableTableFilterComposer,
      $$ResponsibleTableTableOrderingComposer,
      $$ResponsibleTableTableAnnotationComposer,
      $$ResponsibleTableTableCreateCompanionBuilder,
      $$ResponsibleTableTableUpdateCompanionBuilder,
      (
        ResponsibleTableData,
        BaseReferences<
          _$AppDatabase,
          $ResponsibleTableTable,
          ResponsibleTableData
        >,
      ),
      ResponsibleTableData,
      PrefetchHooks Function()
    >;
typedef $$TaskTableTableCreateCompanionBuilder =
    TaskTableCompanion Function({
      Value<int> id,
      required String description,
      required int responsibleId,
      required String priority,
      required DateTime dueDate,
      Value<bool> status,
    });
typedef $$TaskTableTableUpdateCompanionBuilder =
    TaskTableCompanion Function({
      Value<int> id,
      Value<String> description,
      Value<int> responsibleId,
      Value<String> priority,
      Value<DateTime> dueDate,
      Value<bool> status,
    });

class $$TaskTableTableFilterComposer
    extends Composer<_$AppDatabase, $TaskTableTable> {
  $$TaskTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get responsibleId => $composableBuilder(
    column: $table.responsibleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TaskTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TaskTableTable> {
  $$TaskTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get responsibleId => $composableBuilder(
    column: $table.responsibleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TaskTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TaskTableTable> {
  $$TaskTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get responsibleId => $composableBuilder(
    column: $table.responsibleId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<bool> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$TaskTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TaskTableTable,
          TaskTableData,
          $$TaskTableTableFilterComposer,
          $$TaskTableTableOrderingComposer,
          $$TaskTableTableAnnotationComposer,
          $$TaskTableTableCreateCompanionBuilder,
          $$TaskTableTableUpdateCompanionBuilder,
          (
            TaskTableData,
            BaseReferences<_$AppDatabase, $TaskTableTable, TaskTableData>,
          ),
          TaskTableData,
          PrefetchHooks Function()
        > {
  $$TaskTableTableTableManager(_$AppDatabase db, $TaskTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaskTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TaskTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaskTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> responsibleId = const Value.absent(),
                Value<String> priority = const Value.absent(),
                Value<DateTime> dueDate = const Value.absent(),
                Value<bool> status = const Value.absent(),
              }) => TaskTableCompanion(
                id: id,
                description: description,
                responsibleId: responsibleId,
                priority: priority,
                dueDate: dueDate,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String description,
                required int responsibleId,
                required String priority,
                required DateTime dueDate,
                Value<bool> status = const Value.absent(),
              }) => TaskTableCompanion.insert(
                id: id,
                description: description,
                responsibleId: responsibleId,
                priority: priority,
                dueDate: dueDate,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TaskTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TaskTableTable,
      TaskTableData,
      $$TaskTableTableFilterComposer,
      $$TaskTableTableOrderingComposer,
      $$TaskTableTableAnnotationComposer,
      $$TaskTableTableCreateCompanionBuilder,
      $$TaskTableTableUpdateCompanionBuilder,
      (
        TaskTableData,
        BaseReferences<_$AppDatabase, $TaskTableTable, TaskTableData>,
      ),
      TaskTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ResponsibleTableTableTableManager get responsibleTable =>
      $$ResponsibleTableTableTableManager(_db, _db.responsibleTable);
  $$TaskTableTableTableManager get taskTable =>
      $$TaskTableTableTableManager(_db, _db.taskTable);
}
