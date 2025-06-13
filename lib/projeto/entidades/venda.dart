class Venda {
  int? id;
  int clienteId;
  int veiculoId;
  DateTime dataVenda;
  double valor;

  Venda({
    this.id,
    required this.clienteId,
    required this.veiculoId,
    required this.dataVenda,
    required this.valor,
  });
}
