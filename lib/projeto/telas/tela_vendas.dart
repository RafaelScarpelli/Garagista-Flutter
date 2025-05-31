import 'package:flutter/material.dart';
import '../rotas.dart';

class VendasPage extends StatelessWidget {

  final List<Map<String, String>> _vendas = [
    {
      'veiculoModelo': 'Honda Civic',
      'veiculoPlaca': 'ABC-1234',
      'clienteNome': 'João Silva',
      'valor': '50000',
      'data': '01/05/2021',
    },
    {
      'veiculoModelo': 'Toyota Corolla',
      'veiculoPlaca': 'XYZ-5678',
      'clienteNome': 'Maria Oliveira',
      'valor': '60000',
      'data': '15/05/2021',
    },
    {
      'veiculoModelo': 'Ford Focus',
      'veiculoPlaca': 'DEF-9012',
      'clienteNome': 'Pedro Santos',
      'valor': '45000',
      'data': '20/05/2021',
    },
  ];

  void _mostrarDialogoEdicao(BuildContext context, Map<String, String> venda) {
    final _formKey = GlobalKey<FormState>();
    String veiculoModelo = venda['veiculoModelo']!;
    String veiculoPlaca = venda['veiculoPlaca']!;
    String clienteNome = venda['clienteNome']!;
    String valor = venda['valor']!;
    String data = venda['data']!;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[800],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text(
          'Editar Venda',
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
                  initialValue: valor,
                  decoration: InputDecoration(
                    labelText: 'Valor (R)',
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
                  onSaved: (value) => valor = value!,
                ),
                SizedBox(height: 16),
                TextFormField(
                  initialValue: data,
                  decoration: InputDecoration(
                    labelText: 'Data (DD/MM/YYYY)',
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
                  onSaved: (value) => data = value!,
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
                    content: Text('Venda de $veiculoModelo atualizada (simulação)'),
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
      appBar: AppBar(title: Text('Vendas')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, Rotas.cadastrar_venda),
              child: Text('Cadastrar Venda'),
            ),
            SizedBox(height: 24),
            Text(
              'Vendas Realizadas',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            _vendas.isEmpty
                ? Center(
                    child: Text(
                      'Nenhuma venda realizada',
                      style: TextStyle(color: Colors.grey[300]),
                    ),
                  )
                : Column(
                    children: _vendas.map((venda) {
                      return Card(
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          leading: Icon(Icons.attach_money, color: Colors.green[600]),
                          title: Text(
                            venda['veiculoModelo']!,
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            'Placa: ${venda['veiculoPlaca']}\nCliente: ${venda['clienteNome']}\nValor: R\$ ${venda['valor']}\nData: ${venda['data']}',
                            style: TextStyle(color: Colors.grey[300]),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.edit, color: Colors.green[600]),
                            onPressed: () => _mostrarDialogoEdicao(context, venda),
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