import 'package:sleeptracker/data/database.dart';

abstract class CategoriaState {}

class CategoriaCarregando extends CategoriaState {}

class CategoriaCarregada extends CategoriaState {
  final List<CategoriaSonoData> categorias;
  CategoriaCarregada(this.categorias);
}

class CategoriaErro extends CategoriaState {
  final String mensagem;
  CategoriaErro(this.mensagem);
}
