import 'package:bmi_calculator/classes/User.dart';
import 'package:test/test.dart';

void main() {
  test('should calculate right BMI', () {
    User user = User('name', 65, 1.65);
    expect(user.calculateBmi().toStringAsFixed(2), equals('23.88'));
  });

  test('should throw error if weight is zero', () {
    User user = User('name', 0, 1.65);
    expect(() => user.calculateBmi(), throwsA(TypeMatcher<ArgumentError>()));
  });

  test('should throw error if height is zero', () {
    User user = User('name', 65, 0);
    expect(() => user.calculateBmi(), throwsA(TypeMatcher<ArgumentError>()));
  });

  test('should calculate right Classification', () {
    User user = User('name', 65, 1.65);
    double bmi = user.calculateBmi();
    expect(user.bmiClassification(bmi), equals('Saudável'));
  });
}
