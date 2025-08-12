import '../lib/model/expressao.dart';

void main() {
  print('=== CALCULATOR FUNCTIONALITY DEMO ===\n');
  
  List<String> expressions = [
    'sqrt(pi^2)+ln(e^3)',
    'log(1000)+abs(-5)×sin(30)',
    '((2+3)×[4+{sqrt(9)}])÷2',
    'sin(90)+cos(0)+tan(45)',
    'pi×e÷sqrt(16)',
    'ln(e^2)+log(10^2)+abs(-10)',
    '(sqrt(25)+abs(-3))^2÷4',
    'sin(30)×cos(60)+tan(0)'
  ];
  
  for (String expr in expressions) {
    try {
      String result = Expressao(dado: expr).toString();
      print('$expr = $result');
    } catch (e) {
      print('$expr = ERROR: $e');
    }
  }
  
  print('\n=== ERROR HANDLING DEMO ===\n');
  
  List<String> errorExpressions = [
    '5÷0',
    'sqrt(-4)',
    'log(-1)',
    '2++3',
    '(2+3]',
    ''
  ];
  
  for (String expr in errorExpressions) {
    try {
      String result = Expressao(dado: expr).toString();
      print('$expr = $result (UNEXPECTED - should have failed)');
    } catch (e) {
      print('$expr = ERROR (EXPECTED): ${e.toString().split(':')[0]}');
    }
  }
  
  print('\n=== DEMO COMPLETE ===');
}