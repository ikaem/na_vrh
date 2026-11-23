// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ExpeditionsTable extends Expeditions
    with TableInfo<$ExpeditionsTable, ExpeditionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpeditionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  static const VerificationMeta _coverPhotoIdMeta = const VerificationMeta(
    'coverPhotoId',
  );
  @override
  late final GeneratedColumn<String> coverPhotoId = GeneratedColumn<String>(
    'cover_photo_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    coverPhotoId,
    notes,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expeditions';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExpeditionRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('cover_photo_id')) {
      context.handle(
        _coverPhotoIdMeta,
        coverPhotoId.isAcceptableOrUnknown(
          data['cover_photo_id']!,
          _coverPhotoIdMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExpeditionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExpeditionRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      coverPhotoId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cover_photo_id'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ExpeditionsTable createAlias(String alias) {
    return $ExpeditionsTable(attachedDatabase, alias);
  }
}

class ExpeditionRow extends DataClass implements Insertable<ExpeditionRow> {
  /// Client-generated UUID, supplied by the caller.
  final String id;
  final String name;

  /// Plain column, not a foreign key: expeditions and photos point at each
  /// other, and the app keeps this consistent (the photos epic clears it when
  /// the cover photo is deleted).
  final String? coverPhotoId;
  final String? notes;

  /// Stored as UTC ISO-8601 text (see `build.yaml`).
  final DateTime createdAt;
  const ExpeditionRow({
    required this.id,
    required this.name,
    this.coverPhotoId,
    this.notes,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || coverPhotoId != null) {
      map['cover_photo_id'] = Variable<String>(coverPhotoId);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ExpeditionsCompanion toCompanion(bool nullToAbsent) {
    return ExpeditionsCompanion(
      id: Value(id),
      name: Value(name),
      coverPhotoId: coverPhotoId == null && nullToAbsent
          ? const Value.absent()
          : Value(coverPhotoId),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory ExpeditionRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExpeditionRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      coverPhotoId: serializer.fromJson<String?>(json['coverPhotoId']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'coverPhotoId': serializer.toJson<String?>(coverPhotoId),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ExpeditionRow copyWith({
    String? id,
    String? name,
    Value<String?> coverPhotoId = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
  }) => ExpeditionRow(
    id: id ?? this.id,
    name: name ?? this.name,
    coverPhotoId: coverPhotoId.present ? coverPhotoId.value : this.coverPhotoId,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
  );
  ExpeditionRow copyWithCompanion(ExpeditionsCompanion data) {
    return ExpeditionRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      coverPhotoId: data.coverPhotoId.present
          ? data.coverPhotoId.value
          : this.coverPhotoId,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExpeditionRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('coverPhotoId: $coverPhotoId, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, coverPhotoId, notes, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExpeditionRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.coverPhotoId == this.coverPhotoId &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class ExpeditionsCompanion extends UpdateCompanion<ExpeditionRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> coverPhotoId;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const ExpeditionsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.coverPhotoId = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExpeditionsCompanion.insert({
    required String id,
    required String name,
    this.coverPhotoId = const Value.absent(),
    this.notes = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt);
  static Insertable<ExpeditionRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? coverPhotoId,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (coverPhotoId != null) 'cover_photo_id': coverPhotoId,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExpeditionsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? coverPhotoId,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return ExpeditionsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      coverPhotoId: coverPhotoId ?? this.coverPhotoId,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (coverPhotoId.present) {
      map['cover_photo_id'] = Variable<String>(coverPhotoId.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpeditionsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('coverPhotoId: $coverPhotoId, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ExpeditionsTable expeditions = $ExpeditionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [expeditions];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$ExpeditionsTableCreateCompanionBuilder =
    ExpeditionsCompanion Function({
      required String id,
      required String name,
      Value<String?> coverPhotoId,
      Value<String?> notes,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$ExpeditionsTableUpdateCompanionBuilder =
    ExpeditionsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> coverPhotoId,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$ExpeditionsTableFilterComposer
    extends Composer<_$AppDatabase, $ExpeditionsTable> {
  $$ExpeditionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coverPhotoId => $composableBuilder(
    column: $table.coverPhotoId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExpeditionsTableOrderingComposer
    extends Composer<_$AppDatabase, $ExpeditionsTable> {
  $$ExpeditionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coverPhotoId => $composableBuilder(
    column: $table.coverPhotoId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExpeditionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExpeditionsTable> {
  $$ExpeditionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get coverPhotoId => $composableBuilder(
    column: $table.coverPhotoId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ExpeditionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExpeditionsTable,
          ExpeditionRow,
          $$ExpeditionsTableFilterComposer,
          $$ExpeditionsTableOrderingComposer,
          $$ExpeditionsTableAnnotationComposer,
          $$ExpeditionsTableCreateCompanionBuilder,
          $$ExpeditionsTableUpdateCompanionBuilder,
          (
            ExpeditionRow,
            BaseReferences<_$AppDatabase, $ExpeditionsTable, ExpeditionRow>,
          ),
          ExpeditionRow,
          PrefetchHooks Function()
        > {
  $$ExpeditionsTableTableManager(_$AppDatabase db, $ExpeditionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExpeditionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExpeditionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExpeditionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> coverPhotoId = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExpeditionsCompanion(
                id: id,
                name: name,
                coverPhotoId: coverPhotoId,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> coverPhotoId = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => ExpeditionsCompanion.insert(
                id: id,
                name: name,
                coverPhotoId: coverPhotoId,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ExpeditionsTable, ExpeditionRow>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $ExpeditionsTable,
                    ExpeditionRow
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExpeditionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExpeditionsTable,
      ExpeditionRow,
      $$ExpeditionsTableFilterComposer,
      $$ExpeditionsTableOrderingComposer,
      $$ExpeditionsTableAnnotationComposer,
      $$ExpeditionsTableCreateCompanionBuilder,
      $$ExpeditionsTableUpdateCompanionBuilder,
      (
        ExpeditionRow,
        BaseReferences<_$AppDatabase, $ExpeditionsTable, ExpeditionRow>,
      ),
      ExpeditionRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ExpeditionsTableTableManager get expeditions =>
      $$ExpeditionsTableTableManager(_db, _db.expeditions);
}
