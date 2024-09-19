import 'package:flutter/material.dart';
import 'package:calculadora/components/formula.dart';
import 'package:calculadora/components/extras.dart';
import 'package:calculadora/components/teclado.dart';
import 'package:calculadora/model/expressao.dart';

class Visor extends StatefulWidget {
  const Visor({super.key});

  @override
  State<Visor> createState() => _VisorState();
}

class _VisorState extends State<Visor> {
  String texto = '0';

  editar(String entrada) {
    setState(() {
      switch (entrada) {
        case 'AC':
          texto = '0';
          break;
        case '←':
          if ((texto.length > 1) & (texto != '0')) {
            texto = texto.substring(0, texto.length - 1);
          } else {
            texto = '0';
          }
          break;
        case '=':
          try {
            texto = Expressao(dado: texto).toString();
          } catch (e) {
            texto = 'Erro!';
          }
          break;
        case '+/-':
          texto += '×(-1)×';
          break;
        case 'sin':
          if (texto == '0') {
            texto = 'sin(';
          } else {
            texto += 'sin(';
          }
          break;
        case 'cos':
          if (texto == '0') {
            texto = 'cos(';
          } else {
            texto += 'cos(';
          }
          break;
        case 'tan':
          if (texto == '0') {
            texto = 'tan(';
          } else {
            texto += 'tan(';
          }
          break;
        case 'a²':
          texto += '^2';
          break;
        case 'aᵇ':
          texto += '^';
          break;
        case '√':
          texto += '^(1÷2)';
          break;
        default:
          if (texto == '0') {
            texto = entrada;
          } else {
            texto += entrada;
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Formula(texto: texto)),
          Extras(pressionar: editar),
          Teclado(texto: texto, pressionar: editar)
        ]);
  }
}
