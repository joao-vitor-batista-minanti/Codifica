import 'dart:io';

void main() {
  lerConfiguracoes('config.txt');
}

void lerConfiguracoes(String nomeArquivo) {
  File arquivo = File(nomeArquivo);

  // Verifica se o arquivo existe
  if (!arquivo.existsSync()) {
    print('Erro: Arquivo "$nomeArquivo" não encontrado.');
    return;
  }

  print('Configurações encontradas:');

  try {
    // Lê todas as linhas do arquivo
    List<String> linhas = arquivo.readAsLinesSync();

    // Processa cada linha no formato "chave=valor"
    for (String linha in linhas) {
      if (linha.contains('=')) {
        List<String> partes = linha.split('=');
        if (partes.length == 2) {
          String chave = partes[0].trim();
          String valor = partes[1].trim();
          print('$chave: $valor');
        }
      }
    }

    print('Arquivo "$nomeArquivo" lido e fechado.');
  } catch (e) {
    // Captura qualquer erro ao ler o arquivo
    print('Erro ao ler o arquivo: $e');
  }
}