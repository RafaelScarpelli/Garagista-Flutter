import 'veiculo.dart';

class ListaVeiculo {
  static final ListaVeiculo _instance = ListaVeiculo._internal();
  final List<Veiculo> _veiculos = [
    Veiculo(modelo: 'Fusca 1970', placa: 'ABC-1234', ano: '1970'),
    Veiculo(modelo: 'Civic 2020', placa: 'XYZ-5678', ano: '2020'),
  ];

  factory ListaVeiculo() {
    return _instance;
  }

  ListaVeiculo._internal();

  List<Veiculo> getVeiculos() {
    return _veiculos;
  }

  void adicionarVeiculo(Veiculo veiculo) {
    _veiculos.add(veiculo);
  }
}