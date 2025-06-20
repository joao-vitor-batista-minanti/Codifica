import "package:lista_4/produto.dart";
import "package:lista_4/carrinho_de_compras.dart";

void main() {
  Produto p1 = Produto(codigo: "111", nome: "Mouse Gamer", preco: 150.0);
  Produto p2 = Produto(codigo: "222", nome: 'Montior 24"', preco: 950.0);
  Produto p3 = Produto(codigo: "333", nome: 'Cadeira Gamer', preco: 1200.0);

  var carrinho = CarrinhoDeCompras();
  carrinho.adicionarProduto(p1);
  carrinho.adicionarProduto(p2);
  carrinho.adicionarProduto(p3);

  carrinho.exibirCarrinho();

}