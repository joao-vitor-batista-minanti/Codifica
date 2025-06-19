import 'package:lista_5/models/produto.dart';
import 'package:lista_5/mixins/reastreavel.dart';

class ProdutoEletronico extends Produto with Rastreavel{
  final int garantiaMeses;

  ProdutoEletronico({
    required super.codigo, 
    required super.nome, 
    required super.preco, 
    required this.garantiaMeses
    });

  @override
  String get tipo => "Eletrônico";

  @override
  void exibirDetalhes() {
    print("--- Detalhes do Produto ---");  
    print("Codigo: $codigo");
    print("Nome: $nome");
    print("Preço: R\$ ${preco.toStringAsFixed(2)}");
    print("Garantia: $garantiaMeses meses");
    print('');
  }

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();
    map['garantiaMeses'] = garantiaMeses;
    return map;
  }

  factory ProdutoEletronico.fromJson(Map<String, dynamic> json) {
    return ProdutoEletronico(
      codigo: json['codigo'],
      nome: json['nome'],
      preco: json['preco'],
      garantiaMeses: json['garantiaMeses'],
    );
  }
}