import 'dart:io';

void main() {
  double nota1, nota2, nota3, media;

  print("Digite a Primeira Nota: ");
  nota1 = receberNumeroConvertido();
  print("Digite a Segunda Nota: ");
  nota2 = receberNumeroConvertido();
  print("Digite a Terceira Nota: ");
  nota3 = receberNumeroConvertido();

  media = calcularMedia(nota1, nota2, nota3);
  if(media == -1) {
    print("Erro: Nota inválida inserida. As notas devem estar entre 0 e 10.");
  } else {
    print("Média: $media");
  }

}

double calcularMedia(double nota1, double nota2, double nota3) {
  if(nota1 < 0 || nota1 > 10 || nota2 < 0 || nota2 > 10 || nota3 < 0 || nota3 > 10) {
    return -1;
  } else {
    return (nota1 + nota2 + nota3) / 3;
  }
}

double receberNumeroConvertido() {
  String numero;
  numero = stdin.readLineSync() ?? '0';
  return double.tryParse(numero) ?? 0.0;
}

