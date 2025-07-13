class GerenciadorEstoque {
  final Map<String, int> _estoque = {};

  void atualizaEstoque(String codigo, int quantidade) {
    _estoque[codigo] = (_estoque[codigo] ?? 0) + quantidade;
  }

  bool temEstoque(String codigo) {
    return (_estoque[codigo] ?? 0) > 0;
  }

  void exibirInventario() {
    print("\n--- Inventário Atual ---");
    if(_estoque.isEmpty) {
      print("O Estoque Está Vazio\n");
      return;
    }
    _estoque.forEach((codigo, quantidade) {
      print("[$codigo]: $quantidade unidades.");
    });
    print("------------------------");
  }
}