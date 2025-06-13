class Cliente {
  int? id;
  String nome;
  String cpf;
  String telefone;
  String email;
  String endereco;
  DateTime dataCadastro;

  Cliente({
    this.id,
    required this.nome,
    required this.cpf,
    required this.telefone,
    required this.email,
    required this.endereco,
    required this.dataCadastro,
  });
}
