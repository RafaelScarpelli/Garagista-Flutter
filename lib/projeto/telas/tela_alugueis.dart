import 'package:flutter/material.dart';
import '../rotas.dart';

class AlugueisPage extends StatelessWidget {
  // Dados fixos de aluguéis para simulação
  final List<Map<String, String>> _alugueis = [
    {
      'veiculoModelo': 'Chevrolet Onix',
      'veiculoPlaca': 'GHI-3456',
      'clienteNome': 'João Silva',
      'dataInicio': '01/06/2025',
      'dataFim': '05/06/2025',
      'valorDiario': '150',
    },
    {
      'veiculoModelo': 'Hyundai HB20',
      'veiculoPlaca': 'JKL-7890',
      'clienteNome': 'Maria Oliveira',
      'dataInicio': '10/06/2025',
      'dataFim': '12/06/2025',
      'valorDiario': '120',
    },
    {
      'veiculoModelo': 'Volkswagen Gol',
      'veiculoPlaca': 'MNO-1234',
      'clienteNome': 'Pedro Santos',
      'dataInicio': '15/06/2025',
      'dataFim': '20/06/2025',
      'valorDiario': '100',
    },
  ];

  void _mostrarDialogoEdicao(BuildContext context, Map<String, String> aluguel) {
    final _formKey = GlobalKey<FormState>();
    String veiculoModelo = aluguel['veiculoModelo']!;
    String veiculoPlaca = aluguel['veiculoPlaca']!;
    String clienteNome = aluguel['clienteNome']!;
    String dataInicio = aluguel['dataInicio']!;
    String dataFim = aluguel['dataFim']!;
    String valorDiario = aluguel['valorDiario']!;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[800],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text(
          'Editar Aluguel',
          style: TextStyle(color: Colors.white),
        ),
        content: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  initialValue: veiculoModelo,
                  decoration: InputDecoration(
                    labelText: 'Modelo do Veículo',
                    labelStyle: TextStyle(color: Colors.grey[300]),
                    prefixIcon: Icon(Icons.directions_car, color: Colors.green[600]),
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
                  onSaved: (value) => veiculoModelo = value!,
                ),
                SizedBox(height: 16),
                TextFormField(
                  initialValue: veiculoPlaca,
                  decoration: InputDecoration(
                    labelText: 'Placa do Veículo',
                    labelStyle: TextStyle(color: Colors.grey[300]),
                    prefixIcon: Icon(Icons.confirmation_number, color: Colors.green[600]),
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
                  onSaved: (value) => veiculoPlaca = value!,
                ),
                SizedBox(height: 16),
                TextFormField(
                  initialValue: clienteNome,
                  decoration: InputDecoration(
                    labelText: 'Nome do Cliente',
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
                  onSaved: (value) => clienteNome = value!,
                ),
                SizedBox(height: 16),
                TextFormField(
                  initialValue: dataInicio,
                  decoration: InputDecoration(
                    labelText: 'Data de Início (DD/MM/YYYY)',
                    labelStyle: TextStyle(color: Colors.grey[300]),
                    prefixIcon: Icon(Icons.calendar_today, color: Colors.green[600]),
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
                  onSaved: (value) => dataInicio = value!,
                ),
                SizedBox(height: 16),
                TextFormField(
                  initialValue: dataFim,
                  decoration: InputDecoration(
                    labelText: 'Data de Fim (DD/MM/YYYY)',
                    labelStyle: TextStyle(color: Colors.grey[300]),
                    prefixIcon: Icon(Icons.calendar_today, color: Colors.green[600]),
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
                  onSaved: (value) => dataFim = value!,
                ),
                SizedBox(height: 16),
                TextFormField(
                  initialValue: valorDiario,
                  decoration: InputDecoration(
                    labelText: 'Valor Diário (R)',
                    labelStyle: TextStyle(color: Colors.grey[300]),
                    prefixIcon: Icon(Icons.attach_money, color: Colors.green[600]),
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
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) return 'Campo obrigatório';
                    if (double.tryParse(value) == null) return 'Valor inválido';
                    return null;
                  },
                  onSaved: (value) => valorDiario = value!,
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancelar',
              style: TextStyle(color: Colors.orange[600]),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Aluguel de $veiculoModelo atualizado (simulação)'),
                    backgroundColor: Colors.green[600],
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[600],
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: Text('Salvar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Aluguéis')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, Rotas.agendar_aluguel),
              child: Text('Agendar Aluguel'),
            ),
            SizedBox(height: 24),
            Text(
              'Aluguéis Ativos',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            _alugueis.isEmpty
                ? Center(
                    child: Text(
                      'Nenhum aluguel ativo',
                      style: TextStyle(color: Colors.grey[300]),
                    ),
                  )
                : Column(
                    children: _alugueis.map((aluguel) {
                      return Card(
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          leading: Icon(Icons.calendar_today, color: Colors.green[600]),
                          title: Text(
                            aluguel['veiculoModelo']!,
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            'Placa: ${aluguel['veiculoPlaca']}\nCliente: ${aluguel['clienteNome']}\nDe: ${aluguel['dataInicio']} até ${aluguel['dataFim']}\nValor Diário: R\$ ${aluguel['valorDiario']}',
                            style: TextStyle(color: Colors.grey[300]),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.edit, color: Colors.green[600]),
                            onPressed: () => _mostrarDialogoEdicao(context, aluguel),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
          ],
        ),
      ),
    );
  }
}