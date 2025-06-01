void main() {
    
  // Fahrenheit = (Celsius * 9/5) + 32.
  // Celsius = (Fahrenheit - 32) * 5/9.
  const double fatorSomaSubstracao = 32;
  const double fatorMultiplicacaoFahrenheit = 9/5;
  const double fatorMultiplicacaoCelsius = 5/9;

  // Define Variáveis
  double temperaturaCelsiusOriginal = 10.0;
  final double temperaturaConvertidaFahrenheit;
  final double temperaturaReconvertidaCelsius;

  // Converte
  temperaturaConvertidaFahrenheit = (temperaturaCelsiusOriginal * fatorMultiplicacaoFahrenheit) + fatorSomaSubstracao;
  temperaturaReconvertidaCelsius = (temperaturaConvertidaFahrenheit - fatorSomaSubstracao) * fatorMultiplicacaoCelsius;

  imprimirConversoes(temperaturaCelsiusOriginal, temperaturaConvertidaFahrenheit, temperaturaReconvertidaCelsius);

}

imprimirConversoes(double temperaturaCelsiusOriginal, double temperaturaConvertidaFahrenheit, double temperaturaReconvertidaCelsius) {
  print("Temperatura Celsius Original: $temperaturaCelsiusOriginal°C");
  print("Convertido para Fahrenheit: ${temperaturaConvertidaFahrenheit.toStringAsFixed(2)}°F");
  print("Reconvertido para Celsius: ${temperaturaReconvertidaCelsius.toStringAsFixed(2)}°C");
}