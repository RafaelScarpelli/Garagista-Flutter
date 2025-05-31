class Aluguel {
  final String veiculoModelo;
  final String veiculoPlaca;
  final String clienteNome;
  final String dataInicio;
  final String dataFim;
  final double valorDiario;

  Aluguel({
    required this.veiculoModelo,
    required this.veiculoPlaca,
    required this.clienteNome,
    required this.dataInicio,
    required this.dataFim,
    required this.valorDiario,
  });
}