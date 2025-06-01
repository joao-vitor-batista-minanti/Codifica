import 'dart:io';

void main() {

  // Variáveis.
  final double orcamento;
  double item1;
  double item2;
  double item3;
  double custototal;

  // Recebe valor das varáveis do usuário.
  print('');
  stdout.write("Digite seu orçamento: ");
  orcamento = receberNumeroConvertido();

  stdout.write("Digitee o Valor do Item 1: ");
  item1 = receberNumeroConvertido();

  stdout.write("Digitee o Valor do Item 2: ");
  item2 = receberNumeroConvertido();

  stdout.write("Digitee o Valor do Item 3: ");
  item3 = receberNumeroConvertido();


  custototal = somarItens(item1, item2, item3);
  informarUsuario(orcamento, custototal);

}

double receberNumeroConvertido() {
  String numero;
  numero = stdin.readLineSync() ?? '0';
  return double.tryParse(numero) ?? 0.0;
}

double somarItens(double num1, double num2, double num3) { return num1 + num2 + num3; }

void informarUsuario(double orcamento, double custototal) {

  print('');
  if (orcamento >= custototal) {
    print("Dentro do orçamento!");
    print("Custo Total: $custototal");
  } else {
    print("Orçamento Estourado!");
    print("Custo Total: $custototal");
  }

}