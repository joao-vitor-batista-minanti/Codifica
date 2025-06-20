import "package:lista_4/produto.dart";

void main() {
  Produto produto = Produto(codigo: "777", nome: "Teclado Mecânico", preco: 350);

  produto.preco = -50;
  print("Preço atual: R\$ ${produto.preco.toStringAsFixed(2)}");

  produto.preco = 400.0;
  print("Preço atualizado: R\$ ${produto.preco.toStringAsFixed(2)}");
}