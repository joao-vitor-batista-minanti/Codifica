class Produto {
  final String _codigo;
  final String _nome;
  double _preco;
  static int _qntdProdutos = 0;

  Produto({required String codigo, required String nome, required double preco})
    : _codigo = codigo,
      _nome = nome,
      _preco = preco 
      {_qntdProdutos++;}

  String get codigo => _codigo;
  String get nome => _nome;
  double get preco => _preco;
  static int get qntdProdutos => _qntdProdutos;

  void exibirDetalhes() {
    print("Codigo: $_codigo");
    print("Nome: $_nome");
    print("Preço: ${preco.toStringAsFixed(2)}");
    print('');
  }

  void aplicarDesconto(double percentual) {
    if (percentual > 0 && percentual <= 100) {
      _preco = _preco * (1 - (percentual/100));
    } else {
      print("Percentual de desconto inválido");
    }
  }

}
