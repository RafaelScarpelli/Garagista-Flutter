import 'package:flutter/material.dart';
import 'package:projeto_ddm/projeto/entidades/lista_veiculo.dart';
import 'package:projeto_ddm/projeto/entidades/veiculo.dart';

class CadastrarVeiculoPage extends StatefulWidget {
  @override
  _CadastrarVeiculoPageState createState() => _CadastrarVeiculoPageState();
}

class _CadastrarVeiculoPageState extends State<CadastrarVeiculoPage> {
  final _formKey = GlobalKey<FormState>();
  final _marcaController = TextEditingController();
  final _modeloController = TextEditingController();
  final _anoController = TextEditingController();
  final _corController = TextEditingController();
  final _quilometragemController = TextEditingController();
  final _tipoController = TextEditingController();
  final _valorVendaController = TextEditingController();
  final _valorAluguelDiaController = TextEditingController();
  final _statusController = TextEditingController();
  final _placaController = TextEditingController();
  final ListaVeiculo _listaVeiculo = ListaVeiculo();

  @override
  void dispose() {
    _marcaController.dispose();
    _modeloController.dispose();
    _anoController.dispose();
    _corController.dispose();
    _quilometragemController.dispose();
    _tipoController.dispose();
    _valorVendaController.dispose();
    _valorAluguelDiaController.dispose();
    _statusController.dispose();
    _placaController.dispose();
    super.dispose();
  }

  void _cadastrarVeiculo() {
    if (_formKey.currentState!.validate()) {
      final veiculo = Veiculo(
        marca: _marcaController.text,
        modelo: _modeloController.text,
        ano: int.parse(_anoController.text),
        cor: _corController.text,
        quilometragem: double.parse(_quilometragemController.text),
        tipo: _tipoController.text,
        valorVenda: double.parse(_valorVendaController.text),
        valorAluguelDia: double.parse(_valorAluguelDiaController.text),
        status: _statusController.text,
        dataCadastro: DateTime.now(),
        placa: _placaController.text,
      );
      _listaVeiculo.adicionarVeiculo(veiculo);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Veículo cadastrado com sucesso!'),
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
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _marcaController,
                decoration: InputDecoration(
                  labelText: 'Marca',
                  labelStyle: TextStyle(color: Colors.grey[300]),
                  prefixIcon:
                      Icon(Icons.directions_car, color: Colors.green[600]),
                  filled: true,
                  fillColor: Colors.grey[700],
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.orange[600]!, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green[600]!, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                validator: (value) =>
                    value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _modeloController,
                decoration: InputDecoration(
                  labelText: 'Modelo',
                  labelStyle: TextStyle(color: Colors.grey[300]),
                  prefixIcon:
                      Icon(Icons.directions_car, color: Colors.green[600]),
                  filled: true,
                  fillColor: Colors.grey[700],
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.orange[600]!, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green[600]!, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                validator: (value) =>
                    value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _anoController,
                decoration: InputDecoration(
                  labelText: 'Ano',
                  labelStyle: TextStyle(color: Colors.grey[300]),
                  prefixIcon:
                      Icon(Icons.calendar_today, color: Colors.green[600]),
                  filled: true,
                  fillColor: Colors.grey[700],
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.orange[600]!, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green[600]!, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) return 'Campo obrigatório';
                  if (int.tryParse(value) == null) return 'Ano inválido';
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _corController,
                decoration: InputDecoration(
                  labelText: 'Cor',
                  labelStyle: TextStyle(color: Colors.grey[300]),
                  prefixIcon: Icon(Icons.color_lens, color: Colors.green[600]),
                  filled: true,
                  fillColor: Colors.grey[700],
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.orange[600]!, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green[600]!, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                validator: (value) =>
                    value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _quilometragemController,
                decoration: InputDecoration(
                  labelText: 'Quilometragem (km)',
                  labelStyle: TextStyle(color: Colors.grey[300]),
                  prefixIcon: Icon(Icons.speed, color: Colors.green[600]),
                  filled: true,
                  fillColor: Colors.grey[700],
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.orange[600]!, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green[600]!, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) return 'Campo obrigatório';
                  if (double.tryParse(value) == null) return 'Valor inválido';
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _tipoController,
                decoration: InputDecoration(
                  labelText: 'Tipo (Venda/Aluguel/Ambos)',
                  labelStyle: TextStyle(color: Colors.grey[300]),
                  prefixIcon: Icon(Icons.category, color: Colors.green[600]),
                  filled: true,
                  fillColor: Colors.grey[700],
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.orange[600]!, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green[600]!, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                validator: (value) {
                  if (value!.isEmpty) return 'Campo obrigatório';
                  if (!['Venda', 'Aluguel', 'Ambos'].contains(value)) {
                    return 'Tipo inválido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _valorVendaController,
                decoration: InputDecoration(
                  labelText: 'Valor de Venda (R\$)',
                  labelStyle: TextStyle(color: Colors.grey[300]),
                  prefixIcon:
                      Icon(Icons.attach_money, color: Colors.green[600]),
                  filled: true,
                  fillColor: Colors.grey[700],
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.orange[600]!, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green[600]!, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) return 'Campo obrigatório';
                  if (double.tryParse(value) == null) return 'Valor inválido';
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _valorAluguelDiaController,
                decoration: InputDecoration(
                  labelText: 'Valor Aluguel/Dia (R\$)',
                  labelStyle: TextStyle(color: Colors.grey[300]),
                  prefixIcon:
                      Icon(Icons.attach_money, color: Colors.green[600]),
                  filled: true,
                  fillColor: Colors.grey[700],
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.orange[600]!, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green[600]!, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) return 'Campo obrigatório';
                  if (double.tryParse(value) == null) return 'Valor inválido';
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _statusController,
                decoration: InputDecoration(
                  labelText: 'Status (Disponível/Vendido/Alugado/Em Revisão)',
                  labelStyle: TextStyle(color: Colors.grey[300]),
                  prefixIcon: Icon(Icons.info, color: Colors.green[600]),
                  filled: true,
                  fillColor: Colors.grey[700],
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.orange[600]!, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green[600]!, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                validator: (value) {
                  if (value!.isEmpty) return 'Campo obrigatório';
                  if (!['Disponível', 'Vendido', 'Alugado', 'Em Revisão']
                      .contains(value)) {
                    return 'Status inválido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _placaController,
                decoration: InputDecoration(
                  labelText: 'Placa',
                  labelStyle: TextStyle(color: Colors.grey[300]),
                  prefixIcon:
                      Icon(Icons.confirmation_number, color: Colors.green[600]),
                  filled: true,
                  fillColor: Colors.grey[700],
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.orange[600]!, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green[600]!, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                validator: (value) =>
                    value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _cadastrarVeiculo,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[600],
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
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
