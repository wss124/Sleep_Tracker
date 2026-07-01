// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CategoriaSonoTable extends CategoriaSono
    with TableInfo<$CategoriaSonoTable, CategoriaSonoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriaSonoTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
    'nome',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconeMeta = const VerificationMeta('icone');
  @override
  late final GeneratedColumn<String> icone = GeneratedColumn<String>(
    'icone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, nome, icone];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categoria_sono';
  @override
  VerificationContext validateIntegrity(
    Insertable<CategoriaSonoData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nome')) {
      context.handle(
        _nomeMeta,
        nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta),
      );
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('icone')) {
      context.handle(
        _iconeMeta,
        icone.isAcceptableOrUnknown(data['icone']!, _iconeMeta),
      );
    } else if (isInserting) {
      context.missing(_iconeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoriaSonoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoriaSonoData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      nome:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}nome'],
          )!,
      icone:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}icone'],
          )!,
    );
  }

  @override
  $CategoriaSonoTable createAlias(String alias) {
    return $CategoriaSonoTable(attachedDatabase, alias);
  }
}

class CategoriaSonoData extends DataClass
    implements Insertable<CategoriaSonoData> {
  final int id;
  final String nome;
  final String icone;
  const CategoriaSonoData({
    required this.id,
    required this.nome,
    required this.icone,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nome'] = Variable<String>(nome);
    map['icone'] = Variable<String>(icone);
    return map;
  }

  CategoriaSonoCompanion toCompanion(bool nullToAbsent) {
    return CategoriaSonoCompanion(
      id: Value(id),
      nome: Value(nome),
      icone: Value(icone),
    );
  }

  factory CategoriaSonoData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoriaSonoData(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      icone: serializer.fromJson<String>(json['icone']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
      'icone': serializer.toJson<String>(icone),
    };
  }

  CategoriaSonoData copyWith({int? id, String? nome, String? icone}) =>
      CategoriaSonoData(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        icone: icone ?? this.icone,
      );
  CategoriaSonoData copyWithCompanion(CategoriaSonoCompanion data) {
    return CategoriaSonoData(
      id: data.id.present ? data.id.value : this.id,
      nome: data.nome.present ? data.nome.value : this.nome,
      icone: data.icone.present ? data.icone.value : this.icone,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoriaSonoData(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('icone: $icone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nome, icone);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoriaSonoData &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.icone == this.icone);
}

class CategoriaSonoCompanion extends UpdateCompanion<CategoriaSonoData> {
  final Value<int> id;
  final Value<String> nome;
  final Value<String> icone;
  const CategoriaSonoCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.icone = const Value.absent(),
  });
  CategoriaSonoCompanion.insert({
    this.id = const Value.absent(),
    required String nome,
    required String icone,
  }) : nome = Value(nome),
       icone = Value(icone);
  static Insertable<CategoriaSonoData> custom({
    Expression<int>? id,
    Expression<String>? nome,
    Expression<String>? icone,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
      if (icone != null) 'icone': icone,
    });
  }

  CategoriaSonoCompanion copyWith({
    Value<int>? id,
    Value<String>? nome,
    Value<String>? icone,
  }) {
    return CategoriaSonoCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      icone: icone ?? this.icone,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (icone.present) {
      map['icone'] = Variable<String>(icone.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriaSonoCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('icone: $icone')
          ..write(')'))
        .toString();
  }
}

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
  static const VerificationMeta _categoriaIdMeta = const VerificationMeta(
    'categoriaId',
  );
  @override
  late final GeneratedColumn<int> categoriaId = GeneratedColumn<int>(
    'categoria_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categoria_sono (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, data, horas, minutos, categoriaId];
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
    if (data.containsKey('categoria_id')) {
      context.handle(
        _categoriaIdMeta,
        categoriaId.isAcceptableOrUnknown(
          data['categoria_id']!,
          _categoriaIdMeta,
        ),
      );
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
      categoriaId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}categoria_id'],
      ),
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
  final int? categoriaId;
  const RegistroSonoData({
    required this.id,
    required this.data,
    required this.horas,
    required this.minutos,
    this.categoriaId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['data'] = Variable<String>(data);
    map['horas'] = Variable<int>(horas);
    map['minutos'] = Variable<int>(minutos);
    if (!nullToAbsent || categoriaId != null) {
      map['categoria_id'] = Variable<int>(categoriaId);
    }
    return map;
  }

  RegistroSonoCompanion toCompanion(bool nullToAbsent) {
    return RegistroSonoCompanion(
      id: Value(id),
      data: Value(data),
      horas: Value(horas),
      minutos: Value(minutos),
      categoriaId:
          categoriaId == null && nullToAbsent
              ? const Value.absent()
              : Value(categoriaId),
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
      categoriaId: serializer.fromJson<int?>(json['categoriaId']),
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
      'categoriaId': serializer.toJson<int?>(categoriaId),
    };
  }

  RegistroSonoData copyWith({
    int? id,
    String? data,
    int? horas,
    int? minutos,
    Value<int?> categoriaId = const Value.absent(),
  }) => RegistroSonoData(
    id: id ?? this.id,
    data: data ?? this.data,
    horas: horas ?? this.horas,
    minutos: minutos ?? this.minutos,
    categoriaId: categoriaId.present ? categoriaId.value : this.categoriaId,
  );
  RegistroSonoData copyWithCompanion(RegistroSonoCompanion data) {
    return RegistroSonoData(
      id: data.id.present ? data.id.value : this.id,
      data: data.data.present ? data.data.value : this.data,
      horas: data.horas.present ? data.horas.value : this.horas,
      minutos: data.minutos.present ? data.minutos.value : this.minutos,
      categoriaId:
          data.categoriaId.present ? data.categoriaId.value : this.categoriaId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RegistroSonoData(')
          ..write('id: $id, ')
          ..write('data: $data, ')
          ..write('horas: $horas, ')
          ..write('minutos: $minutos, ')
          ..write('categoriaId: $categoriaId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, data, horas, minutos, categoriaId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RegistroSonoData &&
          other.id == this.id &&
          other.data == this.data &&
          other.horas == this.horas &&
          other.minutos == this.minutos &&
          other.categoriaId == this.categoriaId);
}

class RegistroSonoCompanion extends UpdateCompanion<RegistroSonoData> {
  final Value<int> id;
  final Value<String> data;
  final Value<int> horas;
  final Value<int> minutos;
  final Value<int?> categoriaId;
  const RegistroSonoCompanion({
    this.id = const Value.absent(),
    this.data = const Value.absent(),
    this.horas = const Value.absent(),
    this.minutos = const Value.absent(),
    this.categoriaId = const Value.absent(),
  });
  RegistroSonoCompanion.insert({
    this.id = const Value.absent(),
    required String data,
    required int horas,
    required int minutos,
    this.categoriaId = const Value.absent(),
  }) : data = Value(data),
       horas = Value(horas),
       minutos = Value(minutos);
  static Insertable<RegistroSonoData> custom({
    Expression<int>? id,
    Expression<String>? data,
    Expression<int>? horas,
    Expression<int>? minutos,
    Expression<int>? categoriaId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (data != null) 'data': data,
      if (horas != null) 'horas': horas,
      if (minutos != null) 'minutos': minutos,
      if (categoriaId != null) 'categoria_id': categoriaId,
    });
  }

  RegistroSonoCompanion copyWith({
    Value<int>? id,
    Value<String>? data,
    Value<int>? horas,
    Value<int>? minutos,
    Value<int?>? categoriaId,
  }) {
    return RegistroSonoCompanion(
      id: id ?? this.id,
      data: data ?? this.data,
      horas: horas ?? this.horas,
      minutos: minutos ?? this.minutos,
      categoriaId: categoriaId ?? this.categoriaId,
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
    if (categoriaId.present) {
      map['categoria_id'] = Variable<int>(categoriaId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RegistroSonoCompanion(')
          ..write('id: $id, ')
          ..write('data: $data, ')
          ..write('horas: $horas, ')
          ..write('minutos: $minutos, ')
          ..write('categoriaId: $categoriaId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CategoriaSonoTable categoriaSono = $CategoriaSonoTable(this);
  late final $RegistroSonoTable registroSono = $RegistroSonoTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    categoriaSono,
    registroSono,
  ];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$CategoriaSonoTableCreateCompanionBuilder =
    CategoriaSonoCompanion Function({
      Value<int> id,
      required String nome,
      required String icone,
    });
typedef $$CategoriaSonoTableUpdateCompanionBuilder =
    CategoriaSonoCompanion Function({
      Value<int> id,
      Value<String> nome,
      Value<String> icone,
    });

final class $$CategoriaSonoTableReferences
    extends
        BaseReferences<_$AppDatabase, $CategoriaSonoTable, CategoriaSonoData> {
  $$CategoriaSonoTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$RegistroSonoTable, List<RegistroSonoData>>
  _registroSonoRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.registroSono,
    aliasName: $_aliasNameGenerator(
      db.categoriaSono.id,
      db.registroSono.categoriaId,
    ),
  );

  $$RegistroSonoTableProcessedTableManager get registroSonoRefs {
    final manager = $$RegistroSonoTableTableManager(
      $_db,
      $_db.registroSono,
    ).filter((f) => f.categoriaId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_registroSonoRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CategoriaSonoTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriaSonoTable> {
  $$CategoriaSonoTableFilterComposer({
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

  ColumnFilters<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get icone => $composableBuilder(
    column: $table.icone,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> registroSonoRefs(
    Expression<bool> Function($$RegistroSonoTableFilterComposer f) f,
  ) {
    final $$RegistroSonoTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.registroSono,
      getReferencedColumn: (t) => t.categoriaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RegistroSonoTableFilterComposer(
            $db: $db,
            $table: $db.registroSono,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriaSonoTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriaSonoTable> {
  $$CategoriaSonoTableOrderingComposer({
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

  ColumnOrderings<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get icone => $composableBuilder(
    column: $table.icone,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoriaSonoTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriaSonoTable> {
  $$CategoriaSonoTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumn<String> get icone =>
      $composableBuilder(column: $table.icone, builder: (column) => column);

  Expression<T> registroSonoRefs<T extends Object>(
    Expression<T> Function($$RegistroSonoTableAnnotationComposer a) f,
  ) {
    final $$RegistroSonoTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.registroSono,
      getReferencedColumn: (t) => t.categoriaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RegistroSonoTableAnnotationComposer(
            $db: $db,
            $table: $db.registroSono,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriaSonoTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriaSonoTable,
          CategoriaSonoData,
          $$CategoriaSonoTableFilterComposer,
          $$CategoriaSonoTableOrderingComposer,
          $$CategoriaSonoTableAnnotationComposer,
          $$CategoriaSonoTableCreateCompanionBuilder,
          $$CategoriaSonoTableUpdateCompanionBuilder,
          (CategoriaSonoData, $$CategoriaSonoTableReferences),
          CategoriaSonoData,
          PrefetchHooks Function({bool registroSonoRefs})
        > {
  $$CategoriaSonoTableTableManager(_$AppDatabase db, $CategoriaSonoTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CategoriaSonoTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$CategoriaSonoTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$CategoriaSonoTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nome = const Value.absent(),
                Value<String> icone = const Value.absent(),
              }) => CategoriaSonoCompanion(id: id, nome: nome, icone: icone),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nome,
                required String icone,
              }) => CategoriaSonoCompanion.insert(
                id: id,
                nome: nome,
                icone: icone,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$CategoriaSonoTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({registroSonoRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (registroSonoRefs) db.registroSono],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (registroSonoRefs)
                    await $_getPrefetchedData<
                      CategoriaSonoData,
                      $CategoriaSonoTable,
                      RegistroSonoData
                    >(
                      currentTable: table,
                      referencedTable: $$CategoriaSonoTableReferences
                          ._registroSonoRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$CategoriaSonoTableReferences(
                                db,
                                table,
                                p0,
                              ).registroSonoRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.categoriaId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CategoriaSonoTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriaSonoTable,
      CategoriaSonoData,
      $$CategoriaSonoTableFilterComposer,
      $$CategoriaSonoTableOrderingComposer,
      $$CategoriaSonoTableAnnotationComposer,
      $$CategoriaSonoTableCreateCompanionBuilder,
      $$CategoriaSonoTableUpdateCompanionBuilder,
      (CategoriaSonoData, $$CategoriaSonoTableReferences),
      CategoriaSonoData,
      PrefetchHooks Function({bool registroSonoRefs})
    >;
typedef $$RegistroSonoTableCreateCompanionBuilder =
    RegistroSonoCompanion Function({
      Value<int> id,
      required String data,
      required int horas,
      required int minutos,
      Value<int?> categoriaId,
    });
typedef $$RegistroSonoTableUpdateCompanionBuilder =
    RegistroSonoCompanion Function({
      Value<int> id,
      Value<String> data,
      Value<int> horas,
      Value<int> minutos,
      Value<int?> categoriaId,
    });

final class $$RegistroSonoTableReferences
    extends
        BaseReferences<_$AppDatabase, $RegistroSonoTable, RegistroSonoData> {
  $$RegistroSonoTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CategoriaSonoTable _categoriaIdTable(_$AppDatabase db) =>
      db.categoriaSono.createAlias(
        $_aliasNameGenerator(db.registroSono.categoriaId, db.categoriaSono.id),
      );

  $$CategoriaSonoTableProcessedTableManager? get categoriaId {
    final $_column = $_itemColumn<int>('categoria_id');
    if ($_column == null) return null;
    final manager = $$CategoriaSonoTableTableManager(
      $_db,
      $_db.categoriaSono,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoriaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

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

  $$CategoriaSonoTableFilterComposer get categoriaId {
    final $$CategoriaSonoTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoriaId,
      referencedTable: $db.categoriaSono,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriaSonoTableFilterComposer(
            $db: $db,
            $table: $db.categoriaSono,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
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

  $$CategoriaSonoTableOrderingComposer get categoriaId {
    final $$CategoriaSonoTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoriaId,
      referencedTable: $db.categoriaSono,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriaSonoTableOrderingComposer(
            $db: $db,
            $table: $db.categoriaSono,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
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

  $$CategoriaSonoTableAnnotationComposer get categoriaId {
    final $$CategoriaSonoTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoriaId,
      referencedTable: $db.categoriaSono,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriaSonoTableAnnotationComposer(
            $db: $db,
            $table: $db.categoriaSono,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
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
          (RegistroSonoData, $$RegistroSonoTableReferences),
          RegistroSonoData,
          PrefetchHooks Function({bool categoriaId})
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
                Value<int?> categoriaId = const Value.absent(),
              }) => RegistroSonoCompanion(
                id: id,
                data: data,
                horas: horas,
                minutos: minutos,
                categoriaId: categoriaId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String data,
                required int horas,
                required int minutos,
                Value<int?> categoriaId = const Value.absent(),
              }) => RegistroSonoCompanion.insert(
                id: id,
                data: data,
                horas: horas,
                minutos: minutos,
                categoriaId: categoriaId,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$RegistroSonoTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({categoriaId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
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
                if (categoriaId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.categoriaId,
                            referencedTable: $$RegistroSonoTableReferences
                                ._categoriaIdTable(db),
                            referencedColumn:
                                $$RegistroSonoTableReferences
                                    ._categoriaIdTable(db)
                                    .id,
                          )
                          as T;
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
      (RegistroSonoData, $$RegistroSonoTableReferences),
      RegistroSonoData,
      PrefetchHooks Function({bool categoriaId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CategoriaSonoTableTableManager get categoriaSono =>
      $$CategoriaSonoTableTableManager(_db, _db.categoriaSono);
  $$RegistroSonoTableTableManager get registroSono =>
      $$RegistroSonoTableTableManager(_db, _db.registroSono);
}
