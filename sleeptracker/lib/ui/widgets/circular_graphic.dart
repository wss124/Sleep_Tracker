import 'package:flutter/material.dart';

class CircularGraphic extends StatelessWidget {
  const CircularGraphic({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        children: [
          CircularProgressIndicator(
            value: 0.75,
            strokeWidth: 8,
            backgroundColor: Colors.blue.shade100,
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF2B5BFF)),
          ),
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
}
