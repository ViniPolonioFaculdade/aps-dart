import 'package:calculadora/components/botao.dart';
import 'package:flutter/material.dart';

class Extras extends StatelessWidget {
  const Extras({super.key, required this.pressionar});

  final Function(String) pressionar;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 233, 233, 233),
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            TextoBotao(
              texto: '(',
              tamanho: 25,
              pressionar: pressionar,
            ),
            TextoBotao(
              texto: ')',
              tamanho: 25,
              pressionar: pressionar,
            ),
            TextoBotao(
              texto: '[',
              tamanho: 25,
              pressionar: pressionar,
            ),
            TextoBotao(
              texto: ']',
              tamanho: 25,
              pressionar: pressionar,
            ),
            TextoBotao(
              texto: '{',
              tamanho: 25,
              pressionar: pressionar,
            ),
            TextoBotao(
              texto: '}',
              tamanho: 25,
              pressionar: pressionar,
            ),
            TextoBotao(
              texto: 'a²',
              tamanho: 25,
              pressionar: pressionar,
            ),
            TextoBotao(
              texto: 'aᵇ',
              tamanho: 25,
              pressionar: pressionar,
            ),
            TextoBotao(
              texto: '√',
              tamanho: 25,
              pressionar: pressionar,
            ),
            TextoBotao(
              texto: 'sin',
              tamanho: 25,
              pressionar: pressionar,
            ),
            TextoBotao(
              texto: 'cos',
              tamanho: 25,
              pressionar: pressionar,
            ),
            TextoBotao(
              texto: 'tan',
              tamanho: 25,
              pressionar: pressionar,
            ),
          ],
        ),
      ),
    );
  }
}
