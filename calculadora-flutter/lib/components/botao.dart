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
        overlayColor: MaterialStateProperty.all(Colors.black26),
        elevation: MaterialStateProperty.all(2),
        shadowColor: MaterialStateProperty.all(Colors.black26),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: Text(
        texto,
        style: TextStyle(
          color: Colors.black87,
          fontSize: tamanho,
          fontWeight: FontWeight.w500,
        ),
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
        overlayColor: MaterialStateProperty.all(Colors.black26),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        ),
      ),
      child: Text(
        texto,
        style: TextStyle(
          color: Colors.black87,
          fontSize: tamanho,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
