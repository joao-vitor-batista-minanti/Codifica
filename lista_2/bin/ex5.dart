void main() {

  String valorA = "30";
  String valorB = "15.75";

  double valorAConvertido = double.tryParse(valorA) ?? 0;
  double valorBConvertido = double.tryParse(valorB) ?? 0;

  double soma = valorAConvertido + valorBConvertido;

  print('');
  print("A Soma de $valorA com $valorB: ${soma.toString()}");
  print('');
}