// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sono_dao.dart';

// ignore_for_file: type=lint
mixin _$SonoDaoMixin on DatabaseAccessor<AppDatabase> {
  $CategoriaSonoTable get categoriaSono => attachedDatabase.categoriaSono;
  $RegistroSonoTable get registroSono => attachedDatabase.registroSono;
  SonoDaoManager get managers => SonoDaoManager(this);
}

class SonoDaoManager {
  final _$SonoDaoMixin _db;
  SonoDaoManager(this._db);
  $$CategoriaSonoTableTableManager get categoriaSono =>
      $$CategoriaSonoTableTableManager(_db.attachedDatabase, _db.categoriaSono);
  $$RegistroSonoTableTableManager get registroSono =>
      $$RegistroSonoTableTableManager(_db.attachedDatabase, _db.registroSono);
}
