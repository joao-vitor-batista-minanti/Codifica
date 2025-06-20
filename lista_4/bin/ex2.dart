import "package:lista_4/produto.dart";

void main() {
  Produto produto = Produto(codigo: "12345", nome: "Smartphone Modelo X", preco: 1999.90);

  print("--- Detalhes Originais ---");
  produto.exibirDetalhes();

  double desconto = 15;
  produto.aplicarDesconto(15);
  print("--- Detalhes com Desconto ---");
  print("Preço com $desconto% de desconto aplicado.");
  produto.exibirDetalhes();
  print("Total de produtos criados: ${Produto.qntdProdutos}");
}