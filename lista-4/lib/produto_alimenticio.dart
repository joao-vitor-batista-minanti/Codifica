import 'package:lista4/produto.dart';

class ProdutoAlimenticio extends Produto{
  final String _dataValidade;

  ProdutoAlimenticio({
    required super.codigo,
    required super.nome, 
    required super.preco, 
    required String dataValidade})
  : _dataValidade = dataValidade;

  @override
  void exibirDetalhes() {
    print("--- Detalhes do Produto ---");  
    print("Codigo: $codigo");
    print("Nome: $nome");
    print("Preço: R\$ ${preco.toStringAsFixed(2)}");
    print("Data de Validade: $_dataValidade");
    print('');
  }

}