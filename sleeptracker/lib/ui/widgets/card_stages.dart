import 'package:flutter/material.dart';

class CardStages extends StatelessWidget {
  final String titulo;
  final String subtitulo;

  const CardStages({super.key, required this.titulo, required this.subtitulo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        width: double.infinity,
        height: 100,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titulo,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        fontFamily: 'Inter',
                      ),
                    ),
                    Text(
                      subtitulo,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    legenda(Color(0xFFADD8FF), 'Light'),
                    Padding(padding: EdgeInsets.only(left: 8)),
                    legenda(Color(0xFF2B5BFF), 'REM'),
                    Padding(padding: EdgeInsets.only(left: 8)),
                    legenda(Color(0xFF0A2FB6), 'Deep'),
                  ],
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  barra(Color.fromARGB(255, 241, 242, 243), 20, 25),
                  barra(Color(0xFFD6EEFF), 38, 25),
                  barra(Color(0xFF0A2FB6), 30, 25),
                  barra(Color(0xFF2B5BFF), 20, 25),
                  barra(Color(0xFFD6EEFF), 40, 25),
                  barra(Color(0xFF0A2FB6), 28, 25),
                  barra(Color(0xFF2B5BFF), 34, 25),
                  barra(Color(0xFFD6EEFF), 38, 25),
                  barra(Color(0xFF5B8FFF), 20, 25),
                  barra(Color.fromARGB(255, 241, 242, 243), 20, 25),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget legenda(Color cor, String label) {
    return Row(
      children: [
        Container(width: 8, height: 8, color: cor),
        Padding(padding: EdgeInsets.only(left: 4)),
        Text(label, style: TextStyle(fontSize: 9, color: Colors.grey)),
      ],
    );
  }

  Widget barra(Color cor, double largura, double altura) {
    return Container(
      width: largura,
      height: altura,
      decoration: BoxDecoration(color: cor),
    );
  }
}
