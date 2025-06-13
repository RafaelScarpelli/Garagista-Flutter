import 'veiculo.dart';

class ListaVeiculo {
  static final List<Veiculo> _veiculos = [
    Veiculo(
      id: 1,
      marca: 'Toyota',
      modelo: 'Corolla',
      ano: 2020,
      cor: 'Prata',
      quilometragem: 45000.0,
      tipo: 'Ambos',
      valorVenda: 85000.0,
      valorAluguelDia: 200.0,
      status: 'Disponível',
      dataCadastro: DateTime(2025, 1, 5),
      placa: 'ABC-1234',
    ),
    Veiculo(
      id: 2,
      marca: 'Honda',
      modelo: 'Civic',
      ano: 2019,
      cor: 'Preto',
      quilometragem: 60000.0,
      tipo: 'Aluguel',
      valorVenda: 0.0,
      valorAluguelDia: 180.0,
      status: 'Alugado',
      dataCadastro: DateTime(2025, 3, 1),
      placa: 'XYZ-5678',
    ),
  ];

  List<Veiculo> getVeiculos() => _veiculos;

  void adicionarVeiculo(Veiculo veiculo) {
    veiculo.id = (_veiculos.isEmpty ? 0 : _veiculos.last.id!) + 1;
    _veiculos.add(veiculo);
  }

  void removerVeiculo(int id) {
    _veiculos.removeWhere((veiculo) => veiculo.id == id);
  }
}
