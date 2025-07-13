import 'package:lista_6/models/produto.dart';

class CarrinhoDeCompras {
  final List<Produto> produtos = [];

  void adicionarProduto(Produto produto) {
    produtos.add(produto);
  }

  double calcularTotal() {
    double total = 0.0;
    for(var produto in produtos) {
      total += produto.preco;
    }
    return total;
  }

  void exibirCarrinho() {
    print("--- Itens no Carrinho ---");
    for(var produto in produtos) {
      print("- ${produto.nome}: R\$ ${produto.preco.toStringAsFixed(2)}");
    }
    print("-------------------------");
    print("Total do Carrinho: R\$ ${calcularTotal().toStringAsFixed(2)}");
  }

  Map<String, dynamic> toJson() {
    return {
      'itens': produtos.map((produto) => produto.toJson()).toList(),
      'total': calcularTotal(),
    };
  }

}