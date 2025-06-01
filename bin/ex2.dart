import 'dart:io';

void main() {
  
  // Variáveis.
  String nome;
  int idade;
  String cidade;

  // Entrada de dados do usuário.
  stdout.write("Digite seu Nome: ");
  nome = stdin.readLineSync() ?? '';

  stdout.write("Digite sua Idade: ");
  String inputIdade = stdin.readLineSync() ?? '0';
  idade = int.tryParse(inputIdade) ?? 0;

  stdout.write("Digite sua Cidade: ");
  cidade = stdin.readLineSync() ?? '';

  // Converte idade int para idade String.
  String idadedFormatada = idade.toString();

  // Contatena string/frase final.
  final String contatenada = "$nome tem $idadedFormatada anos e mora em $cidade";

  // Printa String contatenada.
  print("");
  print(contatenada);
}