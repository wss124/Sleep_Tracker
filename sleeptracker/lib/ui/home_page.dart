import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleeptracker/bloc/sono_bloc.dart';
import 'package:sleeptracker/bloc/sono_state.dart';
import 'package:sleeptracker/main.dart';
import 'package:sleeptracker/ui/widgets/add_sleep_dialog.dart';
import 'package:sleeptracker/ui/widgets/card_home.dart';
import 'package:sleeptracker/ui/widgets/circular_graphic.dart';
import 'package:sleeptracker/ui/widgets/sleep_history.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(247, 227, 227, 227),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 16),
          child: Icon(Icons.nightlight_round, color: Colors.black),
        ),
        title: Text(
          'GERENCIADOR DE SONO',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: IconButton(
              icon: const Icon(Icons.storage_outlined, color: Colors.black),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => DriftDbViewer(appDatabase)),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => const AddSleepDialog(),
                );
              },
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.add, color: Colors.white, size: 20),
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: BlocBuilder<SonoBloc, SonoState>(
                builder: (context, state) {
                  if (state is SonoCarregando) {
                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  }

                  if (state is SonoErro) {
                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        state.mensagem,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }

                  DateTime parseData(String data) {
                    final partes = data.split('/');
                    return DateTime(
                      int.parse(partes[2]),
                      int.parse(partes[1]),
                      int.parse(partes[0]),
                    );
                  }

                  String horas = '--';
                  String minutos = '--';
                  String dataRegistro = 'Nenhum registro ainda';

                  if (state is SonoCarregado && state.registros.isNotEmpty) {
                    final registrosOrdenados = List.of(state.registros);

                    registrosOrdenados.sort((a, b) {
                      final dataA = parseData(a.data);
                      final dataB = parseData(b.data);
                      return dataB.compareTo(dataA);
                    });

                    final ultimo = registrosOrdenados.first;
                    horas = '${ultimo.horas}';
                    minutos = '${ultimo.minutos}';
                    dataRegistro = ultimo.data;
                  }

                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'NOITE ANTERIOR',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '${horas}h ${minutos}m',
                                style: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                dataRegistro,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 8),
                            ],
                          ),
                        ),
                        const CircularGraphic(),
                      ],
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: CardHome(
                      titulo: 'SONO PROFUNDO',
                      subtitulo: 'Seg',
                      valor: '1h 42m',
                      icone: Icons.nightlight_round,
                      destaque: true,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: CardHome(
                      titulo: 'FREQUÊNCIA CARDÍACA',
                      subtitulo: 'Descansando',
                      valor: '58 BPM',
                      icone: Icons.favorite,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: CardHome(
                      titulo: 'PONTUAÇÃO DE SONO',
                      subtitulo: 'Essa semana',
                      valor: '85',
                      icone: Icons.access_time,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: CardHome(
                      titulo: 'HRV',
                      subtitulo: 'Seg',
                      valor: '42 ms',
                      icone: Icons.show_chart,
                    ),
                  ),
                ],
              ),
            ),
            const SleepHistory(),
          ],
        ),
      ),
    );
  }
}
