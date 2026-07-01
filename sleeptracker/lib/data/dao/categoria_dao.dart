import 'package:drift/drift.dart';
import 'package:sleeptracker/data/database.dart';
import 'package:sleeptracker/data/tables/categoria_sono.dart';

part 'categoria_dao.g.dart';

@DriftAccessor(tables: [CategoriaSono])
class CategoriaDao extends DatabaseAccessor<AppDatabase>
    with _$CategoriaDaoMixin {
  CategoriaDao(super.db);

  Future<int> inserir(CategoriaSonoCompanion categoria) =>
      into(categoriaSono).insert(categoria);

  Future<List<CategoriaSonoData>> buscarTodas() => select(categoriaSono).get();

  Future<bool> atualizar(CategoriaSonoData cat) =>
      update(categoriaSono).replace(cat);

  Future<int> deletar(int id) =>
      (delete(categoriaSono)..where((c) => c.id.equals(id))).go();
}
