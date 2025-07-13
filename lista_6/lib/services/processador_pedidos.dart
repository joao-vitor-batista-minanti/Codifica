import 'dart:async';
import '../models/pedido.dart';
import '../services/status_pedido.dart';

class PagamentoException implements Exception {
  final String mensagem;
  PagamentoException(this.mensagem);

  @override
  String toString() => 'PagamentoException: $mensagem';
}

class ProcessadorPedidos{

  Future<void> processarComCallBack({
    required Pedido pedido,
    required Function((bool sucesso, String mensagem)) onComplete,
  }) async {
    print("Iniciando processamento do pedido...");
    await Future.delayed(Duration(seconds: 3));

    try {
      if(pedido.valorTotal <= 0) {
        pedido.status = StatusPedido.FALHOU;
        throw PagamentoException("Pagamento não Pode ser Processado");
      }

      pedido.status = StatusPedido.PROCESSANDO;
      onComplete((true, "Pedido Processando e Pronto para Envio!"));
    } catch(e) {
      rethrow;
    }
  }

  // Future<String> processar(Pedido pedido) async {
  //   print("Processando pagamento do pedido...");
  //   await Future.delayed(Duration(seconds: 3));
  //   pedido.status = StatusPedido.PROCESSANDO;
  //   return "Pedido Processado com Sucesso!";
  // }

}