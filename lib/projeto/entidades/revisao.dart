class Revisao {
  int? id;
  int clienteId;
  int veiculoId;
  String descricao;
  DateTime dataSolicitacao;
  String status;
  String observacoes;

  Revisao({
    this.id,
    required this.clienteId,
    required this.veiculoId,
    required this.descricao,
    required this.dataSolicitacao,
    required this.status,
    required this.observacoes,
  });
}
