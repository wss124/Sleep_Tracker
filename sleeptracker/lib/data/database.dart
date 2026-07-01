import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'tables/categoria_sono.dart';
import 'tables/registro_sono.dart';

part 'database.g.dart';

@DriftDatabase(tables: [CategoriaSono, RegistroSono])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'sleep_tracker'));

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        await m.createTable(categoriaSono);
        await m.addColumn(registroSono, registroSono.categoriaId);
      }
    },
  );
}
