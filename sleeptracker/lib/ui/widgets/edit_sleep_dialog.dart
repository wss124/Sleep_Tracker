import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleeptracker/bloc/sono_bloc.dart';
import 'package:sleeptracker/bloc/sono_event.dart';
import 'package:sleeptracker/data/database.dart';

class EditSleepDialog extends StatelessWidget {
  final RegistroSonoData registro;

  const EditSleepDialog({super.key, required this.registro});

  @override
  Widget build(BuildContext context) {
    final dataController = TextEditingController(text: registro.data);
    final horasController = TextEditingController(text: '${registro.horas}');
    final minutosController = TextEditingController(
      text: '${registro.minutos}',
    );

    return AlertDialog(
      title: const Text('EDITAR REGISTRO'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: dataController,
            decoration: const InputDecoration(labelText: 'DATA'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: horasController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'HORAS'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: minutosController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'MINUTOS'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            final data = dataController.text.trim();
            final horas = int.tryParse(horasController.text.trim());
            final minutos = int.tryParse(minutosController.text.trim());

            if (data.isEmpty || horas == null || minutos == null) return;

            if (horas < 0 || horas > 16) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Horas devem estar entre 0 e 16')),
              );
              return;
            }

            if (minutos < 0 || minutos > 59) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Minutos devem estar entre 0 e 59'),
                ),
              );
              return;
            }

            DateTime? dataConvertida;
            try {
              final partes = data.split('/');
              if (partes.length != 3) return;
              dataConvertida = DateTime(
                int.parse(partes[2]),
                int.parse(partes[1]),
                int.parse(partes[0]),
              );
            } catch (e) {
              return;
            }

            final hoje = DateTime.now();
            final hojeSemHora = DateTime(hoje.year, hoje.month, hoje.day);
            if (dataConvertida.isAfter(hojeSemHora)) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Não é permitido registrar data futura'),
                ),
              );
              return;
            }

            context.read<SonoBloc>().add(
              AtualizarRegistro(
                registro: registro,
                novaData: data,
                novasHoras: horas,
                novosMinutos: minutos,
              ),
            );

            Navigator.pop(context);
          },
          child: const Text('Salvar'),
        ),
      ],
    );
  }
}
