import 'dart:convert';
import 'dart:io';

import 'package:lista_5/models/produto.dart';
import 'package:lista_5/models/produto_alimenticio.dart';
import 'package:lista_5/models/produto_eletronico.dart';
import 'package:lista_5/services/carrinho_de_compras.dart';

/* 
  Função Future diz para o compilador que será gerado um valor no Futuro, usa-se em Dart porque
  o funcionamento de 'subrotinas' é diferente visando melhora de desempenho. Ex:
    lerArquivoGrande(); // se o compilador esperasse o retorno aqui, a interface congelaria!
  dessa forma, o compilador não funciona como um jal/jr(pilha de funções) e consegue trabalhar
  com o restante do código sem congelar o programa enquanto um processamento demorado está sendo
  executado.

  Da mesma forma, quando usamos 'await' (dizemos para o compilador esperar uma função demorada) dentro de uma função,
  temos que especificar que a função terá um funcionamento assincrono com 'async' (conceito visto em Sistemas Digitais)

  Em resumo:
  'async' = Essa função realiza operações que demoram
  'await' = Espera um pouquinho até essa tarefa terminar
*/

Future<void> salvarCarrinhoEmJson(CarrinhoDeCompras carrinho, String nomeArquivo) async{
  try {
    final arquivo = File(nomeArquivo);

    /*
      '.withIndent()' serve somente para deixar bonito
      '.convert()' transforma o Map gerado por 'carrinho.toJson()' em uma String JSON formatada
    */
    final jsonString = JsonEncoder.withIndent('  ').convert(carrinho.toJson());

    // Exemplo de processo demorado assincrono (salvar no disco pode demorar)
    await arquivo.writeAsString(jsonString);

    print("Carrinho salvo com Sucesso em $nomeArquivo");
  }catch(e) {
    print("ERRO AO SALVAR ARQUIVO JSON: $e");
  }
}

Future<CarrinhoDeCompras> carregarCarrinhoDeJson(String nomeArquivo) async {
  final carrinho = CarrinhoDeCompras();

  try {
    final arquivo = File(nomeArquivo);
    if(!await arquivo.exists()) {
      print("ARQUIVO $nomeArquivo NAO ENCONTRADO. INICIANDO COM CARRINHO VAZIO");
      return carrinho;
    }

    final jsonString = await arquivo.readAsString();

    // 'jsonDecode()' transforma uma String JSON para Map (key, value)
    // Aliás, Map (plmns em Dart, não sei em relação a outras linguagens), tem forte correlação com arquivos JSON
    final jsonMap = jsonDecode(jsonString);

    final List<dynamic> itensJson = jsonMap['itens'];

    for(var itemJson in itensJson) {
      Produto? produto;

      // Espécie de cast em JSON
      if(itemJson['tipo'] == 'Eletrônico') {
        produto = ProdutoEletronico.fromJson(itemJson);
      } else if (itemJson['tipo'] == 'Alimentício') {
        produto = ProdutoAlimenticio.fromJson(itemJson);
      }

      if(produto != null) {
        carrinho.adicionarProduto(produto);
      }
    }
    print("ARQUIVO CARREGADO COM SUCESSO DE $nomeArquivo");
  }catch(e) {
    print("ERRO AO CARREGAR ARQUIVO JSON: $e");
  }
  return carrinho;
}


/* Exemplo de transformação genérica (mais escalável para vários tipos de produtos):

Produto fromJsonGenerico(Map<String, dynamic> json) {
  switch (json['tipo']) {
    case 'Eletrônico':
      return ProdutoEletronico.fromJson(json);
    case 'Alimentício':
      return ProdutoAlimenticio.fromJson(json);
    default:
      throw Exception("Tipo de produto desconhecido");
  }
}
*/