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
  double _memory = 0.0; // Memory storage
  bool _hasMemory = false; // Track if memory has a value

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
            // Validate input before calculation
            if (texto.isEmpty || texto == '0') {
              texto = '0';
              break;
            }
            
            // Check for invalid double operators
            if (_hasInvalidOperators(texto)) {
              texto = 'Entrada Inválida';
              break;
            }
            
            String result = Expressao(dado: texto).toString();
            texto = _formatResult(result);
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
        case 'log':
          if (texto == '0') {
            texto = 'log(';
          } else {
            texto += 'log(';
          }
          break;
        case 'ln':
          if (texto == '0') {
            texto = 'ln(';
          } else {
            texto += 'ln(';
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
        case 'MC': // Memory Clear
          _memory = 0.0;
          _hasMemory = false;
          break;
        case 'MR': // Memory Recall
          if (_hasMemory) {
            if (texto == '0') {
              texto = _memory.toString();
            } else {
              texto += _memory.toString();
            }
          }
          break;
        case 'M+': // Memory Add
          try {
            double currentValue = double.parse(texto);
            _memory += currentValue;
            _hasMemory = true;
          } catch (e) {
            // If current text is not a number, try to calculate it first
            try {
              double result = double.parse(Expressao(dado: texto).toString());
              _memory += result;
              _hasMemory = true;
            } catch (e) {
              // Invalid expression, do nothing
            }
          }
          break;
        case 'M-': // Memory Subtract
          try {
            double currentValue = double.parse(texto);
            _memory -= currentValue;
            _hasMemory = true;
          } catch (e) {
            // If current text is not a number, try to calculate it first
            try {
              double result = double.parse(Expressao(dado: texto).toString());
              _memory -= result;
              _hasMemory = true;
            } catch (e) {
              // Invalid expression, do nothing
            }
          }
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

  // Formats the result for better display
  String _formatResult(String result) {
    try {
      double value = double.parse(result);
      
      // Handle special cases
      if (value.isNaN) return 'Erro!';
      if (value.isInfinite) return value.isNegative ? '-∞' : '∞';
      
      // If it's a whole number and not too large, show without decimals
      if (value == value.toInt() && value.abs() < 1e12) {
        return value.toInt().toString();
      }
      
      // For very small numbers, use scientific notation
      if (value.abs() < 1e-6 && value != 0) {
        return value.toStringAsExponential(2);
      }
      
      // For very large numbers, use scientific notation
      if (value.abs() >= 1e12) {
        return value.toStringAsExponential(2);
      }
      
      // Otherwise, show with appropriate decimal places
      return value.toStringAsFixed(8).replaceAll(RegExp(r'0*$'), '').replaceAll(RegExp(r'\.$'), '');
    } catch (e) {
      return result; // Return original if parsing fails
    }
  }

  // Validates input to prevent double operators and invalid sequences
  bool _hasInvalidOperators(String input) {
    // Check for double operators
    List<String> invalidPatterns = [
      '++', '--', '××', '÷÷', '..', '^^', '%%',
      '()', '[]', '{}', '+×', '+÷', '-×', '-÷',
      '×+', '×-', '÷+', '÷-', '+%', '-%', '×%', '÷%'
    ];
    
    for (String pattern in invalidPatterns) {
      if (input.contains(pattern)) {
        return true;
      }
    }
    
    // Check for operators at the end (except for closing brackets)
    if (input.isNotEmpty) {
      String lastChar = input[input.length - 1];
      if (['+', '-', '×', '÷', '^', '.'].contains(lastChar)) {
        return true;
      }
    }
    
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Formula(texto: texto, hasMemory: _hasMemory)),
          Extras(pressionar: editar),
          Teclado(texto: texto, pressionar: editar)
        ]);
  }
}
