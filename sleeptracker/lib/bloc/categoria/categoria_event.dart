import 'package:sleeptracker/data/database.dart';

abstract class CategoriaEvent {}

class CarregarCategorias extends CategoriaEvent {}

class AdicionarCategoria extends CategoriaEvent {
  final String nome;
  final String icone;
  AdicionarCategoria({required this.nome, required this.icone});
}

class AtualizarCategoria extends CategoriaEvent {
  final CategoriaSonoData categoria;
  final String novoNome;
  final String novoIcone;
  AtualizarCategoria({
    required this.categoria,
    required this.novoNome,
    required this.novoIcone,
  });
}

class DeletarCategoria extends CategoriaEvent {
  final int id;
  DeletarCategoria(this.id);
}
