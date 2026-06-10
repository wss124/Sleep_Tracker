// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $RegistroSonoTable extends RegistroSono
    with TableInfo<$RegistroSonoTable, RegistroSonoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RegistroSonoTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
    'data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _horasMeta = const VerificationMeta('horas');
  @override
  late final GeneratedColumn<int> horas = GeneratedColumn<int>(
    'horas',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _minutosMeta = const VerificationMeta(
    'minutos',
  );
  @override
  late final GeneratedColumn<int> minutos = GeneratedColumn<int>(
    'minutos',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, data, horas, minutos];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'registro_sono';
  @override
  VerificationContext validateIntegrity(
    Insertable<RegistroSonoData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('data')) {
      context.handle(
        _dataMeta,
        this.data.isAcceptableOrUnknown(data['data']!, _dataMeta),
      );
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('horas')) {
      context.handle(
        _horasMeta,
        horas.isAcceptableOrUnknown(data['horas']!, _horasMeta),
      );
    } else if (isInserting) {
      context.missing(_horasMeta);
    }
    if (data.containsKey('minutos')) {
      context.handle(
        _minutosMeta,
        minutos.isAcceptableOrUnknown(data['minutos']!, _minutosMeta),
      );
    } else if (isInserting) {
      context.missing(_minutosMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RegistroSonoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RegistroSonoData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      data:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}data'],
          )!,
      horas:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}horas'],
          )!,
      minutos:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}minutos'],
          )!,
    );
  }

  @override
  $RegistroSonoTable createAlias(String alias) {
    return $RegistroSonoTable(attachedDatabase, alias);
  }
}

class RegistroSonoData extends DataClass
    implements Insertable<RegistroSonoData> {
  final int id;
  final String data;
  final int horas;
  final int minutos;
  const RegistroSonoData({
    required this.id,
    required this.data,
    required this.horas,
    required this.minutos,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['data'] = Variable<String>(data);
    map['horas'] = Variable<int>(horas);
    map['minutos'] = Variable<int>(minutos);
    return map;
  }

  RegistroSonoCompanion toCompanion(bool nullToAbsent) {
    return RegistroSonoCompanion(
      id: Value(id),
      data: Value(data),
      horas: Value(horas),
      minutos: Value(minutos),
    );
  }

  factory RegistroSonoData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RegistroSonoData(
      id: serializer.fromJson<int>(json['id']),
      data: serializer.fromJson<String>(json['data']),
      horas: serializer.fromJson<int>(json['horas']),
      minutos: serializer.fromJson<int>(json['minutos']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'data': serializer.toJson<String>(data),
      'horas': serializer.toJson<int>(horas),
      'minutos': serializer.toJson<int>(minutos),
    };
  }

  RegistroSonoData copyWith({
    int? id,
    String? data,
    int? horas,
    int? minutos,
  }) => RegistroSonoData(
    id: id ?? this.id,
    data: data ?? this.data,
    horas: horas ?? this.horas,
    minutos: minutos ?? this.minutos,
  );
  RegistroSonoData copyWithCompanion(RegistroSonoCompanion data) {
    return RegistroSonoData(
      id: data.id.present ? data.id.value : this.id,
      data: data.data.present ? data.data.value : this.data,
      horas: data.horas.present ? data.horas.value : this.horas,
      minutos: data.minutos.present ? data.minutos.value : this.minutos,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RegistroSonoData(')
          ..write('id: $id, ')
          ..write('data: $data, ')
          ..write('horas: $horas, ')
          ..write('minutos: $minutos')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, data, horas, minutos);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RegistroSonoData &&
          other.id == this.id &&
          other.data == this.data &&
          other.horas == this.horas &&
          other.minutos == this.minutos);
}

class RegistroSonoCompanion extends UpdateCompanion<RegistroSonoData> {
  final Value<int> id;
  final Value<String> data;
  final Value<int> horas;
  final Value<int> minutos;
  const RegistroSonoCompanion({
    this.id = const Value.absent(),
    this.data = const Value.absent(),
    this.horas = const Value.absent(),
    this.minutos = const Value.absent(),
  });
  RegistroSonoCompanion.insert({
    this.id = const Value.absent(),
    required String data,
    required int horas,
    required int minutos,
  }) : data = Value(data),
       horas = Value(horas),
       minutos = Value(minutos);
  static Insertable<RegistroSonoData> custom({
    Expression<int>? id,
    Expression<String>? data,
    Expression<int>? horas,
    Expression<int>? minutos,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (data != null) 'data': data,
      if (horas != null) 'horas': horas,
      if (minutos != null) 'minutos': minutos,
    });
  }

  RegistroSonoCompanion copyWith({
    Value<int>? id,
    Value<String>? data,
    Value<int>? horas,
    Value<int>? minutos,
  }) {
    return RegistroSonoCompanion(
      id: id ?? this.id,
      data: data ?? this.data,
      horas: horas ?? this.horas,
      minutos: minutos ?? this.minutos,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (horas.present) {
      map['horas'] = Variable<int>(horas.value);
    }
    if (minutos.present) {
      map['minutos'] = Variable<int>(minutos.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RegistroSonoCompanion(')
          ..write('id: $id, ')
          ..write('data: $data, ')
          ..write('horas: $horas, ')
          ..write('minutos: $minutos')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $RegistroSonoTable registroSono = $RegistroSonoTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [registroSono];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$RegistroSonoTableCreateCompanionBuilder =
    RegistroSonoCompanion Function({
      Value<int> id,
      required String data,
      required int horas,
      required int minutos,
    });
typedef $$RegistroSonoTableUpdateCompanionBuilder =
    RegistroSonoCompanion Function({
      Value<int> id,
      Value<String> data,
      Value<int> horas,
      Value<int> minutos,
    });

class $$RegistroSonoTableFilterComposer
    extends Composer<_$AppDatabase, $RegistroSonoTable> {
  $$RegistroSonoTableFilterComposer({
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

  ColumnFilters<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get horas => $composableBuilder(
    column: $table.horas,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get minutos => $composableBuilder(
    column: $table.minutos,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RegistroSonoTableOrderingComposer
    extends Composer<_$AppDatabase, $RegistroSonoTable> {
  $$RegistroSonoTableOrderingComposer({
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

  ColumnOrderings<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get horas => $composableBuilder(
    column: $table.horas,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get minutos => $composableBuilder(
    column: $table.minutos,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RegistroSonoTableAnnotationComposer
    extends Composer<_$AppDatabase, $RegistroSonoTable> {
  $$RegistroSonoTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<int> get horas =>
      $composableBuilder(column: $table.horas, builder: (column) => column);

  GeneratedColumn<int> get minutos =>
      $composableBuilder(column: $table.minutos, builder: (column) => column);
}

class $$RegistroSonoTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RegistroSonoTable,
          RegistroSonoData,
          $$RegistroSonoTableFilterComposer,
          $$RegistroSonoTableOrderingComposer,
          $$RegistroSonoTableAnnotationComposer,
          $$RegistroSonoTableCreateCompanionBuilder,
          $$RegistroSonoTableUpdateCompanionBuilder,
          (
            RegistroSonoData,
            BaseReferences<_$AppDatabase, $RegistroSonoTable, RegistroSonoData>,
          ),
          RegistroSonoData,
          PrefetchHooks Function()
        > {
  $$RegistroSonoTableTableManager(_$AppDatabase db, $RegistroSonoTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$RegistroSonoTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$RegistroSonoTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$RegistroSonoTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> data = const Value.absent(),
                Value<int> horas = const Value.absent(),
                Value<int> minutos = const Value.absent(),
              }) => RegistroSonoCompanion(
                id: id,
                data: data,
                horas: horas,
                minutos: minutos,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String data,
                required int horas,
                required int minutos,
              }) => RegistroSonoCompanion.insert(
                id: id,
                data: data,
                horas: horas,
                minutos: minutos,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RegistroSonoTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RegistroSonoTable,
      RegistroSonoData,
      $$RegistroSonoTableFilterComposer,
      $$RegistroSonoTableOrderingComposer,
      $$RegistroSonoTableAnnotationComposer,
      $$RegistroSonoTableCreateCompanionBuilder,
      $$RegistroSonoTableUpdateCompanionBuilder,
      (
        RegistroSonoData,
        BaseReferences<_$AppDatabase, $RegistroSonoTable, RegistroSonoData>,
      ),
      RegistroSonoData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$RegistroSonoTableTableManager get registroSono =>
      $$RegistroSonoTableTableManager(_db, _db.registroSono);
}
