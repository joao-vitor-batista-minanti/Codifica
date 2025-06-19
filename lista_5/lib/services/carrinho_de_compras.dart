import 'package:lista_5/models/produto.dart';

class CarrinhoDeCompras {
  final List<Produto> _produtos = [];

  void adicionarProduto(Produto produto) {
    _produtos.add(produto);
  }

  double _calcularTotal() {
    double total = 0.0;
    for(var produto in _produtos) {
      total += produto.preco;
    }
    return total;
  }

  void exibirCarrinho() {
    print("--- Itens no Carrinho ---");
    for(var produto in _produtos) {
      print("- ${produto.nome}: R\$ ${produto.preco.toStringAsFixed(2)}");
    }
    print("-------------------------");
    print("Total do Carrinho: R\$ ${_calcularTotal().toStringAsFixed(2)}");
  }

  Map<String, dynamic> toJson() {
    return {
      'itens': _produtos.map((produto) => produto.toJson()).toList(),
      'total': _calcularTotal(),
    };
  }

}