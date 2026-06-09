import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

class RegistroSono extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get data => text()();
  IntColumn get horas => integer()();
  IntColumn get minutos => integer()();
}
