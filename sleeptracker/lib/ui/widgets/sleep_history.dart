import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleeptracker/bloc/sono_bloc.dart';
import 'package:sleeptracker/bloc/sono_state.dart';
import 'package:sleeptracker/bloc/sono_event.dart';
import 'package:sleeptracker/ui/widgets/edit_sleep_dialog.dart';

class SleepHistory extends StatelessWidget {
  const SleepHistory({super.key});

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
            builder: (context, state) {
              if (state is! SonoCarregado) {
                return const SizedBox();
              }

              if (state.registros.isEmpty) {
                return const Text(
                  'Nenhum registro cadastrado ainda.',
                  style: TextStyle(color: Colors.grey),
                );
              }

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.registros.length,
                itemBuilder: (context, index) {
                  final registro = state.registros[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
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
                          ],
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.edit_outlined,
                            color: Color(0xFF2B5BFF),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder:
                                  (_) => BlocProvider.value(
                                    value: context.read<SonoBloc>(),
                                    child: EditSleepDialog(registro: registro),
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
