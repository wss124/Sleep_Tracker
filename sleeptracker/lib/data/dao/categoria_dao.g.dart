// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoria_dao.dart';

// ignore_for_file: type=lint
mixin _$CategoriaDaoMixin on DatabaseAccessor<AppDatabase> {
  $CategoriaSonoTable get categoriaSono => attachedDatabase.categoriaSono;
  CategoriaDaoManager get managers => CategoriaDaoManager(this);
}

class CategoriaDaoManager {
  final _$CategoriaDaoMixin _db;
  CategoriaDaoManager(this._db);
  $$CategoriaSonoTableTableManager get categoriaSono =>
      $$CategoriaSonoTableTableManager(_db.attachedDatabase, _db.categoriaSono);
}
