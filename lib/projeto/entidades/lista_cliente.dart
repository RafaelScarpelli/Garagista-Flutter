import 'cliente.dart';

class ListaCliente {
  static final ListaCliente _instance = ListaCliente._internal();
  final List<Cliente> _clientes = [];

  factory ListaCliente() {
    return _instance;
  }

  ListaCliente._internal();

  List<Cliente> getClientes() {
    return _clientes;
  }

  void adicionarCliente(Cliente cliente) {
    _clientes.add(cliente);
  }
}