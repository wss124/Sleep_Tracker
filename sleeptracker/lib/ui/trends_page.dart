import 'package:flutter/material.dart';
import 'package:sleeptracker/ui/widgets/card_performance.dart';
import 'package:sleeptracker/ui/widgets/card_stages.dart';
import 'package:sleeptracker/ui/widgets/card_weekly.dart';

class TrendsPage extends StatelessWidget {
  const TrendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(247, 227, 227, 227),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.arrow_back_ios, color: Colors.black),
        title: Center(
          child: Text(
            'ANÁLISE',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'Inter',
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.calendar_today, color: Colors.black),
          ),
        ],
      ),
      body: Column(
        children: [
          CardStages(titulo: 'FASES DO SONO', subtitulo: 'Mon, Mar 28'),
          CardWeekly(titulo: 'SONO SEMANAL', subtitulo: 'Avg 7h 14m'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              children: [
                Expanded(
                  child: CardPerformance(
                    titulo: 'EFICIÊNCIA',
                    subtitulo: 'Noite anterior',
                    valor: '91%',
                    destaque: true,
                    icone: Icons.trending_up,
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 8)),
                Expanded(
                  child: CardPerformance(
                    titulo: 'WAKE TIME',
                    subtitulo: 'Consistência',
                    valor: '06:14',
                    destaque: false,
                    icone: Icons.access_time,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: CardPerformance(
                    titulo: 'HORA DE DORMIR',
                    subtitulo: 'Latência de início',
                    valor: '12 min',
                    destaque: false,
                    icone: Icons.nightlight_round,
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 8)),
                Expanded(
                  child: CardPerformance(
                    titulo: 'O₂ no sangue',
                    subtitulo: 'Média por noite',
                    valor: '97%',
                    destaque: false,
                    icone: Icons.water_drop,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
