import 'package:drift/drift.dart';

class CategoriaSono extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get nome => text()();

  TextColumn get icone => text()();

  IntColumn get cor => integer().withDefault(const Constant(0xFF2B5BFF))();
}
