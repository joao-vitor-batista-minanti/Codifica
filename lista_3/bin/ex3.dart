import 'dart:io';

void main() {
  List<String> listaDeCompras = [];

  print('Digite um item da lista de compras (ou "fim" para terminar): ');
  while (true) {
    String? entrada = stdin.readLineSync();
    if (entrada == null) continue;

    if (entrada.trim().toLowerCase() == 'fim') {
      break;
    }

    listaDeCompras.add(entrada);
  }

  print('Digite o nome do arquivo para salvar (ex: minhas_compras.txt):');
  String? nomeArquivo = stdin.readLineSync();

  if (nomeArquivo != null && nomeArquivo.trim().isNotEmpty) {
    salvarListaEmArquivo(listaDeCompras, nomeArquivo.trim());
  } else {
    print('Nome de arquivo inválido. A lista não foi salva.');
  }
}

void salvarListaEmArquivo(List<String> lista, String nomeArquivo) {
  try {
    File arquivo = File(nomeArquivo);
    // Cria ou sobrescreve o arquivo
    IOSink sink = arquivo.openWrite();
    for (String item in lista) {
      sink.writeln(item);
    }
    sink.close();
    print('Arquivo "$nomeArquivo" salvo com sucesso!');
  } catch (e) {
    print('Erro ao salvar o arquivo: $e');
  }
}
