/*
    ►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►  English ◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄
    
    Hello, I'm glad you went into my repository and looked at this project ;)
    Here, we have an expression class that receives a string, processes it and calculates the
    end result, like those cell phone calculators. The documentation for this project
    would be in English.

    Functionalities:
      1 - Calculation with basic operators: + - (add), - - (subtract), * - (multiply), / - (divide);
      2 - Calculates functions: sin(), cos(), tan();
      3 - Processes data of type int and double: 1 and 0.99;
      4 - The size of the expression has no determined limit;

    However, this code has some noted limitations:
      1 - The calculator does not accept two signs, example: ++, --, //, .., ^^, (()), [[]] and {{}};
      2 - The conversion functions from radians to degrees and vice versa are inaccurate;
      3 - The entry of arguments by "main(List<String> args)" ends up removing the exponentiation operator "^"
      leaving the place empty;
      4 - It does not have an input treatment of incorrect user values;

    Therefore, you are free to evolve and optimize the code, correcting bugs and broken logic.



    ►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►  Portuguese ◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄◄
    
    Olá, fico feliz que você tenha entrado no meu repositório e olhado este projeto ;)
    Aqui, temos uma classe expressão que recebe uma string, faz o tratamento e calcula o
    resultado fim, como se fosse aquelas calculadoras de celular. A documentação deste projeto
    ficara em inglês.

    Funcionalidades:
      1 - Calculo com operadores básicos: + - (somar), - - (subtrair), * - (multiplicar), / - (dividir);
      2 - Faz calculo de funções: sin(), cos(), tan();
      3 - Processa dados de tipo int e double: 1 e 0.99;
      4 - O tamanho da expressão não tem limite determinado;

    Entretando, este codigo possui algumas limitações observadas:
      1 - A calculadora não aceita sinais duplos, exemplo: ++, --, //, .., ^^, (()), [[]] e {{}};
      2 - O as funções de conversão de radianos para graus e vice-versa são imprecissas;
      3 - A entrada de argumentos por "main(List<String> args)" acaba retirando o operador de exponenciação "^"
      deixando o lugar vazio;
      4 - Não possui um tratamento de entrada de valores incorretos do usuario;

    Por isso, vocês tem liberdade para evoluir e otimizar o codigo, corrigindo bugs e lógicas quebradas.
*/

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
