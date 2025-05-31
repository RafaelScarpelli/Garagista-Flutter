import 'venda.dart';

class ListaVenda {
  static final ListaVenda _instance = ListaVenda._internal();
  final List<Venda> _vendas = [];

  factory ListaVenda() {
    return _instance;
  }

  ListaVenda._internal();

  List<Venda> getVendas() {
    return _vendas;
  }

  void adicionarVenda(Venda venda) {
    _vendas.add(venda);
  }
}