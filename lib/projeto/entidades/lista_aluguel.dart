import 'aluguel.dart';

class ListaAluguel {
  static final ListaAluguel _instance = ListaAluguel._internal();
  final List<Aluguel> _alugueis = [];

  factory ListaAluguel() {
    return _instance;
  }

  ListaAluguel._internal();

  List<Aluguel> getAlugueis() {
    return _alugueis;
  }

  void adicionarAluguel(Aluguel aluguel) {
    _alugueis.add(aluguel);
  }
}