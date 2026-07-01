import 'package:drift/drift.dart';
import 'categoria_sono.dart';

class RegistroSono extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get data => text()();

  IntColumn get horas => integer()();

  IntColumn get minutos => integer()();

  IntColumn get categoriaId =>
      integer().nullable().references(CategoriaSono, #id)();
}
