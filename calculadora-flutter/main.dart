

import 'dart:io';
import 'dart:math';

class Expressao {
  String dado;
  List ordem = [];
  var resultado;

  static double rad = 180 / 3.14;
  static List<Map<String, String>> regras_ordem = [
    {
      'inicio': '(',
      'fim': ')',
    },
    {
      'inicio': '[',
      'fim': ']',
    },
    {
      'inicio': '{',
      'fim': '}',
    },
  ];
  static Map<String, Function> regras_operadores = {
    'sin': (int index, List formula) {
      double result = 0;
      result =
          arrendondar(sin(grausToRadiano(double.parse(formula[index + 1]))), 2);
      formula.removeAt(index + 1);
      formula[index] = result.toString();
    },
    'cos': (int index, List formula) {
      double result = 0;
      result =
          arrendondar(cos(grausToRadiano(double.parse(formula[index + 1]))), 2);
      formula.removeAt(index + 1);
      formula[index] = result.toString();
    },
    'tan': (int index, List formula) {
      double result = 0;
      result =
          arrendondar(tan(grausToRadiano(double.parse(formula[index + 1]))), 2);
      formula.removeAt(index + 1);
      formula[index] = result.toString();
    },
    '^': (int index, List formula) {
      num result = 0.0;
      result = pow(
          double.parse(formula[index - 1]), double.parse(formula[index + 1]));
      formula.removeAt(index + 1);
      formula.removeAt(index);
      formula[index - 1] = result.toString();
    },
    '*': (int index, List formula) {
      double result = 0;
      result =
          double.parse(formula[index - 1]) * double.parse(formula[index + 1]);
      formula.removeAt(index + 1);
      formula.removeAt(index);
      formula[index - 1] = result.toString();
    },
    '/': (int index, List formula) {
      double result = 0;
      result =
          double.parse(formula[index - 1]) / double.parse(formula[index + 1]);
      formula.removeAt(index + 1);
      formula.removeAt(index);
      formula[index - 1] = result.toString();
    },
    '+': (int index, List formula) {
      double result = 0;
      if (index == 0) {
        result = double.parse(formula[index + 1]);
        formula.removeAt(index + 1);
        formula[index] = result.toString();
      } else {
        result =
            double.parse(formula[index - 1]) + double.parse(formula[index + 1]);
        formula.removeAt(index + 1);
        formula.removeAt(index);
        formula[index - 1] = result.toString();
      }
    },
    '-': (int index, List formula) {
      double result = 0;
      if (index == 0) {
        result = (-1) * double.parse(formula[index + 1]);
        formula.removeAt(index + 1);
        formula[index] = result.toString();
      } else {
        result =
            double.parse(formula[index - 1]) - double.parse(formula[index + 1]);
        formula.removeAt(index + 1);
        formula.removeAt(index);
        formula[index - 1] = result.toString();
      }
    },
  };

  Expressao({required this.dado}) {
    this.ordem = stringToList(valor: this.dado);
  }

  static List stringToList({required String valor}) {
    List resultado = [];
    bool unirNum = false;
    bool unirLetras = false;
    Set num = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.'};
    Set letras = {'s', 'i', 'n', 'c', 'o', 't', 'a'};
    for (int i = 0; i < valor.length; i++) {
      if (valor[i] == ' ') {
      } else if (num.contains(valor[i])) {
        if (unirNum) {
          if (resultado.length == 0) resultado.add('');
          resultado.last += valor[i];
        } else {
          resultado.add(valor[i]);
        }
        unirNum = true;
      } else if (letras.contains(valor[i])) {
        if (unirLetras) {
          if (resultado.length == 0) resultado.add('');
          resultado.last += valor[i];
        } else {
          resultado.add(valor[i]);
        }
        unirLetras = true;
      } else {
        resultado.add(valor[i]);
        unirNum = false;
        unirLetras = false;
      }
    }
    return resultado;
  }

  static double radianoToGraus(double valor) {
    return valor * rad;
  }

  static double grausToRadiano(double valor) {
    return valor / rad;
  }

  static double arrendondar(double valor, int casas) {
    num fator = pow(10, casas);
    double result = (valor * fator).toInt().toDouble();
    String pont = result.toInt().toString();
    int ultimo = int.parse(pont[pont.length - 1]);
    int diferenca = 10 - ultimo;
    if (diferenca <= 5) {
      result = (diferenca + result) / fator;
    } else {
      result = (result - ultimo) / fator;
    }
    return result;
  }

  calcularFormula({required List formula}) {
    for (String op in regras_operadores.keys) {
      int i = 0;
      int tamanho = formula.length;
      while (true) {
        if (i >= tamanho) break;
        if (formula[i] == op) {
          regras_operadores[op]!(i, formula);
          i = 0;
          tamanho = formula.length;
        }
        i++;
      }
    }
    return formula.last;
  }

  segmentar({required List exp}) {
    bool agrupar = false;

    List parte = [];
    List aux = exp;
    List total = exp;
    for (var o in regras_ordem) {
      aux = total;
      total = [];
      for (var e in aux) {
        if (o['inicio'] == e) {
          agrupar = true;
        } else if (o['fim'] == e) {
          agrupar = false;
          total.add(calcularFormula(formula: parte));
          parte = [];
        } else {
          if (agrupar) {
            parte.add(e);
          } else {
            total.add(e);
          }
        }
      }
      print('= ${aux.reduce((value, element) => value += element)}');
    }
    return calcularFormula(formula: total);
  }

  @override
  String toString() {
    this.ordem = stringToList(valor: this.dado);
    this.resultado = segmentar(exp: ordem);
    return this.resultado.toString();
  }
}

void main(List<String> args) {
  /*
    SAMPLES

    {(2+5)*[(3+4)+(2^2)]}*3
    [2^(0.5)]
    4 * (1/2)
    sin(30)
  */
  String entrada = '';
  do {
    entrada = stdin.readLineSync().toString();
    if (entrada == '') break;
    Expressao expressao = Expressao(dado: entrada);
    print('= ${expressao}');
  } while (true);
}
