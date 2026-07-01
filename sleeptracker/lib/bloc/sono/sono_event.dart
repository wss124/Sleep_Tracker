import 'package:sleeptracker/data/database.dart';

abstract class SonoEvent {}

class CarregarRegistros extends SonoEvent {}

class AdicionarRegistro extends SonoEvent {
  final String data;
  final int horas;
  final int minutos;
  final int? categoriaId;

  AdicionarRegistro({
    required this.data,
    required this.horas,
    required this.minutos,
    this.categoriaId,
  });
}

class AtualizarRegistro extends SonoEvent {
  final RegistroSonoData registro;
  final String novaData;
  final int novasHoras;
  final int novosMinutos;
  final int? categoriaId;

  AtualizarRegistro({
    required this.registro,
    required this.novaData,
    required this.novasHoras,
    required this.novosMinutos,
    this.categoriaId,
  });
}

class DeletarRegistro extends SonoEvent {
  final int id;
  DeletarRegistro(this.id);
}
