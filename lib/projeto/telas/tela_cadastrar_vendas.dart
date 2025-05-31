import 'package:flutter/material.dart';
import 'package:projeto_ddm/projeto/entidades/lista_venda.dart';
import 'package:projeto_ddm/projeto/entidades/venda.dart';

class CadastrarVendaPage extends StatefulWidget {
  @override
  _CadastrarVendaPageState createState() => _CadastrarVendaPageState();
}

class _CadastrarVendaPageState extends State<CadastrarVendaPage> {
  final _formKey = GlobalKey<FormState>();
  String _veiculoModelo = '';
  String _veiculoPlaca = '';
  String _clienteNome = '';
  String _valor = '';
  String _data = '';
  final ListaVenda _listaVenda = ListaVenda();

  void _salvarVenda() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final venda = Venda(
        veiculoModelo: _veiculoModelo,
        veiculoPlaca: _veiculoPlaca,
        clienteNome: _clienteNome,
        valor: double.parse(_valor),
        data: _data,
      );
      _listaVenda.adicionarVenda(venda);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Venda cadastrada: $_veiculoModelo'),
          backgroundColor: Colors.green[600],
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastrar Venda')),
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
                      labelText: 'Modelo do Veículo',
                      prefixIcon:
                          Icon(Icons.directions_car, color: Colors.green[600]),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Campo obrigatório' : null,
                    onSaved: (value) => _veiculoModelo = value!,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Placa do Veículo',
                      prefixIcon: Icon(Icons.confirmation_number,
                          color: Colors.green[600]),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Campo obrigatório' : null,
                    onSaved: (value) => _veiculoPlaca = value!,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nome do Cliente',
                      prefixIcon: Icon(Icons.person, color: Colors.green[600]),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Campo obrigatório' : null,
                    onSaved: (value) => _clienteNome = value!,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Valor (R)',
                      prefixIcon:
                          Icon(Icons.attach_money, color: Colors.green[600]),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) return 'Campo obrigatório';
                      if (double.tryParse(value) == null)
                        return 'Valor inválido';
                      return null;
                    },
                    onSaved: (value) => _valor = value!,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Data (DD/MM/AAAA)',
                      prefixIcon:
                          Icon(Icons.calendar_today, color: Colors.green[600]),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Campo obrigatório' : null,
                    onSaved: (value) => _data = value!,
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _salvarVenda,
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
