import 'package:flutter/material.dart';

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
          'SLEEP',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
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
        ],
      ),
      body: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      // Lado esquerdo — textos
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Badge "LAST NIGHT"
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
                                'LAST NIGHT',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            // Duração
                            Text(
                              '7h 32m',
                              style: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Sleep Duration',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 8),
                            // Bullets
                            _bullet('85 Sleep Score'),
                            _bullet('3x Wake ups'),
                            _bullet('91% Efficiency'),
                          ],
                        ),
                      ),
                      // Lado direito — gráfico circular (simulado)
                      _graficCircular(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: CardHome(
                    titulo: 'DEEP SLEEP',
                    subtitulo: 'Mon',
                    valor: '1h 42m',
                    icone: Icons.nightlight_round,
                    destaque: true,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: CardHome(
                    titulo: 'HEART RATE',
                    subtitulo: 'Resting',
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
                    titulo: 'SLEEP SCORE',
                    subtitulo: 'This week',
                    valor: '85',
                    icone: Icons.access_time,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: CardHome(
                    titulo: 'HRV',
                    subtitulo: 'Mon',
                    valor: '42 ms',
                    icone: Icons.show_chart,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // HOME selecionado
        selectedItemColor: Color(0xFF2B5BFF),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const [
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

class CardHome extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final String valor;
  final IconData icone;
  final bool destaque;

  const CardHome({
    super.key,
    required this.titulo,
    required this.subtitulo,
    required this.valor,
    required this.icone,
    this.destaque = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: destaque ? Color(0xFF2B5BFF) : Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título + ícone
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: destaque ? Colors.white70 : Colors.black54,
                    ),
                  ),
                  Text(
                    subtitulo,
                    style: TextStyle(
                      fontSize: 9,
                      color: destaque ? Colors.white60 : Colors.grey,
                    ),
                  ),
                ],
              ),
              Icon(
                icone,
                size: 14,
                color: destaque ? Colors.white60 : Color(0xFF2B5BFF),
              ),
            ],
          ),
          SizedBox(height: 8),
          // Valor
          Text(
            valor,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: destaque ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 8),
          // Barrinhas decorativas
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(6, (i) {
              final alturas = [8.0, 14.0, 10.0, 18.0, 12.0, 16.0];
              return Container(
                width: 5,
                height: alturas[i],
                margin: EdgeInsets.only(right: 3),
                decoration: BoxDecoration(
                  color:
                      destaque
                          ? Colors.white38
                          : Color(0xFF2B5BFF).withOpacity(0.4),
                  borderRadius: BorderRadius.circular(3),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class Cardtrends extends StatelessWidget {
  const Cardtrends({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 100,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'LAST NIGHT',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.add_alarm,
                size: 16,
                color: Color.fromARGB(255, 1, 66, 119),
              ),
            ],
          ),
          Text(
            '7H 32m',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: 0.85,
              minHeight: 5,
              backgroundColor: Colors.white24,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          Text(
            'Sleep Duration',
            style: TextStyle(fontSize: 8, color: Colors.black),
          ),
          Text(
            'Sleep Duration',
            style: TextStyle(fontSize: 8, color: Colors.black),
          ),
          Text(
            'Sleep Duration',
            style: TextStyle(fontSize: 8, color: Colors.black),
          ),
          Text(
            'Sleep Duration',
            style: TextStyle(fontSize: 8, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

Widget _bullet(String texto) {
  return Row(
    children: [
      Container(
        width: 8,
        height: 8,
        margin: EdgeInsets.only(right: 6, bottom: 4),
        decoration: BoxDecoration(
          color: Color(0xFF2B5BFF),
          shape: BoxShape.circle,
        ),
      ),
      Text(texto, style: TextStyle(fontSize: 12, color: Colors.black54)),
    ],
  );
}

Widget _graficCircular() {
  return SizedBox(
    width: 80,
    height: 80,
    child: Stack(
      children: [
        // Círculo externo
        CircularProgressIndicator(
          value: 0.75,
          strokeWidth: 8,
          backgroundColor: Colors.blue.shade100,
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2B5BFF)),
        ),
        // Círculo interno
        Center(
          child: SizedBox(
            width: 55,
            height: 55,
            child: CircularProgressIndicator(
              value: 0.55,
              strokeWidth: 6,
              backgroundColor: Colors.blue.shade50,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue.shade300),
            ),
          ),
        ),
      ],
    ),
  );
}
