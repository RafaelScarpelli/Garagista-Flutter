import 'package:flutter/material.dart';
import 'package:projeto_ddm/projeto/entidades/aluguel.dart';
import 'package:projeto_ddm/projeto/entidades/lista_aluguel.dart';

class AgendarAluguelPage extends StatefulWidget {
  @override
  _AgendarAluguelPageState createState() => _AgendarAluguelPageState();
}

class _AgendarAluguelPageState extends State<AgendarAluguelPage> {
  final _formKey = GlobalKey<FormState>();
  String _veiculoModelo = '';
  String _veiculoPlaca = '';
  String _clienteNome = '';
  String _dataInicio = '';
  String _dataFim = '';
  String _valorDiario = '';
  final ListaAluguel _listaAluguel = ListaAluguel();

  void _salvarAluguel() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final aluguel = Aluguel(
        veiculoModelo: _veiculoModelo,
        veiculoPlaca: _veiculoPlaca,
        clienteNome: _clienteNome,
        dataInicio: _dataInicio,
        dataFim: _dataFim,
        valorDiario: double.parse(_valorDiario),
      );
      _listaAluguel.adicionarAluguel(aluguel);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Aluguel agendado: $_veiculoModelo'),
          backgroundColor: Colors.green[600],
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agendar Aluguel')),
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
                          Icon(Icons.directions_car, color: Colors.green),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Campo obrigatório' : null,
                    onSaved: (value) => _veiculoModelo = value!,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Placa do Veículo',
                      prefixIcon:
                          Icon(Icons.confirmation_number, color: Colors.green),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Campo obrigatório' : null,
                    onSaved: (value) => _veiculoPlaca = value!,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Data de Início (DD/MM/YYYY)',
                      prefixIcon:
                          Icon(Icons.calendar_today, color: Colors.green),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Campo obrigatório' : null,
                    onSaved: (value) => _dataInicio = value!,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Data de Fim (DD/MM/YYYY)',
                      prefixIcon:
                          Icon(Icons.calendar_today, color: Colors.green),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Campo obrigatório' : null,
                    onSaved: (value) => _dataFim = value!,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Valor Diário (R)',
                      prefixIcon: Icon(Icons.attach_money, color: Colors.green),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) return 'Campo obrigatório';
                      if (double.tryParse(value) == null)
                        return 'Valor inválido';
                      return null;
                    },
                    onSaved: (value) => _valorDiario = value!,
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _salvarAluguel,
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
