class Produto {
  final String _codigo;
  final String _nome;
  final double _preco;

  Produto({required String codigo, required String nome, required double preco})
    : _codigo = codigo,
      _nome = nome,
      _preco = preco;

  String get codigo => _codigo;
  String get nome => _nome;
  double get preco => _preco;

  void printProduto() {
    print("Codigo: $_codigo");
    print("Nome: $_nome");
    print("Preço: $preco");
    print('');
  }

}
