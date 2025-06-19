import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_ddm/projeto/dto/aluguel.dart';
import 'package:projeto_ddm/projeto/dto/lista_aluguel.dart';
import 'package:projeto_ddm/projeto/dto/lista_cliente.dart';
import 'package:projeto_ddm/projeto/dto/lista_veiculo.dart';

class AgendarAluguelPage extends StatefulWidget {
  @override
  _AgendarAluguelPageState createState() => _AgendarAluguelPageState();
}

class _AgendarAluguelPageState extends State<AgendarAluguelPage> {
  final _formKey = GlobalKey<FormState>();
  final _valorDiariaController = TextEditingController();
  final _valorTotalController = TextEditingController();
  int? _clienteId;
  int? _veiculoId;
  DateTime _dataInicio = DateTime.now();
  DateTime _dataFim = DateTime.now().add(Duration(days: 1));
  String _status = 'Ativo';
  final ListaAluguel _listaAluguel = ListaAluguel();
  final ListaCliente _listaCliente = ListaCliente();
  final ListaVeiculo _listaVeiculo = ListaVeiculo();

  @override
  void dispose() {
    _valorDiariaController.dispose();
    _valorTotalController.dispose();
    super.dispose();
  }

  void _agendarAluguel() {
    if (_formKey.currentState!.validate()) {
      final aluguel = Aluguel(
        clienteId: _clienteId!,
        veiculoId: _veiculoId!,
        dataInicio: _dataInicio,
        dataFim: _dataFim,
        valorDiaria: double.parse(_valorDiariaController.text),
        valorTotal: double.parse(_valorTotalController.text),
        status: _status,
      );
      _listaAluguel.adicionarAluguel(aluguel);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Aluguel agendado com sucesso!'),
          backgroundColor: Colors.green[600],
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dataInicioFormatada = DateFormat('dd/MM/yyyy').format(_dataInicio);
    final dataFimFormatada = DateFormat('dd/MM/yyyy').format(_dataFim);

    return Scaffold(
      appBar: AppBar(title: Text('Agendar Aluguel')),
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField<int>(
                value: _clienteId,
                decoration: InputDecoration(
                  labelText: 'Cliente',
                  labelStyle: TextStyle(color: Colors.grey[300]),
                  prefixIcon: Icon(Icons.person, color: Colors.green[600]),
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
                items: _listaCliente.getClientes().map((cliente) {
                  return DropdownMenuItem<int>(
                    value: cliente.id,
                    child: Text(cliente.nome),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _clienteId = value),
                validator: (value) =>
                    value == null ? 'Selecione um cliente' : null,
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<int>(
                value: _veiculoId,
                decoration: InputDecoration(
                  labelText: 'Veículo',
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
                items: _listaVeiculo.getVeiculos().map((veiculo) {
                  return DropdownMenuItem<int>(
                    value: veiculo.id,
                    child: Text(
                        '${veiculo.marca} ${veiculo.modelo} (${veiculo.placa})'),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _veiculoId = value),
                validator: (value) =>
                    value == null ? 'Selecione um veículo' : null,
              ),
              SizedBox(height: 16),
              InkWell(
                onTap: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: _dataInicio,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (selectedDate != null) {
                    setState(() => _dataInicio = selectedDate);
                  }
                },
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Data de Início',
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
                  ),
                  child: Text(
                    dataInicioFormatada,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 16),
              InkWell(
                onTap: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: _dataFim,
                    firstDate: _dataInicio,
                    lastDate: DateTime(2100),
                  );
                  if (selectedDate != null) {
                    setState(() => _dataFim = selectedDate);
                  }
                },
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Data de Fim',
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
                  ),
                  child: Text(
                    dataFimFormatada,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _valorDiariaController,
                decoration: InputDecoration(
                  labelText: 'Valor Diária (R\$)',
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
                controller: _valorTotalController,
                decoration: InputDecoration(
                  labelText: 'Valor Total (R\$)',
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
              DropdownButtonFormField<String>(
                value: _status,
                decoration: InputDecoration(
                  labelText: 'Status',
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
                items: ['Ativo', 'Finalizado', 'Cancelado'].map((status) {
                  return DropdownMenuItem<String>(
                    value: status,
                    child: Text(status),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _status = value!),
                validator: (value) =>
                    value == null ? 'Selecione um status' : null,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _agendarAluguel,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[600],
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: Text('Agendar', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
