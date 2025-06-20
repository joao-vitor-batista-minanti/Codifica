import 'package:lista_5/models/produto_alimenticio.dart';
import 'package:lista_5/models/produto_eletronico.dart';
import 'package:lista_5/services/carrinho_de_compras.dart';
import 'package:lista_5/services/gerenciador_estoque.dart';
import 'package:lista_5/utils/json_handler.dart';

void main() async {
  print("\n--- TESTE E-COMMERCE ---");
  // Teste Produto Abstrato
  // var produtoGenerico = Produto(codigo: 'P01', nome: 'Genérico', preco: 10.0);

  final tv = ProdutoEletronico(
    codigo: 'E01',
    nome: 'Smart TV 50"',
    preco: 2800.00,
    garantiaMeses: 12,
  );

  final leite = ProdutoAlimenticio(
    codigo: 'A01',
    nome: 'Caixa de Leite',
    preco: 4.50,
    dataValidade: '25/12/2025',
  );

  print("Tipo do Produto: ${tv.tipo}");
  print("Tipo do Produto: ${leite.tipo}");

  print("\n=== TESTE MIXIN ===\n");
  print(tv.gerarEtiquetaEnvio());

  print("\n=== TESTE MAP ===\n");
  final estoque = GerenciadorEstoque();
  estoque.atualizaEstoque('E01', 10);
  estoque.atualizaEstoque('A01', 50);
  estoque.exibirInventario();

  estoque.atualizaEstoque('A01', -30);
  estoque.exibirInventario();

  print("\nTem TV no estoque? ");
  print(estoque.temEstoque('E01'));

  print("\n=== TESTE JSON ====\n");
  CarrinhoDeCompras  carrinho = CarrinhoDeCompras();
  carrinho.adicionarProduto(tv);
  carrinho.adicionarProduto(leite);
  carrinho.exibirCarrinho();
  print('');

  await salvarCarrinhoEmJson(carrinho, 'carrinho.json');

  CarrinhoDeCompras outroCarrinho = CarrinhoDeCompras();
  outroCarrinho.exibirCarrinho();
  print('');

  outroCarrinho = await carregarCarrinhoDeJson('carrinho.json');
  outroCarrinho.exibirCarrinho();
  print('');

  print("\n--- FIM DOS TESTES ---\n");
}