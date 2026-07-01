import 'package:drift/drift.dart';
import 'package:sleeptracker/data/database.dart';
import 'package:sleeptracker/data/tables/categoria_sono.dart';
import 'package:sleeptracker/data/tables/registro_sono.dart';

part 'sono_dao.g.dart';

@DriftAccessor(tables: [RegistroSono, CategoriaSono])
class SonoDao extends DatabaseAccessor<AppDatabase> with _$SonoDaoMixin {
  SonoDao(super.db);

  Future<int> inserir(RegistroSonoCompanion registro) =>
      into(registroSono).insert(registro);

  Future<List<RegistroSonoData>> buscarTodos() => select(registroSono).get();

  Future<bool> atualizar(RegistroSonoData registro) =>
      update(registroSono).replace(registro);

  Future<int> deletar(int id) =>
      (delete(registroSono)..where((r) => r.id.equals(id))).go();

  Future<bool> existeRegistroComCategoria(int categoriaId) async {
    final resultado =
        await (select(registroSono)
          ..where((r) => r.categoriaId.equals(categoriaId))).get();
    return resultado.isNotEmpty;
  }
}
