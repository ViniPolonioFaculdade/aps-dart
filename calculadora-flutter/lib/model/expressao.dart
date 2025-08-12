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

  static double rad = pi / 180;
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
          arrendondar(sin(grausToRadiano(double.parse(formula[index + 1]))), 10);
      formula.removeAt(index + 1);
      formula[index] = result.toString();
    },
    'cos': (int index, List formula) {
      double result = 0;
      result =
          arrendondar(cos(grausToRadiano(double.parse(formula[index + 1]))), 10);
      formula.removeAt(index + 1);
      formula[index] = result.toString();
    },
    'tan': (int index, List formula) {
      double result = 0;
      result =
          arrendondar(tan(grausToRadiano(double.parse(formula[index + 1]))), 10);
      formula.removeAt(index + 1);
      formula[index] = result.toString();
    },
    'log': (int index, List formula) {
      double value = double.parse(formula[index + 1]);
      if (value <= 0) {
        throw ArgumentError('Logarithm is only defined for positive numbers');
      }
      double result = arrendondar(log(value) / ln10, 10);
      formula.removeAt(index + 1);
      formula[index] = result.toString();
    },
    'ln': (int index, List formula) {
      double value = double.parse(formula[index + 1]);
      if (value <= 0) {
        throw ArgumentError('Natural logarithm is only defined for positive numbers');
      }
      double result = arrendondar(log(value), 10);
      formula.removeAt(index + 1);
      formula[index] = result.toString();
    },
    'sqrt': (int index, List formula) {
      double value = double.parse(formula[index + 1]);
      if (value < 0) {
        throw ArgumentError('Square root is only defined for non-negative numbers');
      }
      double result = arrendondar(sqrt(value), 10);
      formula.removeAt(index + 1);
      formula[index] = result.toString();
    },
    'abs': (int index, List formula) {
      double value = double.parse(formula[index + 1]);
      double result = value.abs();
      formula.removeAt(index + 1);
      formula[index] = result.toString();
    },
    'pi': (int index, List formula) {
      formula[index] = pi.toString();
    },
    'e': (int index, List formula) {
      formula[index] = e.toString();
    },
    '^': (int index, List formula) {
      num result = 0.0;
      result = pow(
          double.parse(formula[index - 1]), double.parse(formula[index + 1]));
      formula.removeAt(index + 1);
      formula.removeAt(index);
      formula[index - 1] = result.toString();
    },
    '%': (int index, List formula) {
      double result = 0;
      result = double.parse(formula[index - 1]) / 100;
      formula.removeAt(index);
      formula[index - 1] = result.toString();
    },
    '×': (int index, List formula) {
      double result = 0;
      result =
          double.parse(formula[index - 1]) * double.parse(formula[index + 1]);
      formula.removeAt(index + 1);
      formula.removeAt(index);
      formula[index - 1] = result.toString();
    },
    '÷': (int index, List formula) {
      double divisor = double.parse(formula[index + 1]);
      if (divisor == 0) {
        throw ArgumentError('Division by zero is not allowed');
      }
      double result = 0;
      result = double.parse(formula[index - 1]) / divisor;
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
    if (valor.trim().isEmpty) {
      throw ArgumentError('Expression cannot be empty');
    }
    
    // Check for double operators
    List<String> operators = ['+', '-', '×', '÷', '^'];
    for (int i = 0; i < valor.length - 1; i++) {
      if (operators.contains(valor[i]) && operators.contains(valor[i + 1])) {
        // Allow +/- after operators for negative numbers
        if (!((valor[i] == '+' || valor[i] == '-' || valor[i] == '×' || valor[i] == '÷' || valor[i] == '^') && 
              (valor[i + 1] == '+' || valor[i + 1] == '-'))) {
          throw ArgumentError('Invalid expression: consecutive operators "${valor[i]}${valor[i + 1]}"');
        }
      }
    }
    
    // Check for double dots
    if (valor.contains('..')) {
      throw ArgumentError('Invalid expression: double dots are not allowed');
    }
    
    // Check for double circumflex
    if (valor.contains('^^')) {
      throw ArgumentError('Invalid expression: double circumflex are not allowed');
    }
    
    List resultado = [];
    bool unirNum = false;
    bool unirLetras = false;
    Set num = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.'};
    Set letras = {'s', 'i', 'n', 'c', 'o', 't', 'a', 'l', 'g', 'q', 'r', 'b', 'p', 'e'};
    
    for (int i = 0; i < valor.length; i++) {
      if (valor[i] == ' ') {
        // Skip spaces but reset combination flags
        unirNum = false;
        unirLetras = false;
      } else if (num.contains(valor[i])) {
        if (unirNum) {
          if (resultado.length == 0) resultado.add('');
          resultado.last += valor[i];
        } else {
          resultado.add(valor[i]);
        }
        unirNum = true;
        unirLetras = false;
      } else if (letras.contains(valor[i])) {
        if (unirLetras) {
          if (resultado.length == 0) resultado.add('');
          resultado.last += valor[i];
        } else {
          resultado.add(valor[i]);
        }
        unirLetras = true;
        unirNum = false;
      } else {
        resultado.add(valor[i]);
        unirNum = false;
        unirLetras = false;
      }
    }
    
    // Validate bracket matching
    _validateBrackets(resultado);
    
    return resultado;
  }
  
  static void _validateBrackets(List tokens) {
    List<String> stack = [];
    Map<String, String> bracketPairs = {'(': ')', '[': ']', '{': '}'};
    
    for (var token in tokens) {
      if (bracketPairs.containsKey(token)) {
        stack.add(token);
      } else if (bracketPairs.containsValue(token)) {
        if (stack.isEmpty) {
          throw ArgumentError('Mismatched closing bracket: $token');
        }
        String lastOpening = stack.removeLast();
        if (bracketPairs[lastOpening] != token) {
          throw ArgumentError('Mismatched bracket types: $lastOpening and $token');
        }
      }
    }
    
    if (stack.isNotEmpty) {
      throw ArgumentError('Unmatched opening brackets: ${stack.join(", ")}');
    }
  }

  static double radianoToGraus(double valor) {
    return valor / rad;
  }

  static double grausToRadiano(double valor) {
    return valor * rad;
  }

  static double arrendondar(double valor, int casas) {
    if (casas < 0) {
      throw ArgumentError('Number of decimal places must be non-negative');
    }
    num fator = pow(10, casas);
    return (valor * fator).round() / fator;
  }

  calcularFormula({required List formula}) {
    if (formula.isEmpty) {
      throw ArgumentError('Formula cannot be empty');
    }
    
    // Create a copy to avoid modifying the original
    List formulaCopy = List.from(formula);
    
    for (String op in regras_operadores.keys) {
      int i = 0;
      int tamanho = formulaCopy.length;
      while (true) {
        if (i >= tamanho) break;
        if (formulaCopy[i] == op) {
          try {
            regras_operadores[op]!(i, formulaCopy);
            i = 0;
            tamanho = formulaCopy.length;
          } catch (e) {
            throw ArgumentError('Error processing operator "$op" at position $i: $e');
          }
        }
        i++;
      }
    }
    
    if (formulaCopy.isEmpty) {
      throw ArgumentError('Calculation resulted in empty formula');
    }
    
    return formulaCopy.last;
  }

  segmentar({required List exp}) {
    List<List> stack = [];
    List current = [];
    
    for (var element in exp) {
      bool isOpeningBracket = false;
      bool isClosingBracket = false;
      
      // Check for opening brackets
      for (var rule in regras_ordem) {
        if (element == rule['inicio']) {
          stack.add(current);
          current = [];
          isOpeningBracket = true;
          break;
        }
      }
      
      if (!isOpeningBracket) {
        // Check for closing brackets
        for (var rule in regras_ordem) {
          if (element == rule['fim']) {
            // Calculate the current bracket content
            var result = calcularFormula(formula: current);
            // Restore previous level
            if (stack.isNotEmpty) {
              current = stack.removeLast();
              current.add(result);
            } else {
              current = [result];
            }
            isClosingBracket = true;
            break;
          }
        }
        
        if (!isClosingBracket) {
          current.add(element);
        }
      }
    }
    
    // If there are unmatched opening brackets
    if (stack.isNotEmpty) {
      throw ArgumentError('Mismatched opening brackets');
    }
    
    return calcularFormula(formula: current);
  }

  @override
  String toString() {
    try {
      this.ordem = stringToList(valor: this.dado);
      this.resultado = segmentar(exp: ordem);
      return this.resultado.toString();
    } catch (e) {
      // Re-throw with more context
      throw ArgumentError('Error evaluating expression "${this.dado}": $e');
    }
  }
}
