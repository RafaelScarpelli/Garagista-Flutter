import 'package:flutter/material.dart';
import 'package:projeto_ddm/projeto/dto/cliente.dart';
import 'package:projeto_ddm/projeto/dto/lista_cliente.dart';

class CadastrarClientePage extends StatefulWidget {
  @override
  _CadastrarClientePageState createState() => _CadastrarClientePageState();
}

class _CadastrarClientePageState extends State<CadastrarClientePage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _cpfController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _enderecoController = TextEditingController();
  final ListaCliente _listaCliente = ListaCliente();

  @override
  void dispose() {
    _nomeController.dispose();
    _cpfController.dispose();
    _telefoneController.dispose();
    _emailController.dispose();
    _enderecoController.dispose();
    super.dispose();
  }

  void _cadastrarCliente() {
    if (_formKey.currentState!.validate()) {
      final cliente = Cliente(
        nome: _nomeController.text,
        cpf: _cpfController.text,
        telefone: _telefoneController.text,
        email: _emailController.text,
        endereco: _enderecoController.text,
        dataCadastro: DateTime.now(),
      );
      _listaCliente.adicionarCliente(cliente);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Cliente cadastrado com sucesso!'),
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
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  labelStyle: TextStyle(color: Colors.grey[300]),
                  prefixIcon: Icon(Icons.person, color: Colors.green[600]),
                  filled: true,
                  fillColor: Colors.grey[700],
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange[600]!, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green[600]!, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _cpfController,
                decoration: InputDecoration(
                  labelText: 'CPF',
                  labelStyle: TextStyle(color: Colors.grey[300]),
                  prefixIcon: Icon(Icons.badge, color: Colors.green[600]),
                  filled: true,
                  fillColor: Colors.grey[700],
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange[600]!, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green[600]!, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _telefoneController,
                decoration: InputDecoration(
                  labelText: 'Telefone',
                  labelStyle: TextStyle(color: Colors.grey[300]),
                  prefixIcon: Icon(Icons.phone, color: Colors.green[600]),
                  filled: true,
                  fillColor: Colors.grey[700],
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange[600]!, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green[600]!, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.grey[300]),
                  prefixIcon: Icon(Icons.email, color: Colors.green[600]),
                  filled: true,
                  fillColor: Colors.grey[700],
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange[600]!, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green[600]!, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _enderecoController,
                decoration: InputDecoration(
                  labelText: 'Endereço',
                  labelStyle: TextStyle(color: Colors.grey[300]),
                  prefixIcon: Icon(Icons.home, color: Colors.green[600]),
                  filled: true,
                  fillColor: Colors.grey[700],
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange[600]!, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green[600]!, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _cadastrarCliente,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[600],
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text('Cadastrar', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}