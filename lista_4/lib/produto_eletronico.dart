import 'package:lista_4/produto.dart';

class ProdutoEletronico extends Produto{
  final int _garantiaMeses;

  ProdutoEletronico({
    required super.codigo, 
    required super.nome, 
    required super.preco, 
    required int garantiaMeses})
  : _garantiaMeses = garantiaMeses;

  @override
  void exibirDetalhes() {
    print("--- Detalhes do Produto ---");  
    print("Codigo: $codigo");
    print("Nome: $nome");
    print("Preço: R\$ ${preco.toStringAsFixed(2)}");
    print("Garantia: $_garantiaMeses meses");
    print('');
  }
}