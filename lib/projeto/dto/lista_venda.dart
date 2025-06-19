import 'venda.dart';

class ListaVenda {
  static final List<Venda> _vendas = [
    Venda(
      id: 1,
      clienteId: 1,
      veiculoId: 1,
      dataVenda: DateTime(2025, 4, 10),
      valor: 85000.0,
    ),
  ];

  List<Venda> getVendas() => _vendas;

  void adicionarVenda(Venda venda) {
    venda.id = (_vendas.isEmpty ? 0 : _vendas.last.id!) + 1;
    _vendas.add(venda);
  }

  void removerVenda(int id) {
    _vendas.removeWhere((venda) => venda.id == id);
  }
}
