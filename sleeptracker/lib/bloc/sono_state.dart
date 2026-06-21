import 'package:sleeptracker/data/database.dart';

abstract class SonoState {}

class SonoCarregando extends SonoState {}

class SonoCarregado extends SonoState {
  final List<RegistroSonoData> registros;
  SonoCarregado(this.registros);
}

class SonoErro extends SonoState {
  final String mensagem;
  SonoErro(this.mensagem);
}
