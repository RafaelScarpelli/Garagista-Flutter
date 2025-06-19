import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_ddm/projeto/dto/cliente.dart';
import 'package:projeto_ddm/projeto/dto/lista_cliente.dart';
import '../rotas.dart';

class ClientesPage extends StatelessWidget {
  final ListaCliente _listaCliente = ListaCliente();

  @override
  Widget build(BuildContext context) {
    final clientes = _listaCliente.getClientes();

    return Scaffold(
      appBar: AppBar(title: Text('Clientes')),
      backgroundColor: Colors.grey[900],
      body: clientes.isEmpty
          ? Center(
              child: Text(
                'Nenhum cliente registrado',
                style: TextStyle(color: Colors.grey[300], fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: clientes.length,
              itemBuilder: (context, index) {
                final cliente = clientes[index];
                final dataCadastro = cliente.dataCadastro != null
                    ? DateFormat('dd/MM/yyyy').format(cliente.dataCadastro)
                    : 'Não informado';

                return Card(
                  color: Colors.grey[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.orange[600]!, width: 1.5),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16.0),
                    title: Text(
                      cliente.nome,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        Text('CPF: ${cliente.cpf}',
                            style: TextStyle(color: Colors.grey[300])),
                        Text('Telefone: ${cliente.telefone}',
                            style: TextStyle(color: Colors.grey[300])),
                        Text('Email: ${cliente.email}',
                            style: TextStyle(color: Colors.grey[300])),
                        Text('Endereço: ${cliente.endereco}',
                            style: TextStyle(color: Colors.grey[300])),
                        Text('Cadastrado em: $dataCadastro',
                            style: TextStyle(color: Colors.grey[300])),
                      ],
                    ),
                    leading:
                        Icon(Icons.person, color: Colors.green[600], size: 40),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/cadastrar_cliente'),
        backgroundColor: Colors.green[600],
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
    );
  }
}
