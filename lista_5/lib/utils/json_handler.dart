import 'dart:convert';
import 'dart:io';

import 'package:lista_5/models/produto.dart';
import 'package:lista_5/models/produto_alimenticio.dart';
import 'package:lista_5/models/produto_eletronico.dart';
import 'package:lista_5/services/carrinho_de_compras.dart';


Future<void> salvarCarrinhoEmJson(CarrinhoDeCompras carrinho, String nomeArquivo) async{
  try {
    final arquivo = File(nomeArquivo);
    final jsonString = JsonEncoder.withIndent('  ').convert(carrinho.toJson());
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
    final jsonMap = jsonDecode(jsonString);

    final List<dynamic> itensJson = jsonMap['itens'];

    for(var itemJson in itensJson) {
      Produto? produto;

      if(itemJson['tipo'] == 'Eletrônico') {
        produto = ProdutoEletronico.fromJson(itemJson);
      } else if (itemJson['tipo' == 'Alimentício']) {
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