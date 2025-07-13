import '../models/produto.dart';
import '../services/status_pedido.dart';

class Pedido {
  final List<Produto> produtos;
  StatusPedido status;

  Pedido({required this.produtos, this.status = StatusPedido.PENDENTE});

  void exibirDetalhes() {
    print("--- Detalhes do Pedido ---");
    for(var produto in produtos) {
      print("- ${produto.nome}: R\$ ${produto.preco.toStringAsFixed(2)}");
    }
    print("Status: ${status.name}");
    print("--------------------------");
  }

  double get valorTotal {
    if(produtos.isEmpty) return 0.0;
    return produtos.map((p) => p.preco).reduce((a, b) => a + b);
  }
}