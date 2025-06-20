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

  // Manti 'set preco' por conveção, invés de 'set novoPreco' (o método set já é usado convecionalmente para atualização de valores)
  set preco(double preco) {
    if(preco > 0) {
      _preco = preco;
    } else {
      print("Erro: O preço não pode ser negativo. O valor R\$ ${_preco.toStringAsFixed(2)} foi mantido.");
    }
  }

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
