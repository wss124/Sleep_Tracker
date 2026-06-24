import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleeptracker/bloc/sono_bloc.dart';
import 'package:sleeptracker/bloc/sono_event.dart';

class AddSleepDialog extends StatelessWidget {
  const AddSleepDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final dataController = TextEditingController();
    final horasController = TextEditingController();
    final minutosController = TextEditingController();

    return AlertDialog(
      title: const Text('NOVO REGISTRO'),
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

            // 🚫 validação de horas e minutos
            if (horas < 0 || horas > 24) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Horas devem estar entre 0 e 24')),
              );
              return;
            }

            if (minutos < 0 || minutos > 59) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Minutos devem estar entre 0 e 60'),
                ),
              );
              return;
            }

            // (opcional mas correto) validação de data futura
            DateTime? dataConvertida;

            try {
              final partes = data.split('/');
              if (partes.length != 3) return;

              final dia = int.parse(partes[0]);
              final mes = int.parse(partes[1]);
              final ano = int.parse(partes[2]);

              dataConvertida = DateTime(ano, mes, dia);
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
              AdicionarRegistro(data: data, horas: horas, minutos: minutos),
            );

            Navigator.pop(context);
          },
          child: const Text('Salvar'),
        ),
      ],
    );
  }
}
