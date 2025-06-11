import "package:lista4/produto.dart";

void main() {
  Produto p1 = Produto(codigo: "12345", nome: "Smartphone Modelo X", preco: 1999.90);
  Produto p2 = Produto(codigo: "67890", nome: "Fone de Ouvido Bluetooth", preco: 299.50);

  print("--- Produto 1 ---");
  p1.printProduto();
  print("--- Produto 2 ---");
  p2.printProduto();
}