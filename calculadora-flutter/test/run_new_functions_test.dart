import 'dart:io';
import '../lib/model/expressao.dart';
import 'dart:math';

void main() {
  print('Testing New Mathematical Functions...\n');
  
  // Test logarithms
  print('=== Logarithmic Functions ===');
  testTrigoExpression('log(100)', 2.0, 0.01);
  testTrigoExpression('log(1000)', 3.0, 0.01);
  testTrigoExpression('log(1)', 0.0, 0.01);
  testTrigoExpression('ln(e)', 1.0, 0.01);
  testTrigoExpression('ln(1)', 0.0, 0.01);
  
  // Test square root
  print('\n=== Square Root Function ===');
  testExpression('sqrt(4)', '2.0');
  testExpression('sqrt(9)', '3.0');
  testExpression('sqrt(16)', '4.0');
  testExpression('sqrt(0)', '0.0');
  
  // Test absolute value
  print('\n=== Absolute Value Function ===');
  testExpression('abs(-5)', '5.0');
  testExpression('abs(5)', '5.0');
  testExpression('abs(-3.14)', '3.14');
  testExpression('abs(0)', '0.0');
  
  // Test mathematical constants
  print('\n=== Mathematical Constants ===');
  testTrigoExpression('pi', pi, 0.0001);
  testTrigoExpression('e', e, 0.0001);
  testTrigoExpression('2×pi', 2*pi, 0.0001);
  testTrigoExpression('e^1', e, 0.0001);
  
  // Test combined new functions
  print('\n=== Combined New Functions ===');
  testTrigoExpression('sqrt(pi)', sqrt(pi), 0.001);
  testTrigoExpression('ln(e^2)', 2.0, 0.01);
  testTrigoExpression('abs(sin(-90))', 1.0, 0.01);
  testTrigoExpression('log(10^3)', 3.0, 0.01);
  
  // Test error cases for new functions
  print('\n=== Error Cases for New Functions ===');
  testErrorCase('log(-1)', 'Negative logarithm');
  testErrorCase('log(0)', 'Zero logarithm');
  testErrorCase('ln(-5)', 'Negative natural logarithm');
  testErrorCase('ln(0)', 'Zero natural logarithm');
  testErrorCase('sqrt(-4)', 'Negative square root');

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