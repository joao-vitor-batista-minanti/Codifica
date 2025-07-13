import 'package:lista_6/models/produto.dart';
import 'package:lista_6/models/produto_alimenticio.dart';
import 'package:lista_6/models/produto_eletronico.dart';
import 'package:lista_6/services/carrinho_de_compras.dart';
import 'package:lista_6/services/gerenciador_estoque.dart';
import 'package:lista_6/utils/json_handler.dart';
import 'package:lista_6/models/pedido.dart';
import 'package:lista_6/services/processador_pedidos.dart';

Future<void> main() async {

  final carrinho = CarrinhoDeCompras();

  carrinho.adicionarProduto(
    ProdutoEletronico(
      codigo: 'E01',
      nome: 'Smart TV 50"',
      preco: 2800.0,
      garantiaMeses: 12,
    ),
  );

  carrinho.adicionarProduto(
    ProdutoAlimenticio(
      codigo: 'A01',
      nome: 'Caixa de Leite',
      preco: 4.50,
      dataValidade: '25/12/2025'),
  );

  final meuPedido = Pedido(produtos: carrinho.produtos);
  print('Status Inicial do Pedido: ${meuPedido.status.name}');
  print('----------------------------------\n');

  final processador = ProcessadorPedidos();
  final pedidoComErro = Pedido(produtos: []);

  try {
    print('Enviando Pedido com Erro para Processamento.');
    await processador.processarComCallBack(
      pedido: pedidoComErro,
      onComplete: (resultado) {
        print('Callback Recebido! Sucesso ${resultado.$1}, Mensagem: ${resultado.$2}');
      },
    );
  } on PagamentoException catch(e) {
    print('Ocorreu um Erro de Pagamento:  ${e.mensagem}');
    print('Status do Pedido com Erro: ${pedidoComErro.status.name}');
  } catch(e) {
    print('Ocorre um Erro Inesperado: $e');
  }
  print('----------------------------------\n');

  try {
    print('Enviando pedido válido para processamento...');
    await processador.processarComCallBack(
      pedido: meuPedido,
      onComplete: (resultado) {
        print('Callback recebido! Sucesso: ${resultado.$1}, Mensagem: "${resultado.$2}"');
      },
    );
    print('Status final do pedido: ${meuPedido.status.name}');
  } on PagamentoException catch (e) {
    print('Ocorreu um erro de pagamento: ${e.mensagem}');
  }

  print('\n----------------------------------');
  print('Para rodar os testes, execute no terminal: dart test');
}