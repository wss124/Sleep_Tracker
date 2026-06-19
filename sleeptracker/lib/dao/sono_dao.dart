import 'package:drift/drift.dart';
import 'package:sleeptracker/data/database.dart';

part 'sono_dao.g.dart';

@DriftAccessor(tables: [RegistroSono])
class SonoDao extends DatabaseAccessor<AppDatabase> with _$SonoDaoMixin {
  SonoDao(super.db);

  // CREATE
  Future<int> inserir(RegistroSonoCompanion registro) =>
      into(registroSono).insert(registro);

  // READ
  Future<List<RegistroSonoData>> buscarTodos() => select(registroSono).get();

  // UPDATE
  Future<bool> atualizar(RegistroSonoData registro) =>
      update(registroSono).replace(registro);

  // DELETE
  Future<int> deletar(int id) =>
      (delete(registroSono)..where((r) => r.id.equals(id))).go();
}
