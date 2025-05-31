import 'package:flutter/material.dart';
import 'package:projeto_ddm/projeto/entidades/lista_veiculo.dart';
import 'package:projeto_ddm/projeto/entidades/veiculo.dart';

class CadastrarVeiculoPage extends StatefulWidget {
  @override
  _CadastrarVeiculoPageState createState() => _CadastrarVeiculoPageState();
}

class _CadastrarVeiculoPageState extends State<CadastrarVeiculoPage> {
  final _formKey = GlobalKey<FormState>();
  String _modelo = '';
  String _placa = '';
  String _ano = '';
  final ListaVeiculo _listaVeiculo = ListaVeiculo();

  void _salvarVeiculo() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final veiculo = Veiculo(
        modelo: _modelo,
        placa: _placa,
        ano: _ano,
      );
      _listaVeiculo.adicionarVeiculo(veiculo);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Veículo cadastrado: $_modelo'),
          backgroundColor: Colors.green[600],
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastrar Veículo')),
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
                      labelText: 'Modelo',
                      prefixIcon:
                          Icon(Icons.directions_car, color: Colors.green[600]),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Campo obrigatório' : null,
                    onSaved: (value) => _modelo = value!,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Placa',
                      prefixIcon: Icon(Icons.confirmation_number,
                          color: Colors.green[600]),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Campo obrigatório' : null,
                    onSaved: (value) => _placa = value!,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Ano',
                      prefixIcon:
                          Icon(Icons.calendar_today, color: Colors.green[600]),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) =>
                        value!.isEmpty ? 'Campo obrigatório' : null,
                    onSaved: (value) => _ano = value!,
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _salvarVeiculo,
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
