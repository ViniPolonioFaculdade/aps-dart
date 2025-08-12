import 'dart:io';
import '../lib/model/expressao.dart';
import 'dart:math';

void main() {
  print('Testing Additional Improvements...\n');
  
  // Test enhanced error handling
  print('=== Enhanced Error Handling ===');
  testErrorCase('++', 'Double plus');
  testErrorCase('--', 'Double minus');
  testErrorCase('××', 'Double multiplication');
  testErrorCase('÷÷', 'Double division');
  testErrorCase('^^', 'Double exponentiation');
  testErrorCase('..', 'Double dots');
  testErrorCase(')', 'Unmatched closing parenthesis');
  testErrorCase('()', 'Empty parentheses');
  testErrorCase('[}', 'Mismatched bracket types');
  testErrorCase('({[})]', 'Complex mismatched brackets');

  // Test improved precision
  print('\n=== Improved Precision ===');
  testTrigoExpression('sin(180)', 0.0, 0.001);
  testTrigoExpression('cos(180)', -1.0, 0.001);
  testTrigoExpression('tan(180)', 0.0, 0.001);
  testHelperFunction('grausToRadiano(360)', Expressao.grausToRadiano(360), 2*pi, 0.0001);
  testHelperFunction('radianoToGraus(2π)', Expressao.radianoToGraus(2*pi), 360, 0.001);

  // Test complex nested expressions
  print('\n=== Complex Nested Expressions ===');
  testExpression('(((2+3)))×4', '20.0');
  testExpression('[2×(3+[1×2])]', '10.0');
  testExpression('{2+{3×[1+(2×1)]}}', '11.0');
  testExpression('((1+2)×(3+4))×2', '42.0');

  // Test edge cases for operators
  print('\n=== Edge Cases ===');
  testExpression('0^0', '1.0');
  testExpression('1^1000', '1.0');
  testExpression('0×1000', '0.0');
  testExpression('1000×0', '0.0');
  testExpression('0%', '0.0');
  testExpression('200%', '2.0');

  // Test rounding improvements
  print('\n=== Rounding Improvements ===');
  testHelperFunction('arrendondar(3.1415926, 3)', Expressao.arrendondar(3.1415926, 3), 3.142, 0.0001);
  testHelperFunction('arrendondar(2.7182818, 4)', Expressao.arrendondar(2.7182818, 4), 2.7183, 0.00001);
  testHelperFunction('arrendondar(1.9999, 2)', Expressao.arrendondar(1.9999, 2), 2.0, 0.001);

  // Test improved division by zero handling
  print('\n=== Division by Zero Handling ===');
  testErrorCase('1÷0', 'Division by zero');
  testErrorCase('0÷0', 'Zero divided by zero');
  testErrorCase('(5-5)÷(2-2)', 'Calculated zero division');

  // Test negative number handling
  print('\n=== Negative Number Handling ===');
  testExpression('(-5)', '-5.0');
  testExpression('(-2)^2', '4.0');
  testExpression('(-3)×(-4)', '12.0');
  testExpression('5×(-2)', '-10.0');
  testExpression('sin(-90)', '-1.0');

  // Test decimal precision
  print('\n=== Decimal Precision ===');
  testExpression('0.1+0.2', '0.30000000000000004'); // Known floating point issue
  testExpression('1.5×2.5', '3.75');
  testExpression('3.14159^2', '9.869587728');

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