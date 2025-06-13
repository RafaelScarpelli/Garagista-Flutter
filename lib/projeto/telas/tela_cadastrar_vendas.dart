import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_ddm/projeto/entidades/lista_cliente.dart';
import 'package:projeto_ddm/projeto/entidades/lista_veiculo.dart';
import 'package:projeto_ddm/projeto/entidades/lista_venda.dart';
import 'package:projeto_ddm/projeto/entidades/venda.dart';

class CadastrarVendaPage extends StatefulWidget {
  @override
  _CadastrarVendaPageState createState() => _CadastrarVendaPageState();
}

class _CadastrarVendaPageState extends State<CadastrarVendaPage> {
  final _formKey = GlobalKey<FormState>();
  final _valorController = TextEditingController();
  int? _clienteId;
  int? _veiculoId;
  DateTime _dataVenda = DateTime.now();
  final ListaVenda _listaVenda = ListaVenda();
  final ListaCliente _listaCliente = ListaCliente();
  final ListaVeiculo _listaVeiculo = ListaVeiculo();

  @override
  void dispose() {
    _valorController.dispose();
    super.dispose();
  }

  void _cadastrarVenda() {
    if (_formKey.currentState!.validate()) {
      final venda = Venda(
        clienteId: _clienteId!,
        veiculoId: _veiculoId!,
        dataVenda: _dataVenda,
        valor: double.parse(_valorController.text),
      );
      _listaVenda.adicionarVenda(venda);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Venda cadastrada com sucesso!'),
          backgroundColor: Colors.green[600],
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dataVendaFormatada = DateFormat('dd/MM/yyyy').format(_dataVenda);

    return Scaffold(
      appBar: AppBar(title: Text('Cadastrar Venda')),
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
              TextFormField(
                controller: _valorController,
                decoration: InputDecoration(
                  labelText: 'Valor (R\$)',
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
              InkWell(
                onTap: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: _dataVenda,
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                  if (selectedDate != null) {
                    setState(() => _dataVenda = selectedDate);
                  }
                },
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Data da Venda',
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
                    dataVendaFormatada,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _cadastrarVenda,
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
