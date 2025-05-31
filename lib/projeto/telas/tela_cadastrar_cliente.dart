import 'package:flutter/material.dart';
import 'package:projeto_ddm/projeto/entidades/cliente.dart';
import 'package:projeto_ddm/projeto/entidades/lista_cliente.dart';

class CadastrarClientePage extends StatefulWidget {
  @override
  _CadastrarClientePageState createState() => _CadastrarClientePageState();
}

class _CadastrarClientePageState extends State<CadastrarClientePage> {
  final _formKey = GlobalKey<FormState>();
  String _nome = '';
  String _cpf = '';
  String _telefone = '';
  final ListaCliente _listaCliente = ListaCliente();

  void _salvarCliente() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final cliente = Cliente(
        nome: _nome,
        cpf: _cpf,
        telefone: _telefone,
      );
      _listaCliente.adicionarCliente(cliente);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Cliente cadastrado: $_nome'),
          backgroundColor: Colors.green[600],
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastrar Cliente')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      prefixIcon: Icon(Icons.person, color: Colors.green[600]),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Campo obrigatório' : null,
                    onSaved: (value) => _nome = value!,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'CPF',
                      prefixIcon: Icon(Icons.badge, color: Colors.green[600]),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Campo obrigatório' : null,
                    onSaved: (value) => _cpf = value!,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Telefone',
                      prefixIcon: Icon(Icons.phone, color: Colors.green[600]),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Campo obrigatório' : null,
                    onSaved: (value) => _telefone = value!,
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _salvarCliente,
                    child: Text('Salvar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
