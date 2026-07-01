import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleeptracker/bloc/categoria/categoria_bloc.dart';
import 'package:sleeptracker/bloc/categoria/categoria_state.dart';
import 'package:sleeptracker/bloc/sono/sono_bloc.dart';
import 'package:sleeptracker/bloc/sono/sono_state.dart';
import 'package:sleeptracker/bloc/sono/sono_event.dart';
import 'package:sleeptracker/data/database.dart';
import 'package:sleeptracker/ui/widgets/edit_sleep_dialog.dart';

class SleepHistory extends StatelessWidget {
  const SleepHistory({super.key});

  static const List<Color> _cores = [
    Color(0xFF2B5BFF),
    Color(0xFF9B51E0),
    Color(0xFF27AE60),
    Color(0xFFE67E22),
    Color(0xFFE74C3C),
    Color(0xFF1ABC9C),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Histórico',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),

          BlocBuilder<SonoBloc, SonoState>(
            builder: (context, sonoState) {
              if (sonoState is! SonoCarregado) return const SizedBox();
              if (sonoState.registros.isEmpty) {
                return const Text(
                  'Nenhum registro cadastrado ainda.',
                  style: TextStyle(color: Colors.grey),
                );
              }

              return BlocBuilder<CategoriaBloc, CategoriaState>(
                builder: (context, catState) {
                  final categorias =
                      catState is CategoriaCarregada
                          ? catState.categorias
                          : <CategoriaSonoData>[];

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: sonoState.registros.length,
                    itemBuilder: (context, index) {
                      final registro = sonoState.registros[index];

                      CategoriaSonoData? categoria;
                      int corIndex = 0;
                      if (registro.categoriaId != null) {
                        try {
                          final idx = categorias.indexWhere(
                            (c) => c.id == registro.categoriaId,
                          );
                          if (idx != -1) {
                            categoria = categorias[idx];
                            corIndex = idx % _cores.length;
                          }
                        } catch (_) {}
                      }

                      final cor =
                          categoria != null
                              ? _cores[corIndex]
                              : Colors.grey.shade300;

                      return Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border(
                            left: BorderSide(color: cor, width: 4),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    registro.data,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '${registro.horas}h ${registro.minutos}m de sono',
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 12,
                                    ),
                                  ),
                                  if (categoria != null)
                                    Container(
                                      margin: const EdgeInsets.only(top: 4),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: cor.withValues(alpha: 0.1),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        categoria.nome,
                                        style: TextStyle(
                                          color: cor,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.edit_outlined,
                                      color: Color(0xFF2B5BFF),
                                    ),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder:
                                            (_) => MultiBlocProvider(
                                              providers: [
                                                BlocProvider.value(
                                                  value:
                                                      context.read<SonoBloc>(),
                                                ),
                                                BlocProvider.value(
                                                  value:
                                                      context
                                                          .read<
                                                            CategoriaBloc
                                                          >(),
                                                ),
                                              ],
                                              child: EditSleepDialog(
                                                registro: registro,
                                              ),
                                            ),
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete_outline,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      context.read<SonoBloc>().add(
                                        DeletarRegistro(registro.id),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
