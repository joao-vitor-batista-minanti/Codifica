import 'package:test/test.dart';
import 'package:lista_6/services/carrinho_de_compras.dart';
import 'package:lista_6/models/produto_alimenticio.dart';
import 'package:lista_6/models/produto_eletronico.dart';

void main() {
  group("Testes do CarrinhoDeCompras", () {

    test('CALCULAR 0.0 COMO TOTAL PARA UM CARRINHO VAZIO', () {
      final carrinho = CarrinhoDeCompras();
      expect(carrinho.calcularTotal(), 0.0);
    });
    
    test('CALCULAR TOTAL CORRESPONDENTE A UM PRODUTO', () {
      final carrinho = CarrinhoDeCompras();
      final produto = ProdutoEletronico(codigo: 'E01', nome: 'Mouse', preco: 89.90, garantiaMeses: 12);
      carrinho.adicionarProduto(produto);
      expect(carrinho.calcularTotal(), 89.90);
    });

    test('CALCULAR TOTAL CORRESPONDENTE A VARIOS PRODUTOS', () {
      final carrinho = CarrinhoDeCompras();
      carrinho.adicionarProduto(ProdutoAlimenticio(codigo: 'A1', nome: 'Pão', preco: 5.50, dataValidade: '...'));
      carrinho.adicionarProduto(ProdutoEletronico(codigo: 'E1', nome: 'Pilha', preco: 10.0, garantiaMeses: 3));
      expect(carrinho.calcularTotal(), 15.50);
    });
  });


    
  
}