import 'aluguel.dart';

class ListaAluguel {
  static final List<Aluguel> _alugueis = [
    Aluguel(
      id: 1,
      clienteId: 2,
      veiculoId: 2,
      dataInicio: DateTime(2025, 5, 1),
      dataFim: DateTime(2025, 5, 5),
      valorDiaria: 180.0,
      valorTotal: 720.0,
      status: 'Ativo',
    ),
  ];

  List<Aluguel> getAlugueis() => _alugueis;

  void adicionarAluguel(Aluguel aluguel) {
    aluguel.id = (_alugueis.isEmpty ? 0 : _alugueis.last.id!) + 1;
    _alugueis.add(aluguel);
  }

  void removerAluguel(int id) {
    _alugueis.removeWhere((aluguel) => aluguel.id == id);
  }
}
