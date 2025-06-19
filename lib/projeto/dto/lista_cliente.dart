import 'cliente.dart';

class ListaCliente {
  static final List<Cliente> _clientes = [
    Cliente(
      id: 1,
      nome: 'João Silva',
      cpf: '123.456.789-00',
      telefone: '(11) 98765-4321',
      email: 'joao.silva@email.com',
      endereco: 'Rua A, 123, São Paulo, SP',
      dataCadastro: DateTime(2025, 1, 10),
    ),
    Cliente(
      id: 2,
      nome: 'Maria Oliveira',
      cpf: '987.654.321-00',
      telefone: '(21) 91234-5678',
      email: 'maria.oliveira@email.com',
      endereco: 'Av. B, 456, Rio de Janeiro, RJ',
      dataCadastro: DateTime(2025, 2, 15),
    ),
  ];

  List<Cliente> getClientes() => _clientes;

  void adicionarCliente(Cliente cliente) {
    cliente.id = (_clientes.isEmpty ? 0 : _clientes.last.id!) + 1;
    _clientes.add(cliente);
  }

  void removerCliente(int id) {
    _clientes.removeWhere((cliente) => cliente.id == id);
  }
}
