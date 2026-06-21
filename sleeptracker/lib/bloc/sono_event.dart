import 'package:sleeptracker/data/database.dart';

abstract class SonoEvent {}

class CarregarRegistros extends SonoEvent {}

class AdicionarRegistro extends SonoEvent {
  final String data;
  final int horas;
  final int minutos;

  AdicionarRegistro({
    required this.data,
    required this.horas,
    required this.minutos,
  });
}

class AtualizarRegistro extends SonoEvent {
  final RegistroSonoData registro;
  final String novaData;
  final int novasHoras;
  final int novosMinutos;

  AtualizarRegistro({
    required this.registro,
    required this.novaData,
    required this.novasHoras,
    required this.novosMinutos,
  });
}

class DeletarRegistro extends SonoEvent {
  final int id;
  DeletarRegistro(this.id);
}
