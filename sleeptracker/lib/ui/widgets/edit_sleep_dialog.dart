import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleeptracker/bloc/categoria/categoria_bloc.dart';
import 'package:sleeptracker/bloc/categoria/categoria_state.dart';
import 'package:sleeptracker/bloc/sono/sono_bloc.dart';
import 'package:sleeptracker/bloc/sono/sono_event.dart';
import 'package:sleeptracker/data/database.dart';

class EditSleepDialog extends StatefulWidget {
  final RegistroSonoData registro;
  const EditSleepDialog({super.key, required this.registro});

  @override
  State<EditSleepDialog> createState() => _EditSleepDialogState();
}

class _EditSleepDialogState extends State<EditSleepDialog> {
  late final TextEditingController dataController;
  late final TextEditingController horasController;
  late final TextEditingController minutosController;
  CategoriaSonoData? categoriaSelecionada;

  @override
  void initState() {
    super.initState();
    dataController = TextEditingController(text: widget.registro.data);
    horasController = TextEditingController(text: '${widget.registro.horas}');
    minutosController = TextEditingController(
      text: '${widget.registro.minutos}',
    );
  }

  void _salvar() {
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
        const SnackBar(content: Text('Minutos devem estar entre 0 e 59')),
      );
      return;
    }

    // ✅ validação de data futura mantida
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
      AtualizarRegistro(
        registro: widget.registro,
        novaData: data,
        novasHoras: horas,
        novosMinutos: minutos,
        categoriaId: categoriaSelecionada?.id,
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Editar Registro'),
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

              // pré-seleciona a categoria do registro
              if (categoriaSelecionada == null &&
                  widget.registro.categoriaId != null) {
                try {
                  categoriaSelecionada = categorias.firstWhere(
                    (c) => c.id == widget.registro.categoriaId,
                  );
                } catch (_) {}
              }

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
