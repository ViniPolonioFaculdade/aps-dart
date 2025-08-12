import 'package:flutter_test/flutter_test.dart';
import '../lib/model/expressao.dart';

void main() {
  group('Expressao Tests', () {
    test('Basic arithmetic operations', () {
      expect(Expressao(dado: '2+3').toString(), '5.0');
      expect(Expressao(dado: '10-5').toString(), '5.0');
      expect(Expressao(dado: '4×3').toString(), '12.0');
      expect(Expressao(dado: '15÷3').toString(), '5.0');
    });

    test('Exponentiation operations', () {
      expect(Expressao(dado: '2^3').toString(), '8.0');
      expect(Expressao(dado: '5^2').toString(), '25.0');
      expect(Expressao(dado: '4^(1÷2)').toString(), '2.0'); // Square root
    });

    test('Trigonometric functions with improved accuracy', () {
      // Test sin(30°) should be 0.5
      final sin30 = Expressao(dado: 'sin(30)').toString();
      expect(double.parse(sin30), closeTo(0.5, 0.01));
      
      // Test cos(60°) should be 0.5
      final cos60 = Expressao(dado: 'cos(60)').toString();
      expect(double.parse(cos60), closeTo(0.5, 0.01));
      
      // Test tan(45°) should be 1
      final tan45 = Expressao(dado: 'tan(45)').toString();
      expect(double.parse(tan45), closeTo(1.0, 0.01));
    });

    test('Logarithmic functions', () {
      // Test log(100) should be 2
      final log100 = Expressao(dado: 'log(100)').toString();
      expect(double.parse(log100), closeTo(2.0, 0.01));
      
      // Test ln(e) should be approximately 1
      final lnE = Expressao(dado: 'ln(2.718281828)').toString();
      expect(double.parse(lnE), closeTo(1.0, 0.01));
    });

    test('Parentheses and complex expressions', () {
      expect(Expressao(dado: '(2+3)×4').toString(), '20.0');
      expect(Expressao(dado: '2+(3×4)').toString(), '14.0');
      expect(Expressao(dado: '(10-5)×(6+4)').toString(), '50.0');
    });

    test('Percentage calculations', () {
      expect(Expressao(dado: '50%').toString(), '0.5');
      expect(Expressao(dado: '25%').toString(), '0.25');
    });

    test('String to list conversion', () {
      final list1 = Expressao.stringToList(valor: '2+3×4');
      expect(list1, ['2', '+', '3', '×', '4']);
      
      final list2 = Expressao.stringToList(valor: 'sin(30)');
      expect(list2, ['sin', '(', '30', ')']);
      
      final list3 = Expressao.stringToList(valor: 'log(100)');
      expect(list3, ['log', '(', '100', ')']);
    });

    test('Rounding function', () {
      expect(Expressao.arrendondar(3.14159, 2), closeTo(3.14, 0.001));
      expect(Expressao.arrendondar(2.567, 1), closeTo(2.6, 0.001));
      expect(Expressao.arrendondar(1.0, 2), 1.0);
    });

    test('Degree to radian conversion accuracy', () {
      // Test with improved pi accuracy
      final radian90 = Expressao.grausToRadiano(90);
      expect(radian90, closeTo(1.5708, 0.001)); // π/2
      
      final radian180 = Expressao.grausToRadiano(180);
      expect(radian180, closeTo(3.1416, 0.001)); // π
    });
  });
}