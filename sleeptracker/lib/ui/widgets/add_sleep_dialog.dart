import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleeptracker/bloc/categoria/categoria_bloc.dart';
import 'package:sleeptracker/bloc/categoria/categoria_state.dart';
import 'package:sleeptracker/bloc/sono/sono_bloc.dart';
import 'package:sleeptracker/bloc/sono/sono_event.dart';
import 'package:sleeptracker/data/database.dart';

class AddSleepDialog extends StatefulWidget {
  const AddSleepDialog({super.key});

  @override
  State<AddSleepDialog> createState() => _AddSleepDialogState();
}

class _AddSleepDialogState extends State<AddSleepDialog> {
  final dataController = TextEditingController();
  final horasController = TextEditingController();
  final minutosController = TextEditingController();
  CategoriaSonoData? categoriaSelecionada;

  void _salvar() {
    final data = dataController.text.trim();
    final horas = int.tryParse(horasController.text.trim());
    final minutos = int.tryParse(minutosController.text.trim());

    if (data.length < 10 || horas == null || minutos == null) return;
    if (horas < 0 || horas > 16) return;
    if (minutos < 0 || minutos > 59) return;

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
    if (dataConvertida.isAfter(DateTime(hoje.year, hoje.month, hoje.day))) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Não é permitido registrar data futura')),
      );
      return;
    }

    context.read<SonoBloc>().add(
      AdicionarRegistro(
        data: data,
        horas: horas,
        minutos: minutos,
        categoriaId: categoriaSelecionada?.id,
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Novo Registro'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: dataController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Data',
              hintText: 'DD/MM/AAAA',
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: horasController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Horas (0-16)'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: minutosController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Minutos (0-59)'),
          ),
          const SizedBox(height: 12),
          BlocBuilder<CategoriaBloc, CategoriaState>(
            builder: (context, state) {
              final categorias =
                  state is CategoriaCarregada
                      ? state.categorias
                      : <CategoriaSonoData>[];

              return DropdownButtonFormField<CategoriaSonoData?>(
                value: categoriaSelecionada,
                decoration: const InputDecoration(labelText: 'Categoria'),
                items: [
                  const DropdownMenuItem(
                    value: null,
                    child: Text('Sem categoria'),
                  ),
                  ...categorias.map(
                    (c) => DropdownMenuItem(value: c, child: Text(c.nome)),
                  ),
                ],
                onChanged:
                    (value) => setState(() => categoriaSelecionada = value),
              );
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(onPressed: _salvar, child: const Text('Salvar')),
      ],
    );
  }
}
