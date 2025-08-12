import 'package:test/test.dart';
import '../lib/model/expressao.dart';
import 'dart:math';

void main() {
  group('Expressao - Basic Operations', () {
    test('should handle simple addition', () {
      expect(Expressao(dado: '2+3').toString(), '5.0');
      expect(Expressao(dado: '10+5').toString(), '15.0');
      expect(Expressao(dado: '0+0').toString(), '0.0');
    });

    test('should handle simple subtraction', () {
      expect(Expressao(dado: '5-3').toString(), '2.0');
      expect(Expressao(dado: '10-15').toString(), '-5.0');
      expect(Expressao(dado: '0-5').toString(), '-5.0');
    });

    test('should handle simple multiplication', () {
      expect(Expressao(dado: '3×4').toString(), '12.0');
      expect(Expressao(dado: '5×0').toString(), '0.0');
      expect(Expressao(dado: '7×1').toString(), '7.0');
    });

    test('should handle simple division', () {
      expect(Expressao(dado: '8÷2').toString(), '4.0');
      expect(Expressao(dado: '15÷3').toString(), '5.0');
      expect(Expressao(dado: '0÷5').toString(), '0.0');
    });

    test('should handle decimal numbers', () {
      expect(Expressao(dado: '3.5+2.5').toString(), '6.0');
      expect(Expressao(dado: '10.5-5.2').toString(), '5.3');
      expect(Expressao(dado: '2.5×3').toString(), '7.5');
      expect(Expressao(dado: '7.5÷2.5').toString(), '3.0');
    });

    test('should handle negative numbers', () {
      expect(Expressao(dado: '-5').toString(), '-5.0');
      expect(Expressao(dado: '-3+5').toString(), '2.0');
      expect(Expressao(dado: '10+-5').toString(), '5.0');
    });

    test('should handle positive signs', () {
      expect(Expressao(dado: '+5').toString(), '5.0');
      expect(Expressao(dado: '+3+2').toString(), '5.0');
    });
  });

  group('Expressao - Advanced Operations', () {
    test('should handle exponentiation', () {
      expect(Expressao(dado: '2^3').toString(), '8.0');
      expect(Expressao(dado: '3^2').toString(), '9.0');
      expect(Expressao(dado: '5^0').toString(), '1.0');
      expect(Expressao(dado: '10^1').toString(), '10.0');
    });

    test('should handle percentage', () {
      expect(Expressao(dado: '50%').toString(), '0.5');
      expect(Expressao(dado: '100%').toString(), '1.0');
      expect(Expressao(dado: '25%').toString(), '0.25');
    });

    test('should handle square operations', () {
      expect(Expressao(dado: '4^2').toString(), '16.0');
      expect(Expressao(dado: '3^2').toString(), '9.0');
    });

    test('should handle square root operations', () {
      expect(Expressao(dado: '9^(1÷2)').toString(), '3.0');
      expect(Expressao(dado: '16^(1÷2)').toString(), '4.0');
    });
  });

  group('Expressao - Trigonometric Functions', () {
    test('should handle sin function', () {
      // sin(0°) = 0
      expect(double.parse(Expressao(dado: 'sin(0)').toString()), closeTo(0.0, 0.01));
      
      // sin(30°) ≈ 0.5
      expect(double.parse(Expressao(dado: 'sin(30)').toString()), closeTo(0.5, 0.01));
      
      // sin(90°) = 1
      expect(double.parse(Expressao(dado: 'sin(90)').toString()), closeTo(1.0, 0.01));
    });

    test('should handle cos function', () {
      // cos(0°) = 1
      expect(double.parse(Expressao(dado: 'cos(0)').toString()), closeTo(1.0, 0.01));
      
      // cos(60°) ≈ 0.5
      expect(double.parse(Expressao(dado: 'cos(60)').toString()), closeTo(0.5, 0.01));
      
      // cos(90°) = 0
      expect(double.parse(Expressao(dado: 'cos(90)').toString()), closeTo(0.0, 0.01));
    });

    test('should handle tan function', () {
      // tan(0°) = 0
      expect(double.parse(Expressao(dado: 'tan(0)').toString()), closeTo(0.0, 0.01));
      
      // tan(45°) = 1
      expect(double.parse(Expressao(dado: 'tan(45)').toString()), closeTo(1.0, 0.01));
    });
  });

  group('Expressao - Parentheses and Brackets', () {
    test('should handle round parentheses', () {
      expect(Expressao(dado: '(2+3)×4').toString(), '20.0');
      expect(Expressao(dado: '2×(3+4)').toString(), '14.0');
      expect(Expressao(dado: '(5-2)+(3×2)').toString(), '9.0');
    });

    test('should handle square brackets', () {
      expect(Expressao(dado: '[2+3]×4').toString(), '20.0');
      expect(Expressao(dado: '2×[3+4]').toString(), '14.0');
    });

    test('should handle curly braces', () {
      expect(Expressao(dado: '{2+3}×4').toString(), '20.0');
      expect(Expressao(dado: '2×{3+4}').toString(), '14.0');
    });

    test('should handle nested parentheses', () {
      expect(Expressao(dado: '((2+3)×2)+1').toString(), '11.0');
      expect(Expressao(dado: '2×((3+1)×2)').toString(), '16.0');
    });

    test('should handle mixed bracket types', () {
      expect(Expressao(dado: '(2+[3×{1+1}])').toString(), '8.0');
      expect(Expressao(dado: '[2×(3+{2×1})]').toString(), '10.0');
    });
  });

  group('Expressao - Complex Expressions', () {
    test('should handle operator precedence', () {
      expect(Expressao(dado: '2+3×4').toString(), '14.0');
      expect(Expressao(dado: '10-6÷2').toString(), '7.0');
      expect(Expressao(dado: '2^3×4').toString(), '32.0');
    });

    test('should handle complex expressions with functions', () {
      expect(double.parse(Expressao(dado: 'sin(30)+cos(60)').toString()), closeTo(1.0, 0.01));
      expect(double.parse(Expressao(dado: '2×sin(90)').toString()), closeTo(2.0, 0.01));
    });

    test('should handle mixed operations', () {
      expect(Expressao(dado: '10%+0.5').toString(), '0.6');
      expect(Expressao(dado: '2^2+3×2').toString(), '10.0');
    });
  });

  group('Expressao - String to List Conversion', () {
    test('should correctly parse numbers', () {
      var result = Expressao.stringToList(valor: '123');
      expect(result, ['123']);
    });

    test('should correctly parse decimal numbers', () {
      var result = Expressao.stringToList(valor: '12.34');
      expect(result, ['12.34']);
    });

    test('should correctly parse operators', () {
      var result = Expressao.stringToList(valor: '2+3');
      expect(result, ['2', '+', '3']);
    });

    test('should correctly parse function names', () {
      var result = Expressao.stringToList(valor: 'sin(30)');
      expect(result, ['sin', '(', '30', ')']);
    });

    test('should handle spaces correctly', () {
      var result = Expressao.stringToList(valor: '2 + 3');
      expect(result, ['2', '+', '3']);
    });
  });

  group('Expressao - Helper Functions', () {
    test('should convert degrees to radians correctly', () {
      expect(Expressao.grausToRadiano(180), closeTo(pi, 0.01));
      expect(Expressao.grausToRadiano(90), closeTo(pi/2, 0.01));
      expect(Expressao.grausToRadiano(0), closeTo(0, 0.01));
    });

    test('should convert radians to degrees correctly', () {
      expect(Expressao.radianoToGraus(pi), closeTo(180, 0.1));
      expect(Expressao.radianoToGraus(pi/2), closeTo(90, 0.1));
      expect(Expressao.radianoToGraus(0), closeTo(0, 0.01));
    });

    test('should round numbers correctly', () {
      expect(Expressao.arrendondar(3.14159, 2), closeTo(3.14, 0.01));
      expect(Expressao.arrendondar(2.678, 1), closeTo(2.7, 0.01));
      expect(Expressao.arrendondar(5.0, 2), closeTo(5.0, 0.01));
    });
  });

  group('Expressao - Error Cases', () {
    test('should handle division by zero gracefully', () {
      expect(() => Expressao(dado: '5÷0').toString(), throwsA(anything));
    });

    test('should handle invalid expressions', () {
      expect(() => Expressao(dado: '2++3').toString(), throwsA(anything));
      expect(() => Expressao(dado: '2××3').toString(), throwsA(anything));
    });

    test('should handle mismatched parentheses', () {
      expect(() => Expressao(dado: '(2+3').toString(), throwsA(anything));
      expect(() => Expressao(dado: '2+3)').toString(), throwsA(anything));
    });

    test('should handle empty expressions', () {
      expect(() => Expressao(dado: '').toString(), throwsA(anything));
    });
  });
}