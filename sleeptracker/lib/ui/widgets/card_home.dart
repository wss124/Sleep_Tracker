import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: destaque ? const Color(0xFF2B5BFF) : Colors.white,
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
                color: destaque ? Colors.white60 : const Color(0xFF2B5BFF),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            valor,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: destaque ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(6, (i) {
              final alturas = [8.0, 14.0, 10.0, 18.0, 12.0, 16.0];
              return Container(
                width: 5,
                height: alturas[i],
                margin: const EdgeInsets.only(right: 3),
                decoration: BoxDecoration(
                  color:
                      destaque
                          ? Colors.white38
                          : const Color(0xFF2B5BFF).withOpacity(0.4),
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
