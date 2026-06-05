import 'package:flutter/material.dart';
import 'package:sleeptracker/cards/card_performance.dart';
import 'package:sleeptracker/cards/card_stages.dart';
import 'package:sleeptracker/cards/card_weekly.dart';

class MyTela extends StatelessWidget {
  const MyTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(247, 227, 227, 227),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.arrow_back_ios, color: Colors.black),
        title: Center(
          child: Text(
            'ANALISYS',
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
          CardStages(titulo: 'SLEEP STAGES', subtitulo: 'Mon, Mar 28'),
          CardWeekly(titulo: 'WEEKLY SLEEP', subtitulo: 'Avg 7h 14m'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              children: [
                Expanded(
                  child: CardPerformance(
                    titulo: 'EFFICIENCY',
                    subtitulo: 'Last night',
                    valor: '91%',
                    destaque: true,
                    icone: Icons.trending_up,
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 8)),
                Expanded(
                  child: CardPerformance(
                    titulo: 'WAKE TIME',
                    subtitulo: 'Consistency',
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
                    titulo: 'TIME TO SLEEP',
                    subtitulo: 'Onset latency',
                    valor: '12 min',
                    destaque: false,
                    icone: Icons.nightlight_round,
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 8)),
                Expanded(
                  child: CardPerformance(
                    titulo: 'BLOOD O₂',
                    subtitulo: 'Avg overnight',
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

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Color(0xFF2B5BFF),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'TRENDS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm_outlined),
            label: 'ALARM',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'PROFILE',
          ),
        ],
      ),
    );
  }
}
