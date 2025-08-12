import 'package:flutter/material.dart';

class Formula extends StatelessWidget {
  Formula({super.key, required this.texto, this.hasMemory = false});

  String texto;
  bool hasMemory;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 15, 30, 20),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 248, 248, 248),
        border: Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 220, 220, 220),
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (hasMemory)
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'M',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            child: Text(
              texto,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 40,
                color: Colors.black87,
                fontWeight: FontWeight.w400,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
