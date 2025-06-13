class Veiculo {
  int? id;
  String marca;
  String modelo;
  int ano;
  String cor;
  String placa;
  double quilometragem;
  String tipo;
  double valorVenda;
  double valorAluguelDia;
  String status;
  DateTime dataCadastro;

  Veiculo({
    this.id,
    required this.marca,
    required this.modelo,
    required this.ano,
    required this.cor,
    required this.placa,
    required this.quilometragem,
    required this.tipo,
    required this.valorVenda,
    required this.valorAluguelDia,
    required this.status,
    required this.dataCadastro,
  });
}
