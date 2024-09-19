import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  const Botao({
    super.key,
    required this.texto,
    required this.tamanho,
    required this.pressionar,
  });

  final String texto;
  final double tamanho;
  final Function(String) pressionar;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () => pressionar(texto),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        overlayColor: MaterialStateProperty.all(Colors.black38),
      ),
      child: Text(
        texto,
        style: TextStyle(color: Colors.black54, fontSize: tamanho),
      ),
    );
  }
}

class TextoBotao extends StatelessWidget {
  const TextoBotao({
    super.key,
    required this.texto,
    required this.tamanho,
    required this.pressionar,
  });

  final String texto;
  final double tamanho;
  final Function(String) pressionar;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => pressionar(texto),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.black38),
      ),
      child: Text(
        texto,
        style: TextStyle(color: Colors.black54, fontSize: tamanho),
      ),
    );
  }
}
