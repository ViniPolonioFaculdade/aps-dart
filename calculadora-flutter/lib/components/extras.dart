import 'package:calculadora/components/botao.dart';
import 'package:flutter/material.dart';

class Extras extends StatelessWidget {
  const Extras({super.key, required this.pressionar});

  final Function(String) pressionar;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 245, 245, 245),
        border: Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 220, 220, 220),
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
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
            TextoBotao(
              texto: 'MC',
              tamanho: 20,
              pressionar: pressionar,
            ),
            TextoBotao(
              texto: 'MR',
              tamanho: 20,
              pressionar: pressionar,
            ),
            TextoBotao(
              texto: 'M+',
              tamanho: 20,
              pressionar: pressionar,
            ),
            TextoBotao(
              texto: 'M-',
              tamanho: 20,
              pressionar: pressionar,
            ),
            TextoBotao(
              texto: 'log',
              tamanho: 20,
              pressionar: pressionar,
            ),
            TextoBotao(
              texto: 'ln',
              tamanho: 20,
              pressionar: pressionar,
            ),
          ],
        ),
      ),
    );
  }
}
