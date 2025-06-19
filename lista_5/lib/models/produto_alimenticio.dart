import 'package:lista_5/models/produto.dart';

class ProdutoAlimenticio extends Produto{
  final String dataValidade;

  ProdutoAlimenticio({
    required super.codigo,
    required super.nome, 
    required super.preco, 
    required this.dataValidade,
    });

  @override
  String get tipo => "Alimentício";

  @override
  void exibirDetalhes() {
    print("--- Detalhes do Produto ---");  
    print("Codigo: $codigo");
    print("Nome: $nome");
    print("Preço: R\$ ${preco.toStringAsFixed(2)}");
    print("Data de Validade: $dataValidade");
    print('');
  }

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();
    map['dataValidade'] = dataValidade;
    return map;
  }

  factory ProdutoAlimenticio.fromJson(Map<String, dynamic> json) {
    return ProdutoAlimenticio(
      codigo: json['codigo'],
      nome: json['nome'],
      preco: json['preco'],
      dataValidade: json['dataValidade'],
    ); 
  }
}