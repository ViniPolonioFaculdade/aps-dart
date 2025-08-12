import 'dart:io';
import '../lib/model/expressao.dart';
import 'dart:math';

void main() {
  print('Testing Expressao class...\n');
  
  // Basic operations tests
  print('=== Basic Operations ===');
  testExpression('2+3', '5.0');
  testExpression('10-5', '5.0');
  testExpression('3×4', '12.0');
  testExpression('8÷2', '4.0');
  testExpression('3.5+2.5', '6.0');
  testExpression('-5', '-5.0');
  testExpression('+5', '5.0');

  // Advanced operations
  print('\n=== Advanced Operations ===');
  testExpression('2^3', '8.0');
  testExpression('50%', '0.5');
  testExpression('9^(1÷2)', '3.0');

  // Trigonometric functions
  print('\n=== Trigonometric Functions ===');
  testTrigoExpression('sin(0)', 0.0, 0.01);
  testTrigoExpression('sin(30)', 0.5, 0.01);
  testTrigoExpression('sin(90)', 1.0, 0.01);
  testTrigoExpression('cos(0)', 1.0, 0.01);
  testTrigoExpression('cos(60)', 0.5, 0.01);
  testTrigoExpression('cos(90)', 0.0, 0.01);
  testTrigoExpression('tan(0)', 0.0, 0.01);
  testTrigoExpression('tan(45)', 1.0, 0.01);

  // Parentheses and brackets
  print('\n=== Parentheses and Brackets ===');
  testExpression('(2+3)×4', '20.0');
  testExpression('[2+3]×4', '20.0');
  testExpression('{2+3}×4', '20.0');
  testExpression('((2+3)×2)+1', '11.0');
  testExpression('(2+[3×{1+1}])', '8.0');

  // Complex expressions
  print('\n=== Complex Expressions ===');
  testExpression('2+3×4', '14.0');
  testExpression('10-6÷2', '7.0');
  testExpression('2^3×4', '32.0');
  testExpression('10%+0.5', '0.6');

  // String to List conversion
  print('\n=== String to List Conversion ===');
  testStringToList('123', ['123']);
  testStringToList('12.34', ['12.34']);
  testStringToList('2+3', ['2', '+', '3']);
  testStringToList('sin(30)', ['sin', '(', '30', ')']);
  testStringToList('2 + 3', ['2', '+', '3']);

  // Helper functions
  print('\n=== Helper Functions ===');
  testHelperFunction('grausToRadiano(180)', Expressao.grausToRadiano(180), pi, 0.01);
  testHelperFunction('radianoToGraus(π)', Expressao.radianoToGraus(pi), 180, 0.1);
  testHelperFunction('arrendondar(3.14159, 2)', Expressao.arrendondar(3.14159, 2), 3.14, 0.01);

  // Error cases
  print('\n=== Error Cases ===');
  testErrorCase('5÷0', 'Division by zero');
  testErrorCase('2++3', 'Double operators');
  testErrorCase('(2+3', 'Mismatched parentheses');
  testErrorCase('', 'Empty expression');

  print('\n=== Test Summary ===');
  print('Passed: $passedTests');
  print('Failed: $failedTests');
  print('Total: ${passedTests + failedTests}');
}

int passedTests = 0;
int failedTests = 0;

void testExpression(String input, String expected) {
  try {
    String result = Expressao(dado: input).toString();
    if (result == expected) {
      print('✓ $input = $result');
      passedTests++;
    } else {
      print('✗ $input = $result (expected $expected)');
      failedTests++;
    }
  } catch (e) {
    print('✗ $input threw error: $e');
    failedTests++;
  }
}

void testTrigoExpression(String input, double expected, double tolerance) {
  try {
    String result = Expressao(dado: input).toString();
    double actualValue = double.parse(result);
    if ((actualValue - expected).abs() < tolerance) {
      print('✓ $input ≈ $result (expected ≈ $expected)');
      passedTests++;
    } else {
      print('✗ $input = $result (expected ≈ $expected)');
      failedTests++;
    }
  } catch (e) {
    print('✗ $input threw error: $e');
    failedTests++;
  }
}

void testStringToList(String input, List<String> expected) {
  try {
    List result = Expressao.stringToList(valor: input);
    if (listEquals(result, expected)) {
      print('✓ stringToList("$input") = $result');
      passedTests++;
    } else {
      print('✗ stringToList("$input") = $result (expected $expected)');
      failedTests++;
    }
  } catch (e) {
    print('✗ stringToList("$input") threw error: $e');
    failedTests++;
  }
}

void testHelperFunction(String name, double actual, double expected, double tolerance) {
  if ((actual - expected).abs() < tolerance) {
    print('✓ $name ≈ $actual (expected ≈ $expected)');
    passedTests++;
  } else {
    print('✗ $name = $actual (expected ≈ $expected)');
    failedTests++;
  }
}

void testErrorCase(String input, String description) {
  try {
    String result = Expressao(dado: input).toString();
    print('✗ $input should have failed ($description) but got: $result');
    failedTests++;
  } catch (e) {
    print('✓ $input correctly failed ($description): ${e.runtimeType}');
    passedTests++;
  }
}

bool listEquals(List a, List b) {
  if (a.length != b.length) return false;
  for (int i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}