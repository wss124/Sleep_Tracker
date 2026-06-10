import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';

class RegistroSono extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get data => text()();
  IntColumn get horas => integer()();
  IntColumn get minutos => integer()();
}

@DriftDatabase(tables: [RegistroSono])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'app_db'));

  @override
  int get schemaVersion => 1;
}
