import 'package:lista4/produto.dart';
import 'package:lista4/produto_alimenticio.dart';
import 'package:lista4/produto_eletronico.dart';

void main() {
  Produto p1 = ProdutoEletronico(
    codigo: 'E01',
    nome: 'Smart TV 50"', 
    preco: 2800.0, 
    garantiaMeses: 12);

  p1.exibirDetalhes();

  var p2 = ProdutoAlimenticio(
    codigo: 'A01', 
    nome: 'Caixa de Leite', 
    preco: 4.5, 
    dataValidade: '25/12/2025');

  p2.exibirDetalhes();
}