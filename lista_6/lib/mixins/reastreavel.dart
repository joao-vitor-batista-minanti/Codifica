import 'package:lista_6/models/produto.dart';

mixin Rastreavel on Produto{
  String gerarEtiquetaEnvio() {
    String etiqueta = """
=========================
ETIQUETA DE ENVIO
Código: $codigo
Produto: $nome
=========================
""";
    return etiqueta;
  }
}