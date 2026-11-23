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

class $RoutesTable extends Routes with TableInfo<$RoutesTable, RouteRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoutesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expeditionIdMeta = const VerificationMeta(
    'expeditionId',
  );
  @override
  late final GeneratedColumn<String> expeditionId = GeneratedColumn<String>(
    'expedition_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES expeditions (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _peakOsmIdMeta = const VerificationMeta(
    'peakOsmId',
  );
  @override
  late final GeneratedColumn<int> peakOsmId = GeneratedColumn<int>(
    'peak_osm_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _peakNameMeta = const VerificationMeta(
    'peakName',
  );
  @override
  late final GeneratedColumn<String> peakName = GeneratedColumn<String>(
    'peak_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _peakLatMeta = const VerificationMeta(
    'peakLat',
  );
  @override
  late final GeneratedColumn<double> peakLat = GeneratedColumn<double>(
    'peak_lat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _peakLonMeta = const VerificationMeta(
    'peakLon',
  );
  @override
  late final GeneratedColumn<double> peakLon = GeneratedColumn<double>(
    'peak_lon',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _peakElevationMeta = const VerificationMeta(
    'peakElevation',
  );
  @override
  late final GeneratedColumn<double> peakElevation = GeneratedColumn<double>(
    'peak_elevation',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<RouteState, String> state =
      GeneratedColumn<String>(
        'state',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<RouteState>($RoutesTable.$converterstate);
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
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startLatMeta = const VerificationMeta(
    'startLat',
  );
  @override
  late final GeneratedColumn<double> startLat = GeneratedColumn<double>(
    'start_lat',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startLonMeta = const VerificationMeta(
    'startLon',
  );
  @override
  late final GeneratedColumn<double> startLon = GeneratedColumn<double>(
    'start_lon',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startAccuracyMMeta = const VerificationMeta(
    'startAccuracyM',
  );
  @override
  late final GeneratedColumn<double> startAccuracyM = GeneratedColumn<double>(
    'start_accuracy_m',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _climbedAtMeta = const VerificationMeta(
    'climbedAt',
  );
  @override
  late final GeneratedColumn<DateTime> climbedAt = GeneratedColumn<DateTime>(
    'climbed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationSMeta = const VerificationMeta(
    'durationS',
  );
  @override
  late final GeneratedColumn<int> durationS = GeneratedColumn<int>(
    'duration_s',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<RouteSource, String> source =
      GeneratedColumn<String>(
        'source',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<RouteSource>($RoutesTable.$convertersource);
  static const VerificationMeta _toleranceMMeta = const VerificationMeta(
    'toleranceM',
  );
  @override
  late final GeneratedColumn<double> toleranceM = GeneratedColumn<double>(
    'tolerance_m',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _estimatedLatMeta = const VerificationMeta(
    'estimatedLat',
  );
  @override
  late final GeneratedColumn<double> estimatedLat = GeneratedColumn<double>(
    'estimated_lat',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _estimatedLonMeta = const VerificationMeta(
    'estimatedLon',
  );
  @override
  late final GeneratedColumn<double> estimatedLon = GeneratedColumn<double>(
    'estimated_lon',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _distanceMMeta = const VerificationMeta(
    'distanceM',
  );
  @override
  late final GeneratedColumn<double> distanceM = GeneratedColumn<double>(
    'distance_m',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<EstimationMethod?, String>
  estimationMethod = GeneratedColumn<String>(
    'estimation_method',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<EstimationMethod?>($RoutesTable.$converterestimationMethodn);
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    expeditionId,
    peakOsmId,
    peakName,
    peakLat,
    peakLon,
    peakElevation,
    state,
    createdAt,
    startedAt,
    startLat,
    startLon,
    startAccuracyM,
    climbedAt,
    durationS,
    source,
    toleranceM,
    estimatedLat,
    estimatedLon,
    distanceM,
    estimationMethod,
    coverPhotoId,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'routes';
  @override
  VerificationContext validateIntegrity(
    Insertable<RouteRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('expedition_id')) {
      context.handle(
        _expeditionIdMeta,
        expeditionId.isAcceptableOrUnknown(
          data['expedition_id']!,
          _expeditionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_expeditionIdMeta);
    }
    if (data.containsKey('peak_osm_id')) {
      context.handle(
        _peakOsmIdMeta,
        peakOsmId.isAcceptableOrUnknown(data['peak_osm_id']!, _peakOsmIdMeta),
      );
    } else if (isInserting) {
      context.missing(_peakOsmIdMeta);
    }
    if (data.containsKey('peak_name')) {
      context.handle(
        _peakNameMeta,
        peakName.isAcceptableOrUnknown(data['peak_name']!, _peakNameMeta),
      );
    } else if (isInserting) {
      context.missing(_peakNameMeta);
    }
    if (data.containsKey('peak_lat')) {
      context.handle(
        _peakLatMeta,
        peakLat.isAcceptableOrUnknown(data['peak_lat']!, _peakLatMeta),
      );
    } else if (isInserting) {
      context.missing(_peakLatMeta);
    }
    if (data.containsKey('peak_lon')) {
      context.handle(
        _peakLonMeta,
        peakLon.isAcceptableOrUnknown(data['peak_lon']!, _peakLonMeta),
      );
    } else if (isInserting) {
      context.missing(_peakLonMeta);
    }
    if (data.containsKey('peak_elevation')) {
      context.handle(
        _peakElevationMeta,
        peakElevation.isAcceptableOrUnknown(
          data['peak_elevation']!,
          _peakElevationMeta,
        ),
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
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    }
    if (data.containsKey('start_lat')) {
      context.handle(
        _startLatMeta,
        startLat.isAcceptableOrUnknown(data['start_lat']!, _startLatMeta),
      );
    }
    if (data.containsKey('start_lon')) {
      context.handle(
        _startLonMeta,
        startLon.isAcceptableOrUnknown(data['start_lon']!, _startLonMeta),
      );
    }
    if (data.containsKey('start_accuracy_m')) {
      context.handle(
        _startAccuracyMMeta,
        startAccuracyM.isAcceptableOrUnknown(
          data['start_accuracy_m']!,
          _startAccuracyMMeta,
        ),
      );
    }
    if (data.containsKey('climbed_at')) {
      context.handle(
        _climbedAtMeta,
        climbedAt.isAcceptableOrUnknown(data['climbed_at']!, _climbedAtMeta),
      );
    }
    if (data.containsKey('duration_s')) {
      context.handle(
        _durationSMeta,
        durationS.isAcceptableOrUnknown(data['duration_s']!, _durationSMeta),
      );
    }
    if (data.containsKey('tolerance_m')) {
      context.handle(
        _toleranceMMeta,
        toleranceM.isAcceptableOrUnknown(data['tolerance_m']!, _toleranceMMeta),
      );
    }
    if (data.containsKey('estimated_lat')) {
      context.handle(
        _estimatedLatMeta,
        estimatedLat.isAcceptableOrUnknown(
          data['estimated_lat']!,
          _estimatedLatMeta,
        ),
      );
    }
    if (data.containsKey('estimated_lon')) {
      context.handle(
        _estimatedLonMeta,
        estimatedLon.isAcceptableOrUnknown(
          data['estimated_lon']!,
          _estimatedLonMeta,
        ),
      );
    }
    if (data.containsKey('distance_m')) {
      context.handle(
        _distanceMMeta,
        distanceM.isAcceptableOrUnknown(data['distance_m']!, _distanceMMeta),
      );
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RouteRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RouteRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      expeditionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}expedition_id'],
      )!,
      peakOsmId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}peak_osm_id'],
      )!,
      peakName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}peak_name'],
      )!,
      peakLat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}peak_lat'],
      )!,
      peakLon: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}peak_lon'],
      )!,
      peakElevation: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}peak_elevation'],
      ),
      state: $RoutesTable.$converterstate.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}state'],
        )!,
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      ),
      startLat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}start_lat'],
      ),
      startLon: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}start_lon'],
      ),
      startAccuracyM: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}start_accuracy_m'],
      ),
      climbedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}climbed_at'],
      ),
      durationS: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_s'],
      ),
      source: $RoutesTable.$convertersource.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}source'],
        )!,
      ),
      toleranceM: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}tolerance_m'],
      ),
      estimatedLat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}estimated_lat'],
      ),
      estimatedLon: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}estimated_lon'],
      ),
      distanceM: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}distance_m'],
      ),
      estimationMethod: $RoutesTable.$converterestimationMethodn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}estimation_method'],
        ),
      ),
      coverPhotoId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cover_photo_id'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $RoutesTable createAlias(String alias) {
    return $RoutesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<RouteState, String, String> $converterstate =
      const EnumNameConverter<RouteState>(RouteState.values);
  static JsonTypeConverter2<RouteSource, String, String> $convertersource =
      const EnumNameConverter<RouteSource>(RouteSource.values);
  static JsonTypeConverter2<EstimationMethod, String, String>
  $converterestimationMethod = const EnumNameConverter<EstimationMethod>(
    EstimationMethod.values,
  );
  static JsonTypeConverter2<EstimationMethod?, String?, String?>
  $converterestimationMethodn = JsonTypeConverter2.asNullable(
    $converterestimationMethod,
  );
}

class RouteRow extends DataClass implements Insertable<RouteRow> {
  /// Client-generated UUID, supplied by the caller.
  final String id;

  /// Deleting the expedition deletes its routes.
  final String expeditionId;

  /// OSM IDs are large integers.
  final int peakOsmId;
  final String peakName;
  final double peakLat;
  final double peakLon;

  /// Elevation can be missing in the source data.
  final double? peakElevation;
  final RouteState state;

  /// Stored as UTC ISO-8601 text (see `build.yaml`).
  final DateTime createdAt;
  final DateTime? startedAt;
  final double? startLat;
  final double? startLon;
  final double? startAccuracyM;

  /// GPS timestamp of the summit reading.
  final DateTime? climbedAt;
  final int? durationS;
  final RouteSource source;

  /// The tolerance used at detection.
  final double? toleranceM;
  final double? estimatedLat;
  final double? estimatedLon;
  final double? distanceM;
  final EstimationMethod? estimationMethod;

  /// Plain column, not a foreign key: routes and photos point at each other,
  /// and the app keeps this consistent.
  final String? coverPhotoId;
  final String? notes;
  const RouteRow({
    required this.id,
    required this.expeditionId,
    required this.peakOsmId,
    required this.peakName,
    required this.peakLat,
    required this.peakLon,
    this.peakElevation,
    required this.state,
    required this.createdAt,
    this.startedAt,
    this.startLat,
    this.startLon,
    this.startAccuracyM,
    this.climbedAt,
    this.durationS,
    required this.source,
    this.toleranceM,
    this.estimatedLat,
    this.estimatedLon,
    this.distanceM,
    this.estimationMethod,
    this.coverPhotoId,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['expedition_id'] = Variable<String>(expeditionId);
    map['peak_osm_id'] = Variable<int>(peakOsmId);
    map['peak_name'] = Variable<String>(peakName);
    map['peak_lat'] = Variable<double>(peakLat);
    map['peak_lon'] = Variable<double>(peakLon);
    if (!nullToAbsent || peakElevation != null) {
      map['peak_elevation'] = Variable<double>(peakElevation);
    }
    {
      map['state'] = Variable<String>(
        $RoutesTable.$converterstate.toSql(state),
      );
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || startedAt != null) {
      map['started_at'] = Variable<DateTime>(startedAt);
    }
    if (!nullToAbsent || startLat != null) {
      map['start_lat'] = Variable<double>(startLat);
    }
    if (!nullToAbsent || startLon != null) {
      map['start_lon'] = Variable<double>(startLon);
    }
    if (!nullToAbsent || startAccuracyM != null) {
      map['start_accuracy_m'] = Variable<double>(startAccuracyM);
    }
    if (!nullToAbsent || climbedAt != null) {
      map['climbed_at'] = Variable<DateTime>(climbedAt);
    }
    if (!nullToAbsent || durationS != null) {
      map['duration_s'] = Variable<int>(durationS);
    }
    {
      map['source'] = Variable<String>(
        $RoutesTable.$convertersource.toSql(source),
      );
    }
    if (!nullToAbsent || toleranceM != null) {
      map['tolerance_m'] = Variable<double>(toleranceM);
    }
    if (!nullToAbsent || estimatedLat != null) {
      map['estimated_lat'] = Variable<double>(estimatedLat);
    }
    if (!nullToAbsent || estimatedLon != null) {
      map['estimated_lon'] = Variable<double>(estimatedLon);
    }
    if (!nullToAbsent || distanceM != null) {
      map['distance_m'] = Variable<double>(distanceM);
    }
    if (!nullToAbsent || estimationMethod != null) {
      map['estimation_method'] = Variable<String>(
        $RoutesTable.$converterestimationMethodn.toSql(estimationMethod),
      );
    }
    if (!nullToAbsent || coverPhotoId != null) {
      map['cover_photo_id'] = Variable<String>(coverPhotoId);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  RoutesCompanion toCompanion(bool nullToAbsent) {
    return RoutesCompanion(
      id: Value(id),
      expeditionId: Value(expeditionId),
      peakOsmId: Value(peakOsmId),
      peakName: Value(peakName),
      peakLat: Value(peakLat),
      peakLon: Value(peakLon),
      peakElevation: peakElevation == null && nullToAbsent
          ? const Value.absent()
          : Value(peakElevation),
      state: Value(state),
      createdAt: Value(createdAt),
      startedAt: startedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(startedAt),
      startLat: startLat == null && nullToAbsent
          ? const Value.absent()
          : Value(startLat),
      startLon: startLon == null && nullToAbsent
          ? const Value.absent()
          : Value(startLon),
      startAccuracyM: startAccuracyM == null && nullToAbsent
          ? const Value.absent()
          : Value(startAccuracyM),
      climbedAt: climbedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(climbedAt),
      durationS: durationS == null && nullToAbsent
          ? const Value.absent()
          : Value(durationS),
      source: Value(source),
      toleranceM: toleranceM == null && nullToAbsent
          ? const Value.absent()
          : Value(toleranceM),
      estimatedLat: estimatedLat == null && nullToAbsent
          ? const Value.absent()
          : Value(estimatedLat),
      estimatedLon: estimatedLon == null && nullToAbsent
          ? const Value.absent()
          : Value(estimatedLon),
      distanceM: distanceM == null && nullToAbsent
          ? const Value.absent()
          : Value(distanceM),
      estimationMethod: estimationMethod == null && nullToAbsent
          ? const Value.absent()
          : Value(estimationMethod),
      coverPhotoId: coverPhotoId == null && nullToAbsent
          ? const Value.absent()
          : Value(coverPhotoId),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory RouteRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RouteRow(
      id: serializer.fromJson<String>(json['id']),
      expeditionId: serializer.fromJson<String>(json['expeditionId']),
      peakOsmId: serializer.fromJson<int>(json['peakOsmId']),
      peakName: serializer.fromJson<String>(json['peakName']),
      peakLat: serializer.fromJson<double>(json['peakLat']),
      peakLon: serializer.fromJson<double>(json['peakLon']),
      peakElevation: serializer.fromJson<double?>(json['peakElevation']),
      state: $RoutesTable.$converterstate.fromJson(
        serializer.fromJson<String>(json['state']),
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      startedAt: serializer.fromJson<DateTime?>(json['startedAt']),
      startLat: serializer.fromJson<double?>(json['startLat']),
      startLon: serializer.fromJson<double?>(json['startLon']),
      startAccuracyM: serializer.fromJson<double?>(json['startAccuracyM']),
      climbedAt: serializer.fromJson<DateTime?>(json['climbedAt']),
      durationS: serializer.fromJson<int?>(json['durationS']),
      source: $RoutesTable.$convertersource.fromJson(
        serializer.fromJson<String>(json['source']),
      ),
      toleranceM: serializer.fromJson<double?>(json['toleranceM']),
      estimatedLat: serializer.fromJson<double?>(json['estimatedLat']),
      estimatedLon: serializer.fromJson<double?>(json['estimatedLon']),
      distanceM: serializer.fromJson<double?>(json['distanceM']),
      estimationMethod: $RoutesTable.$converterestimationMethodn.fromJson(
        serializer.fromJson<String?>(json['estimationMethod']),
      ),
      coverPhotoId: serializer.fromJson<String?>(json['coverPhotoId']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'expeditionId': serializer.toJson<String>(expeditionId),
      'peakOsmId': serializer.toJson<int>(peakOsmId),
      'peakName': serializer.toJson<String>(peakName),
      'peakLat': serializer.toJson<double>(peakLat),
      'peakLon': serializer.toJson<double>(peakLon),
      'peakElevation': serializer.toJson<double?>(peakElevation),
      'state': serializer.toJson<String>(
        $RoutesTable.$converterstate.toJson(state),
      ),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'startedAt': serializer.toJson<DateTime?>(startedAt),
      'startLat': serializer.toJson<double?>(startLat),
      'startLon': serializer.toJson<double?>(startLon),
      'startAccuracyM': serializer.toJson<double?>(startAccuracyM),
      'climbedAt': serializer.toJson<DateTime?>(climbedAt),
      'durationS': serializer.toJson<int?>(durationS),
      'source': serializer.toJson<String>(
        $RoutesTable.$convertersource.toJson(source),
      ),
      'toleranceM': serializer.toJson<double?>(toleranceM),
      'estimatedLat': serializer.toJson<double?>(estimatedLat),
      'estimatedLon': serializer.toJson<double?>(estimatedLon),
      'distanceM': serializer.toJson<double?>(distanceM),
      'estimationMethod': serializer.toJson<String?>(
        $RoutesTable.$converterestimationMethodn.toJson(estimationMethod),
      ),
      'coverPhotoId': serializer.toJson<String?>(coverPhotoId),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  RouteRow copyWith({
    String? id,
    String? expeditionId,
    int? peakOsmId,
    String? peakName,
    double? peakLat,
    double? peakLon,
    Value<double?> peakElevation = const Value.absent(),
    RouteState? state,
    DateTime? createdAt,
    Value<DateTime?> startedAt = const Value.absent(),
    Value<double?> startLat = const Value.absent(),
    Value<double?> startLon = const Value.absent(),
    Value<double?> startAccuracyM = const Value.absent(),
    Value<DateTime?> climbedAt = const Value.absent(),
    Value<int?> durationS = const Value.absent(),
    RouteSource? source,
    Value<double?> toleranceM = const Value.absent(),
    Value<double?> estimatedLat = const Value.absent(),
    Value<double?> estimatedLon = const Value.absent(),
    Value<double?> distanceM = const Value.absent(),
    Value<EstimationMethod?> estimationMethod = const Value.absent(),
    Value<String?> coverPhotoId = const Value.absent(),
    Value<String?> notes = const Value.absent(),
  }) => RouteRow(
    id: id ?? this.id,
    expeditionId: expeditionId ?? this.expeditionId,
    peakOsmId: peakOsmId ?? this.peakOsmId,
    peakName: peakName ?? this.peakName,
    peakLat: peakLat ?? this.peakLat,
    peakLon: peakLon ?? this.peakLon,
    peakElevation: peakElevation.present
        ? peakElevation.value
        : this.peakElevation,
    state: state ?? this.state,
    createdAt: createdAt ?? this.createdAt,
    startedAt: startedAt.present ? startedAt.value : this.startedAt,
    startLat: startLat.present ? startLat.value : this.startLat,
    startLon: startLon.present ? startLon.value : this.startLon,
    startAccuracyM: startAccuracyM.present
        ? startAccuracyM.value
        : this.startAccuracyM,
    climbedAt: climbedAt.present ? climbedAt.value : this.climbedAt,
    durationS: durationS.present ? durationS.value : this.durationS,
    source: source ?? this.source,
    toleranceM: toleranceM.present ? toleranceM.value : this.toleranceM,
    estimatedLat: estimatedLat.present ? estimatedLat.value : this.estimatedLat,
    estimatedLon: estimatedLon.present ? estimatedLon.value : this.estimatedLon,
    distanceM: distanceM.present ? distanceM.value : this.distanceM,
    estimationMethod: estimationMethod.present
        ? estimationMethod.value
        : this.estimationMethod,
    coverPhotoId: coverPhotoId.present ? coverPhotoId.value : this.coverPhotoId,
    notes: notes.present ? notes.value : this.notes,
  );
  RouteRow copyWithCompanion(RoutesCompanion data) {
    return RouteRow(
      id: data.id.present ? data.id.value : this.id,
      expeditionId: data.expeditionId.present
          ? data.expeditionId.value
          : this.expeditionId,
      peakOsmId: data.peakOsmId.present ? data.peakOsmId.value : this.peakOsmId,
      peakName: data.peakName.present ? data.peakName.value : this.peakName,
      peakLat: data.peakLat.present ? data.peakLat.value : this.peakLat,
      peakLon: data.peakLon.present ? data.peakLon.value : this.peakLon,
      peakElevation: data.peakElevation.present
          ? data.peakElevation.value
          : this.peakElevation,
      state: data.state.present ? data.state.value : this.state,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      startLat: data.startLat.present ? data.startLat.value : this.startLat,
      startLon: data.startLon.present ? data.startLon.value : this.startLon,
      startAccuracyM: data.startAccuracyM.present
          ? data.startAccuracyM.value
          : this.startAccuracyM,
      climbedAt: data.climbedAt.present ? data.climbedAt.value : this.climbedAt,
      durationS: data.durationS.present ? data.durationS.value : this.durationS,
      source: data.source.present ? data.source.value : this.source,
      toleranceM: data.toleranceM.present
          ? data.toleranceM.value
          : this.toleranceM,
      estimatedLat: data.estimatedLat.present
          ? data.estimatedLat.value
          : this.estimatedLat,
      estimatedLon: data.estimatedLon.present
          ? data.estimatedLon.value
          : this.estimatedLon,
      distanceM: data.distanceM.present ? data.distanceM.value : this.distanceM,
      estimationMethod: data.estimationMethod.present
          ? data.estimationMethod.value
          : this.estimationMethod,
      coverPhotoId: data.coverPhotoId.present
          ? data.coverPhotoId.value
          : this.coverPhotoId,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RouteRow(')
          ..write('id: $id, ')
          ..write('expeditionId: $expeditionId, ')
          ..write('peakOsmId: $peakOsmId, ')
          ..write('peakName: $peakName, ')
          ..write('peakLat: $peakLat, ')
          ..write('peakLon: $peakLon, ')
          ..write('peakElevation: $peakElevation, ')
          ..write('state: $state, ')
          ..write('createdAt: $createdAt, ')
          ..write('startedAt: $startedAt, ')
          ..write('startLat: $startLat, ')
          ..write('startLon: $startLon, ')
          ..write('startAccuracyM: $startAccuracyM, ')
          ..write('climbedAt: $climbedAt, ')
          ..write('durationS: $durationS, ')
          ..write('source: $source, ')
          ..write('toleranceM: $toleranceM, ')
          ..write('estimatedLat: $estimatedLat, ')
          ..write('estimatedLon: $estimatedLon, ')
          ..write('distanceM: $distanceM, ')
          ..write('estimationMethod: $estimationMethod, ')
          ..write('coverPhotoId: $coverPhotoId, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    expeditionId,
    peakOsmId,
    peakName,
    peakLat,
    peakLon,
    peakElevation,
    state,
    createdAt,
    startedAt,
    startLat,
    startLon,
    startAccuracyM,
    climbedAt,
    durationS,
    source,
    toleranceM,
    estimatedLat,
    estimatedLon,
    distanceM,
    estimationMethod,
    coverPhotoId,
    notes,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RouteRow &&
          other.id == this.id &&
          other.expeditionId == this.expeditionId &&
          other.peakOsmId == this.peakOsmId &&
          other.peakName == this.peakName &&
          other.peakLat == this.peakLat &&
          other.peakLon == this.peakLon &&
          other.peakElevation == this.peakElevation &&
          other.state == this.state &&
          other.createdAt == this.createdAt &&
          other.startedAt == this.startedAt &&
          other.startLat == this.startLat &&
          other.startLon == this.startLon &&
          other.startAccuracyM == this.startAccuracyM &&
          other.climbedAt == this.climbedAt &&
          other.durationS == this.durationS &&
          other.source == this.source &&
          other.toleranceM == this.toleranceM &&
          other.estimatedLat == this.estimatedLat &&
          other.estimatedLon == this.estimatedLon &&
          other.distanceM == this.distanceM &&
          other.estimationMethod == this.estimationMethod &&
          other.coverPhotoId == this.coverPhotoId &&
          other.notes == this.notes);
}

class RoutesCompanion extends UpdateCompanion<RouteRow> {
  final Value<String> id;
  final Value<String> expeditionId;
  final Value<int> peakOsmId;
  final Value<String> peakName;
  final Value<double> peakLat;
  final Value<double> peakLon;
  final Value<double?> peakElevation;
  final Value<RouteState> state;
  final Value<DateTime> createdAt;
  final Value<DateTime?> startedAt;
  final Value<double?> startLat;
  final Value<double?> startLon;
  final Value<double?> startAccuracyM;
  final Value<DateTime?> climbedAt;
  final Value<int?> durationS;
  final Value<RouteSource> source;
  final Value<double?> toleranceM;
  final Value<double?> estimatedLat;
  final Value<double?> estimatedLon;
  final Value<double?> distanceM;
  final Value<EstimationMethod?> estimationMethod;
  final Value<String?> coverPhotoId;
  final Value<String?> notes;
  final Value<int> rowid;
  const RoutesCompanion({
    this.id = const Value.absent(),
    this.expeditionId = const Value.absent(),
    this.peakOsmId = const Value.absent(),
    this.peakName = const Value.absent(),
    this.peakLat = const Value.absent(),
    this.peakLon = const Value.absent(),
    this.peakElevation = const Value.absent(),
    this.state = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.startLat = const Value.absent(),
    this.startLon = const Value.absent(),
    this.startAccuracyM = const Value.absent(),
    this.climbedAt = const Value.absent(),
    this.durationS = const Value.absent(),
    this.source = const Value.absent(),
    this.toleranceM = const Value.absent(),
    this.estimatedLat = const Value.absent(),
    this.estimatedLon = const Value.absent(),
    this.distanceM = const Value.absent(),
    this.estimationMethod = const Value.absent(),
    this.coverPhotoId = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoutesCompanion.insert({
    required String id,
    required String expeditionId,
    required int peakOsmId,
    required String peakName,
    required double peakLat,
    required double peakLon,
    this.peakElevation = const Value.absent(),
    required RouteState state,
    required DateTime createdAt,
    this.startedAt = const Value.absent(),
    this.startLat = const Value.absent(),
    this.startLon = const Value.absent(),
    this.startAccuracyM = const Value.absent(),
    this.climbedAt = const Value.absent(),
    this.durationS = const Value.absent(),
    required RouteSource source,
    this.toleranceM = const Value.absent(),
    this.estimatedLat = const Value.absent(),
    this.estimatedLon = const Value.absent(),
    this.distanceM = const Value.absent(),
    this.estimationMethod = const Value.absent(),
    this.coverPhotoId = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       expeditionId = Value(expeditionId),
       peakOsmId = Value(peakOsmId),
       peakName = Value(peakName),
       peakLat = Value(peakLat),
       peakLon = Value(peakLon),
       state = Value(state),
       createdAt = Value(createdAt),
       source = Value(source);
  static Insertable<RouteRow> custom({
    Expression<String>? id,
    Expression<String>? expeditionId,
    Expression<int>? peakOsmId,
    Expression<String>? peakName,
    Expression<double>? peakLat,
    Expression<double>? peakLon,
    Expression<double>? peakElevation,
    Expression<String>? state,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? startedAt,
    Expression<double>? startLat,
    Expression<double>? startLon,
    Expression<double>? startAccuracyM,
    Expression<DateTime>? climbedAt,
    Expression<int>? durationS,
    Expression<String>? source,
    Expression<double>? toleranceM,
    Expression<double>? estimatedLat,
    Expression<double>? estimatedLon,
    Expression<double>? distanceM,
    Expression<String>? estimationMethod,
    Expression<String>? coverPhotoId,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (expeditionId != null) 'expedition_id': expeditionId,
      if (peakOsmId != null) 'peak_osm_id': peakOsmId,
      if (peakName != null) 'peak_name': peakName,
      if (peakLat != null) 'peak_lat': peakLat,
      if (peakLon != null) 'peak_lon': peakLon,
      if (peakElevation != null) 'peak_elevation': peakElevation,
      if (state != null) 'state': state,
      if (createdAt != null) 'created_at': createdAt,
      if (startedAt != null) 'started_at': startedAt,
      if (startLat != null) 'start_lat': startLat,
      if (startLon != null) 'start_lon': startLon,
      if (startAccuracyM != null) 'start_accuracy_m': startAccuracyM,
      if (climbedAt != null) 'climbed_at': climbedAt,
      if (durationS != null) 'duration_s': durationS,
      if (source != null) 'source': source,
      if (toleranceM != null) 'tolerance_m': toleranceM,
      if (estimatedLat != null) 'estimated_lat': estimatedLat,
      if (estimatedLon != null) 'estimated_lon': estimatedLon,
      if (distanceM != null) 'distance_m': distanceM,
      if (estimationMethod != null) 'estimation_method': estimationMethod,
      if (coverPhotoId != null) 'cover_photo_id': coverPhotoId,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoutesCompanion copyWith({
    Value<String>? id,
    Value<String>? expeditionId,
    Value<int>? peakOsmId,
    Value<String>? peakName,
    Value<double>? peakLat,
    Value<double>? peakLon,
    Value<double?>? peakElevation,
    Value<RouteState>? state,
    Value<DateTime>? createdAt,
    Value<DateTime?>? startedAt,
    Value<double?>? startLat,
    Value<double?>? startLon,
    Value<double?>? startAccuracyM,
    Value<DateTime?>? climbedAt,
    Value<int?>? durationS,
    Value<RouteSource>? source,
    Value<double?>? toleranceM,
    Value<double?>? estimatedLat,
    Value<double?>? estimatedLon,
    Value<double?>? distanceM,
    Value<EstimationMethod?>? estimationMethod,
    Value<String?>? coverPhotoId,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return RoutesCompanion(
      id: id ?? this.id,
      expeditionId: expeditionId ?? this.expeditionId,
      peakOsmId: peakOsmId ?? this.peakOsmId,
      peakName: peakName ?? this.peakName,
      peakLat: peakLat ?? this.peakLat,
      peakLon: peakLon ?? this.peakLon,
      peakElevation: peakElevation ?? this.peakElevation,
      state: state ?? this.state,
      createdAt: createdAt ?? this.createdAt,
      startedAt: startedAt ?? this.startedAt,
      startLat: startLat ?? this.startLat,
      startLon: startLon ?? this.startLon,
      startAccuracyM: startAccuracyM ?? this.startAccuracyM,
      climbedAt: climbedAt ?? this.climbedAt,
      durationS: durationS ?? this.durationS,
      source: source ?? this.source,
      toleranceM: toleranceM ?? this.toleranceM,
      estimatedLat: estimatedLat ?? this.estimatedLat,
      estimatedLon: estimatedLon ?? this.estimatedLon,
      distanceM: distanceM ?? this.distanceM,
      estimationMethod: estimationMethod ?? this.estimationMethod,
      coverPhotoId: coverPhotoId ?? this.coverPhotoId,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (expeditionId.present) {
      map['expedition_id'] = Variable<String>(expeditionId.value);
    }
    if (peakOsmId.present) {
      map['peak_osm_id'] = Variable<int>(peakOsmId.value);
    }
    if (peakName.present) {
      map['peak_name'] = Variable<String>(peakName.value);
    }
    if (peakLat.present) {
      map['peak_lat'] = Variable<double>(peakLat.value);
    }
    if (peakLon.present) {
      map['peak_lon'] = Variable<double>(peakLon.value);
    }
    if (peakElevation.present) {
      map['peak_elevation'] = Variable<double>(peakElevation.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(
        $RoutesTable.$converterstate.toSql(state.value),
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (startLat.present) {
      map['start_lat'] = Variable<double>(startLat.value);
    }
    if (startLon.present) {
      map['start_lon'] = Variable<double>(startLon.value);
    }
    if (startAccuracyM.present) {
      map['start_accuracy_m'] = Variable<double>(startAccuracyM.value);
    }
    if (climbedAt.present) {
      map['climbed_at'] = Variable<DateTime>(climbedAt.value);
    }
    if (durationS.present) {
      map['duration_s'] = Variable<int>(durationS.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(
        $RoutesTable.$convertersource.toSql(source.value),
      );
    }
    if (toleranceM.present) {
      map['tolerance_m'] = Variable<double>(toleranceM.value);
    }
    if (estimatedLat.present) {
      map['estimated_lat'] = Variable<double>(estimatedLat.value);
    }
    if (estimatedLon.present) {
      map['estimated_lon'] = Variable<double>(estimatedLon.value);
    }
    if (distanceM.present) {
      map['distance_m'] = Variable<double>(distanceM.value);
    }
    if (estimationMethod.present) {
      map['estimation_method'] = Variable<String>(
        $RoutesTable.$converterestimationMethodn.toSql(estimationMethod.value),
      );
    }
    if (coverPhotoId.present) {
      map['cover_photo_id'] = Variable<String>(coverPhotoId.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutesCompanion(')
          ..write('id: $id, ')
          ..write('expeditionId: $expeditionId, ')
          ..write('peakOsmId: $peakOsmId, ')
          ..write('peakName: $peakName, ')
          ..write('peakLat: $peakLat, ')
          ..write('peakLon: $peakLon, ')
          ..write('peakElevation: $peakElevation, ')
          ..write('state: $state, ')
          ..write('createdAt: $createdAt, ')
          ..write('startedAt: $startedAt, ')
          ..write('startLat: $startLat, ')
          ..write('startLon: $startLon, ')
          ..write('startAccuracyM: $startAccuracyM, ')
          ..write('climbedAt: $climbedAt, ')
          ..write('durationS: $durationS, ')
          ..write('source: $source, ')
          ..write('toleranceM: $toleranceM, ')
          ..write('estimatedLat: $estimatedLat, ')
          ..write('estimatedLon: $estimatedLon, ')
          ..write('distanceM: $distanceM, ')
          ..write('estimationMethod: $estimationMethod, ')
          ..write('coverPhotoId: $coverPhotoId, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ExpeditionsTable expeditions = $ExpeditionsTable(this);
  late final $RoutesTable routes = $RoutesTable(this);
  late final Index routesExpeditionId = Index(
    'routes_expedition_id',
    'CREATE INDEX routes_expedition_id ON routes (expedition_id)',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    expeditions,
    routes,
    routesExpeditionId,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'expeditions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('routes', kind: UpdateKind.delete)],
    ),
  ]);
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

final class $$ExpeditionsTableReferences
    extends BaseReferences<_$AppDatabase, $ExpeditionsTable, ExpeditionRow> {
  $$ExpeditionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RoutesTable, List<RouteRow>> _routesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.routes,
    aliasName: 'expeditions__id__routes__expedition_id',
  );

  $$RoutesTableProcessedTableManager get routesRefs {
    final manager = $$RoutesTableTableManager(
      $_db,
      $_db.routes,
    ).filter((f) => f.expeditionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_routesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

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

  Expression<bool> routesRefs(
    Expression<bool> Function($$RoutesTableFilterComposer f) f,
  ) {
    final $$RoutesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.routes,
      getReferencedColumn: (t) => t.expeditionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutesTableFilterComposer(
            $db: $db,
            $table: $db.routes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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

  Expression<T> routesRefs<T extends Object>(
    Expression<T> Function($$RoutesTableAnnotationComposer a) f,
  ) {
    final $$RoutesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.routes,
      getReferencedColumn: (t) => t.expeditionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutesTableAnnotationComposer(
            $db: $db,
            $table: $db.routes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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
          (ExpeditionRow, $$ExpeditionsTableReferences),
          ExpeditionRow,
          PrefetchHooks Function({bool routesRefs})
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
                  $$ExpeditionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({routesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (routesRefs) db.routes],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (routesRefs)
                    await $_getPrefetchedDataByColumns<
                      ExpeditionRow,
                      $ExpeditionsTable,
                      RouteRow,
                      $RoutesTable
                    >(
                      currentTable: table,
                      referencedTable: $$ExpeditionsTableReferences
                          ._routesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ExpeditionsTableReferences(
                            db,
                            table,
                            p0,
                          ).routesRefs,
                      currentColumn: 'id',
                      referencedColumn: 'expedition_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
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
      (ExpeditionRow, $$ExpeditionsTableReferences),
      ExpeditionRow,
      PrefetchHooks Function({bool routesRefs})
    >;
typedef $$RoutesTableCreateCompanionBuilder = RoutesCompanion Function({
  required String id,
  required String expeditionId,
  required int peakOsmId,
  required String peakName,
  required double peakLat,
  required double peakLon,
  Value<double?> peakElevation,
  required RouteState state,
  required DateTime createdAt,
  Value<DateTime?> startedAt,
  Value<double?> startLat,
  Value<double?> startLon,
  Value<double?> startAccuracyM,
  Value<DateTime?> climbedAt,
  Value<int?> durationS,
  required RouteSource source,
  Value<double?> toleranceM,
  Value<double?> estimatedLat,
  Value<double?> estimatedLon,
  Value<double?> distanceM,
  Value<EstimationMethod?> estimationMethod,
  Value<String?> coverPhotoId,
  Value<String?> notes,
  Value<int> rowid,
});
typedef $$RoutesTableUpdateCompanionBuilder = RoutesCompanion Function({
  Value<String> id,
  Value<String> expeditionId,
  Value<int> peakOsmId,
  Value<String> peakName,
  Value<double> peakLat,
  Value<double> peakLon,
  Value<double?> peakElevation,
  Value<RouteState> state,
  Value<DateTime> createdAt,
  Value<DateTime?> startedAt,
  Value<double?> startLat,
  Value<double?> startLon,
  Value<double?> startAccuracyM,
  Value<DateTime?> climbedAt,
  Value<int?> durationS,
  Value<RouteSource> source,
  Value<double?> toleranceM,
  Value<double?> estimatedLat,
  Value<double?> estimatedLon,
  Value<double?> distanceM,
  Value<EstimationMethod?> estimationMethod,
  Value<String?> coverPhotoId,
  Value<String?> notes,
  Value<int> rowid,
});

final class $$RoutesTableReferences
    extends BaseReferences<_$AppDatabase, $RoutesTable, RouteRow> {
  $$RoutesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ExpeditionsTable _expeditionIdTable(_$AppDatabase db) =>
      db.expeditions.createAlias('routes__expedition_id__expeditions__id');

  $$ExpeditionsTableProcessedTableManager get expeditionId {
    final $_column = $_itemColumn<String>('expedition_id')!;

    final manager = $$ExpeditionsTableTableManager(
      $_db,
      $_db.expeditions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_expeditionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RoutesTableFilterComposer
    extends Composer<_$AppDatabase, $RoutesTable> {
  $$RoutesTableFilterComposer({
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

  ColumnFilters<int> get peakOsmId => $composableBuilder(
    column: $table.peakOsmId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get peakName => $composableBuilder(
    column: $table.peakName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get peakLat => $composableBuilder(
    column: $table.peakLat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get peakLon => $composableBuilder(
    column: $table.peakLon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get peakElevation => $composableBuilder(
    column: $table.peakElevation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<RouteState, RouteState, String> get state =>
      $composableBuilder(
        column: $table.state,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get startLat => $composableBuilder(
    column: $table.startLat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get startLon => $composableBuilder(
    column: $table.startLon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get startAccuracyM => $composableBuilder(
    column: $table.startAccuracyM,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get climbedAt => $composableBuilder(
    column: $table.climbedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationS => $composableBuilder(
    column: $table.durationS,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<RouteSource, RouteSource, String> get source =>
      $composableBuilder(
        column: $table.source,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<double> get toleranceM => $composableBuilder(
    column: $table.toleranceM,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get estimatedLat => $composableBuilder(
    column: $table.estimatedLat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get estimatedLon => $composableBuilder(
    column: $table.estimatedLon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get distanceM => $composableBuilder(
    column: $table.distanceM,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<EstimationMethod?, EstimationMethod, String>
  get estimationMethod => $composableBuilder(
    column: $table.estimationMethod,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get coverPhotoId => $composableBuilder(
    column: $table.coverPhotoId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  $$ExpeditionsTableFilterComposer get expeditionId {
    final $$ExpeditionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.expeditionId,
      referencedTable: $db.expeditions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExpeditionsTableFilterComposer(
            $db: $db,
            $table: $db.expeditions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RoutesTableOrderingComposer
    extends Composer<_$AppDatabase, $RoutesTable> {
  $$RoutesTableOrderingComposer({
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

  ColumnOrderings<int> get peakOsmId => $composableBuilder(
    column: $table.peakOsmId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get peakName => $composableBuilder(
    column: $table.peakName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get peakLat => $composableBuilder(
    column: $table.peakLat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get peakLon => $composableBuilder(
    column: $table.peakLon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get peakElevation => $composableBuilder(
    column: $table.peakElevation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get startLat => $composableBuilder(
    column: $table.startLat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get startLon => $composableBuilder(
    column: $table.startLon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get startAccuracyM => $composableBuilder(
    column: $table.startAccuracyM,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get climbedAt => $composableBuilder(
    column: $table.climbedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationS => $composableBuilder(
    column: $table.durationS,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get toleranceM => $composableBuilder(
    column: $table.toleranceM,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get estimatedLat => $composableBuilder(
    column: $table.estimatedLat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get estimatedLon => $composableBuilder(
    column: $table.estimatedLon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get distanceM => $composableBuilder(
    column: $table.distanceM,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get estimationMethod => $composableBuilder(
    column: $table.estimationMethod,
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

  $$ExpeditionsTableOrderingComposer get expeditionId {
    final $$ExpeditionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.expeditionId,
      referencedTable: $db.expeditions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExpeditionsTableOrderingComposer(
            $db: $db,
            $table: $db.expeditions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RoutesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoutesTable> {
  $$RoutesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get peakOsmId =>
      $composableBuilder(column: $table.peakOsmId, builder: (column) => column);

  GeneratedColumn<String> get peakName =>
      $composableBuilder(column: $table.peakName, builder: (column) => column);

  GeneratedColumn<double> get peakLat =>
      $composableBuilder(column: $table.peakLat, builder: (column) => column);

  GeneratedColumn<double> get peakLon =>
      $composableBuilder(column: $table.peakLon, builder: (column) => column);

  GeneratedColumn<double> get peakElevation => $composableBuilder(
    column: $table.peakElevation,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<RouteState, String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<double> get startLat =>
      $composableBuilder(column: $table.startLat, builder: (column) => column);

  GeneratedColumn<double> get startLon =>
      $composableBuilder(column: $table.startLon, builder: (column) => column);

  GeneratedColumn<double> get startAccuracyM => $composableBuilder(
    column: $table.startAccuracyM,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get climbedAt =>
      $composableBuilder(column: $table.climbedAt, builder: (column) => column);

  GeneratedColumn<int> get durationS =>
      $composableBuilder(column: $table.durationS, builder: (column) => column);

  GeneratedColumnWithTypeConverter<RouteSource, String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<double> get toleranceM => $composableBuilder(
    column: $table.toleranceM,
    builder: (column) => column,
  );

  GeneratedColumn<double> get estimatedLat => $composableBuilder(
    column: $table.estimatedLat,
    builder: (column) => column,
  );

  GeneratedColumn<double> get estimatedLon => $composableBuilder(
    column: $table.estimatedLon,
    builder: (column) => column,
  );

  GeneratedColumn<double> get distanceM =>
      $composableBuilder(column: $table.distanceM, builder: (column) => column);

  GeneratedColumnWithTypeConverter<EstimationMethod?, String>
  get estimationMethod => $composableBuilder(
    column: $table.estimationMethod,
    builder: (column) => column,
  );

  GeneratedColumn<String> get coverPhotoId => $composableBuilder(
    column: $table.coverPhotoId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$ExpeditionsTableAnnotationComposer get expeditionId {
    final $$ExpeditionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.expeditionId,
      referencedTable: $db.expeditions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExpeditionsTableAnnotationComposer(
            $db: $db,
            $table: $db.expeditions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RoutesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RoutesTable,
          RouteRow,
          $$RoutesTableFilterComposer,
          $$RoutesTableOrderingComposer,
          $$RoutesTableAnnotationComposer,
          $$RoutesTableCreateCompanionBuilder,
          $$RoutesTableUpdateCompanionBuilder,
          (RouteRow, $$RoutesTableReferences),
          RouteRow,
          PrefetchHooks Function({bool expeditionId})
        > {
  $$RoutesTableTableManager(_$AppDatabase db, $RoutesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoutesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoutesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoutesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> expeditionId = const Value.absent(),
                Value<int> peakOsmId = const Value.absent(),
                Value<String> peakName = const Value.absent(),
                Value<double> peakLat = const Value.absent(),
                Value<double> peakLon = const Value.absent(),
                Value<double?> peakElevation = const Value.absent(),
                Value<RouteState> state = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> startedAt = const Value.absent(),
                Value<double?> startLat = const Value.absent(),
                Value<double?> startLon = const Value.absent(),
                Value<double?> startAccuracyM = const Value.absent(),
                Value<DateTime?> climbedAt = const Value.absent(),
                Value<int?> durationS = const Value.absent(),
                Value<RouteSource> source = const Value.absent(),
                Value<double?> toleranceM = const Value.absent(),
                Value<double?> estimatedLat = const Value.absent(),
                Value<double?> estimatedLon = const Value.absent(),
                Value<double?> distanceM = const Value.absent(),
                Value<EstimationMethod?> estimationMethod =
                    const Value.absent(),
                Value<String?> coverPhotoId = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoutesCompanion(
                id: id,
                expeditionId: expeditionId,
                peakOsmId: peakOsmId,
                peakName: peakName,
                peakLat: peakLat,
                peakLon: peakLon,
                peakElevation: peakElevation,
                state: state,
                createdAt: createdAt,
                startedAt: startedAt,
                startLat: startLat,
                startLon: startLon,
                startAccuracyM: startAccuracyM,
                climbedAt: climbedAt,
                durationS: durationS,
                source: source,
                toleranceM: toleranceM,
                estimatedLat: estimatedLat,
                estimatedLon: estimatedLon,
                distanceM: distanceM,
                estimationMethod: estimationMethod,
                coverPhotoId: coverPhotoId,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String expeditionId,
                required int peakOsmId,
                required String peakName,
                required double peakLat,
                required double peakLon,
                Value<double?> peakElevation = const Value.absent(),
                required RouteState state,
                required DateTime createdAt,
                Value<DateTime?> startedAt = const Value.absent(),
                Value<double?> startLat = const Value.absent(),
                Value<double?> startLon = const Value.absent(),
                Value<double?> startAccuracyM = const Value.absent(),
                Value<DateTime?> climbedAt = const Value.absent(),
                Value<int?> durationS = const Value.absent(),
                required RouteSource source,
                Value<double?> toleranceM = const Value.absent(),
                Value<double?> estimatedLat = const Value.absent(),
                Value<double?> estimatedLon = const Value.absent(),
                Value<double?> distanceM = const Value.absent(),
                Value<EstimationMethod?> estimationMethod =
                    const Value.absent(),
                Value<String?> coverPhotoId = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoutesCompanion.insert(
                id: id,
                expeditionId: expeditionId,
                peakOsmId: peakOsmId,
                peakName: peakName,
                peakLat: peakLat,
                peakLon: peakLon,
                peakElevation: peakElevation,
                state: state,
                createdAt: createdAt,
                startedAt: startedAt,
                startLat: startLat,
                startLon: startLon,
                startAccuracyM: startAccuracyM,
                climbedAt: climbedAt,
                durationS: durationS,
                source: source,
                toleranceM: toleranceM,
                estimatedLat: estimatedLat,
                estimatedLon: estimatedLon,
                distanceM: distanceM,
                estimationMethod: estimationMethod,
                coverPhotoId: coverPhotoId,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$RoutesTable, RouteRow>(table),
                  $$RoutesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({expeditionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (expeditionId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.expeditionId,
                        referencedTable: $$RoutesTableReferences
                            ._expeditionIdTable(db),
                        referencedColumn: $$RoutesTableReferences
                            ._expeditionIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RoutesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RoutesTable,
      RouteRow,
      $$RoutesTableFilterComposer,
      $$RoutesTableOrderingComposer,
      $$RoutesTableAnnotationComposer,
      $$RoutesTableCreateCompanionBuilder,
      $$RoutesTableUpdateCompanionBuilder,
      (RouteRow, $$RoutesTableReferences),
      RouteRow,
      PrefetchHooks Function({bool expeditionId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ExpeditionsTableTableManager get expeditions =>
      $$ExpeditionsTableTableManager(_db, _db.expeditions);
  $$RoutesTableTableManager get routes =>
      $$RoutesTableTableManager(_db, _db.routes);
}
