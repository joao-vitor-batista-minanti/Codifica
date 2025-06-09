import 'dart:io';

void main() {
  int numero;
  print("Digite um número para ver a tabuada: ");
  numero = receberNumeroConvertido();
  exibirTabuda(numero);
}

void exibirTabuda(int numero) {
  for(int i = 1 ; i <= 10 ; i++) {
    int atual = numero * i;
    print("$numero x $i = $atual");
  }
}

int receberNumeroConvertido() {
  String numero;
  numero = stdin.readLineSync() ?? '0';
  return int.tryParse(numero) ?? 0;
}