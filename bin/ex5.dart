import 'dart:io';

List<String> tarefas = [];

void main() {
  while (true) {
    exibirMenu();
    String? entrada = stdin.readLineSync();

    switch (entrada) {
      case '1':
        adicionarTarefa();
        break;
      case '2':
        listarTarefas();
        break;
      case '3':
        marcarComoConcluida();
        break;
      case '4':
        salvarTarefasEmArquivo('tarefas.txt');
        print('Encerrando programa.');
        return;
      default:
        print('Opção inválida. Tente novamente.');
    }
  }
}

void exibirMenu() {
  print('\nEscolha uma opção:');
  print('1. Adicionar tarefa');
  print('2. Listar tarefas');
  print('3. Marcar tarefa como concluída');
  print('4. Sair');
}

void adicionarTarefa() {
  print('Digite a descrição da tarefa:');
  String? descricao = stdin.readLineSync();
  if (descricao != null && descricao.trim().isNotEmpty) {
    tarefas.add(descricao.trim());
    print('Tarefa adicionada com sucesso!');
  } else {
    print('Descrição inválida.');
  }
}

void listarTarefas() {
  List<String> pendentes = tarefas.where((t) => !t.endsWith('(concluída)')).toList();
  List<String> concluidas = tarefas.where((t) => t.endsWith('(concluída)')).toList();

  print('\nTarefas pendentes:');
  if (pendentes.isEmpty) {
    print('- Nenhuma');
  } else {
    for (var t in pendentes) {
      print('- $t');
    }
  }

  print('\nTarefas concluídas:');
  if (concluidas.isEmpty) {
    print('- Nenhuma');
  } else {
    for (var t in concluidas) {
      print('- $t');
    }
  }
}

void marcarComoConcluida() {
  List<String> pendentes = tarefas.where((t) => !t.endsWith('(concluída)')).toList();

  if (pendentes.isEmpty) {
    print('Nenhuma tarefa pendente para concluir.');
    return;
  }

  print('\nQual tarefa deseja concluir?');
  for (int i = 0; i < pendentes.length; i++) {
    print('[${i + 1}] ${pendentes[i]}');
  }

  String? entrada = stdin.readLineSync();
  int? escolha = int.tryParse(entrada ?? '');

  if (escolha == null || escolha < 1 || escolha > pendentes.length) {
    print('Opção inválida.');
    return;
  }

  String tarefaSelecionada = pendentes[escolha - 1];
  int indiceOriginal = tarefas.indexOf(tarefaSelecionada);
  tarefas[indiceOriginal] = '${tarefaSelecionada} (concluída)';
  print('Tarefa "${tarefaSelecionada}" concluída!');
}

void salvarTarefasEmArquivo(String nomeArquivo) {
  try {
    File arquivo = File(nomeArquivo);
    IOSink sink = arquivo.openWrite();

    for (int i = 0; i < tarefas.length; i++) {
      sink.writeln('${i + 1}. ${tarefas[i]}');
    }

    sink.close();
    print('Tarefas salvas em "$nomeArquivo".');
  } catch (e) {
    print('Erro ao salvar arquivo: $e');
  }
}
