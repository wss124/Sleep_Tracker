import 'package:flutter/material.dart';
import 'package:sleeptracker/ui/home_page.dart';
import 'package:sleeptracker/ui/trends_page.dart'; // ajuste o import conforme seu caminho

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    TrendsPage(),
    Scaffold(body: Center(child: Text('Alarme — em breve'))),
    Scaffold(body: Center(child: Text('Perfil — em breve'))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: const Color(0xFF2B5BFF),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'INICIO',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'TRENDS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm_outlined),
            label: 'ALARME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'PERFIL',
          ),
        ],
      ),
    );
  }
}
