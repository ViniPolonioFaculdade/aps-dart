import 'package:flutter/material.dart';
import 'package:calculadora/components/botao.dart';

class Teclado extends StatelessWidget {
  Teclado({super.key, required this.texto, required this.pressionar});

  String texto;
  final Function(String) pressionar;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      crossAxisCount: 4,
      shrinkWrap: true,
      padding: const EdgeInsets.all(10),
      children: <Widget>[
        FilledButton(
            onPressed: () => pressionar('AC'),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                overlayColor: MaterialStateProperty.all(Colors.black38)),
            child: const Text('AC',
                style: TextStyle(color: Colors.white, fontSize: 30))),
        Botao(texto: '←', tamanho: 36, pressionar: pressionar),
        Botao(texto: '%', tamanho: 36, pressionar: pressionar),
        Botao(texto: '÷', tamanho: 36, pressionar: pressionar),
        Botao(texto: '7', tamanho: 36, pressionar: pressionar),
        Botao(texto: '8', tamanho: 36, pressionar: pressionar),
        Botao(texto: '9', tamanho: 36, pressionar: pressionar),
        Botao(texto: '×', tamanho: 36, pressionar: pressionar),
        Botao(texto: '4', tamanho: 36, pressionar: pressionar),
        Botao(texto: '5', tamanho: 36, pressionar: pressionar),
        Botao(texto: '6', tamanho: 36, pressionar: pressionar),
        Botao(texto: '-', tamanho: 36, pressionar: pressionar),
        Botao(texto: '1', tamanho: 36, pressionar: pressionar),
        Botao(texto: '2', tamanho: 36, pressionar: pressionar),
        Botao(texto: '3', tamanho: 36, pressionar: pressionar),
        Botao(texto: '+', tamanho: 36, pressionar: pressionar),
        Botao(texto: '0', tamanho: 36, pressionar: pressionar),
        Botao(texto: '.', tamanho: 36, pressionar: pressionar),
        Botao(texto: '+/-', tamanho: 36, pressionar: pressionar),
        FilledButton(
            onPressed: () => pressionar('='),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                overlayColor: MaterialStateProperty.all(Colors.black38)),
            child: const Text('=',
                style: TextStyle(color: Colors.white, fontSize: 46))),
      ],
    );
  }
}
