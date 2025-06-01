import 'dart:io';

void main() {

  print('');
  print("Digite o primeiro número: ");
  final double num1 = receberNumeroConvertido();

  print("Digite o segundo número: ");
  final double num2 = receberNumeroConvertido();

  // Variáveis que recebem o resultado das operações.
  final double soma = calcularSoma(num1, num2);
  final double subtracao = calcularSubtracao(num1, num2);
  final double multiplicacao = calcularMultiplicacao(num1, num2);
  final double divisao = calcularDivisao(num1, num2);
  final double media = calcularMedia(num1, num2);
  final double resto = calcularResto(num1, num2);

  imprimirResultados(num1, num2, soma, subtracao, multiplicacao, divisao, media, resto);
}

// Converte para double:
double receberNumeroConvertido() {
  String numero;
  numero = stdin.readLineSync() ?? '0';
  return double.tryParse(numero) ?? 0.0;
}

// Operações:
double calcularSoma(double num1, double num2) { return num1 + num2; }
double calcularSubtracao(double num1, double num2) { return num1 - num2; }
double calcularMultiplicacao(double num1, double num2) { return num1 * num2; }
double calcularDivisao(double num1, double num2) { return num1 / num2; }
double calcularMedia(double num1, double num2) { return (calcularSoma(num1, num2)) / 2; }
double calcularResto(double num1, double num2) { return num1 % num2; }

// Impressão
void imprimirResultados(double num1, double num2, double soma, double subtracao, double multiplicacao, double divisao, double media, double resto) {
  print("");
  print("Número 1: $num1");
  print("Numero 2: $num2");
  print("--- Resultados ---");
  print("Soma: $soma");
  print("Subtração: $subtracao");
  print("MultiplicaçãoÇ $multiplicacao");
  print("Divião: $divisao");
  print("Divisao: $divisao");
  print("Média: $media");
  print("Resto da Divisão (Módulo): $resto");
  print('');
}