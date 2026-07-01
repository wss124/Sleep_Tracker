import 'package:flutter/material.dart';

class CardPerformance extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final String valor;
  final bool destaque;
  final IconData icone;

  const CardPerformance({
    super.key,
    required this.titulo,
    required this.subtitulo,
    required this.valor,
    required this.destaque,
    required this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: destaque ? Color(0xFF2B5BFF) : Colors.white,
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
                      color: destaque ? Colors.white70 : Colors.black,
                    ),
                  ),
                  Text(
                    subtitulo,
                    style: TextStyle(
                      fontSize: 10,
                      color: destaque ? Colors.white60 : Colors.grey,
                    ),
                  ),
                ],
              ),
              Icon(
                icone,
                size: 16,
                color:
                    destaque
                        ? Colors.white60
                        : const Color.fromARGB(255, 1, 66, 119),
              ),
            ],
          ),
          Text(
            valor,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: destaque ? Colors.white : Colors.black,
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
            'Target: 85%',
            style: TextStyle(fontSize: 8, color: Colors.white60),
          ),
        ],
      ),
    );
  }
}
