import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleeptracker/bloc/categoria/categoria_bloc.dart';
import 'package:sleeptracker/bloc/categoria/categoria_event.dart';
import 'package:sleeptracker/bloc/categoria/categoria_state.dart';
import 'package:sleeptracker/data/database.dart';

class CategoriaDialog extends StatelessWidget {
  const CategoriaDialog({super.key});

  // abre o formulário de criar/editar categoria
  void _mostrarFormulario(BuildContext context, CategoriaSonoData? categoria) {
    final nomeController = TextEditingController(text: categoria?.nome ?? '');

    showDialog(
      context: context,
      builder:
          (_) => BlocProvider.value(
            value: context.read<CategoriaBloc>(),
            child: AlertDialog(
              title: Text(
                categoria == null ? 'Nova Categoria' : 'Editar Categoria',
              ),
              content: TextField(
                controller: nomeController,
                decoration: const InputDecoration(labelText: 'Nome'),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancelar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final nome = nomeController.text.trim();
                    if (nome.isEmpty) return;

                    if (categoria == null) {
                      context.read<CategoriaBloc>().add(
                        AdicionarCategoria(nome: nome, icone: ''),
                      );
                    } else {
                      context.read<CategoriaBloc>().add(
                        AtualizarCategoria(
                          categoria: categoria,
                          novoNome: nome,
                          novoIcone: '',
                        ),
                      );
                    }
                    Navigator.pop(context);
                  },
                  child: const Text('Salvar'),
                ),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Categorias'),
      content: SizedBox(
        width: double.maxFinite,
        child: BlocBuilder<CategoriaBloc, CategoriaState>(
          builder: (context, state) {
            if (state is CategoriaCarregando) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is CategoriaErro) {
              return Text(state.mensagem);
            }

            if (state is CategoriaCarregada) {
              if (state.categorias.isEmpty) {
                return const Text('Nenhuma categoria cadastrada.');
              }

              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.categorias.length,
                itemBuilder: (context, index) {
                  final categoria = state.categorias[index];
                  return ListTile(
                    title: Text(categoria.nome),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, size: 20),
                          onPressed:
                              () => _mostrarFormulario(context, categoria),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, size: 20),
                          onPressed:
                              () => context.read<CategoriaBloc>().add(
                                DeletarCategoria(categoria.id),
                              ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }

            return const SizedBox();
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => _mostrarFormulario(context, null),
          child: const Text('Nova Categoria'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Fechar'),
        ),
      ],
    );
  }
}
