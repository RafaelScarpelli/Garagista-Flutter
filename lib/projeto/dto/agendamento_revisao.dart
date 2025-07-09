class AgendamentoRevisao {
  int? id;
  int carroId;
  DateTime data;
  String descricao;
  int revisaoId;

  AgendamentoRevisao({
    this.id,
    required this.carroId,
    required this.data,
    required this.descricao,
    required this.revisaoId,
  });
}
