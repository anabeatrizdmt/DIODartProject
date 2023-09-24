import 'dart:convert';
import 'dart:io';
import 'package:bmi_calculator/classes/User.dart';

void main(List<String> arguments) {
  printHeader();

  String name = getUserInput("Informe seu nome:");
  double weight = getUserDoubleInput("Informe seu peso em quilos:");
  double height = getUserDoubleInput("Informe sua altura em metros:");

  User user = User(name, weight, height);
  double bmi = user.calculateBmi();
  String formattedBMI = bmi.toStringAsFixed(2);
  String bmiClassification = user.bmiClassification(bmi);

  print(
      '\n$name, seu IMC é: $formattedBMI. Classificado como: $bmiClassification.');
}

void printHeader() {
  print('');
  print('##############################');
  print('##### CALCULADORA DE IMC #####');
  print('##############################');
  print('');
}

String getUserInput(String prompt) {
  String? input;
  do {
    print(prompt);
    input = stdin.readLineSync(encoding: utf8)?.trim();
  } while (input == null || input.isEmpty);
  return input;
}

double getUserDoubleInput(String prompt) {
  double? input;
  do {
    String inputString = getUserInput(prompt);
    try {
      input = double.parse(inputString);
      if (input <= 0) {
        print("Por favor, insira um valor válido maior que zero.");
      }
    } catch (e) {
      print("Por favor, insira um valor numérico válido.");
    }
  } while (input == null || input <= 0);
  return input;
}
