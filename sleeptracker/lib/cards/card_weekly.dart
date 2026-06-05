import 'package:flutter/material.dart';

class CardWeekly extends StatelessWidget {
  final String titulo;
  final String subtitulo;

  const CardWeekly({super.key, required this.titulo, required this.subtitulo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: Container(
        height: 140,
        width: double.infinity,
        padding: EdgeInsets.all(16),
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text('This week', style: TextStyle(fontSize: 11)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                barraVertical('M', 30, Color(0xFFD6EEFF)),
                barraVertical('T', 40, Color(0xFF5B8FFF)),
                barraVertical('W', 38, Color(0xFF2B5BFF)),
                barraVertical('T', 30, Color(0xFFD6EEFF)),
                barraVertical('F', 52, Color(0xFF2B5BFF)),
                barraVertical('S', 54, Color(0xFF5B8FFF)),
                barraVertical('S', 50, Color(0xFF0A2FB6)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget barraVertical(String dia, double altura, Color cor) {
    return Column(
      children: [
        Container(
          width: 37,
          height: altura,
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: cor,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 4)),
        Text(dia, style: TextStyle(fontSize: 9, color: Colors.grey)),
      ],
    );
  }
}
