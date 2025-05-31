import 'package:flutter/material.dart';
import '../rotas.dart';

class ClientesPage extends StatelessWidget {
  // Dados fixos de clientes para simulação
  final List<Map<String, String>> _clientes = [
    {
      'nome': 'João Silva',
      'cpf': '123.456.789-00',
      'telefone': '(11) 98765-4321',
    },
    {
      'nome': 'Maria Oliveira',
      'cpf': '987.654.321-00',
      'telefone': '(21) 91234-5678',
    },
    {
      'nome': 'Pedro Santos',
      'cpf': '456.789.123-00',
      'telefone': '(31) 99876-5432',
    },
  ];

  void _mostrarDialogo_edicao(BuildContext context, Map<String, String> cliente) {
    final _formKey = GlobalKey<FormState>();
    String nome = cliente['nome']!;
    String cpf = cliente['cpf']!;
    String telefone = cliente['telefone']!;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[800],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text(
          'Editar Cliente',
          style: TextStyle(color: Colors.white),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: nome,
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
                onSaved: (value) => nome = value!,
              ),
              SizedBox(height: 16),
              TextFormField(
                initialValue: cpf,
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
                onSaved: (value) => cpf = value!,
              ),
              SizedBox(height: 16),
              TextFormField(
                initialValue: telefone,
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
                onSaved: (value) => telefone = value!,
              ),
            ],
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
                    content: Text('Cliente $nome atualizado (simulação)'),
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
      appBar: AppBar(title: Text('Clientes')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, Rotas.cadastrar_cliente),
              child: Text('Cadastrar Cliente'),
            ),
            SizedBox(height: 24),
            Text(
              'Clientes Cadastrados',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            _clientes.isEmpty
                ? Center(
                    child: Text(
                      'Nenhum cliente cadastrado',
                      style: TextStyle(color: Colors.grey[300]),
                    ),
                  )
                : Column(
                    children: _clientes.map((cliente) {
                      return Card(
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          leading: Icon(Icons.person, color: Colors.green[600]),
                          title: Text(
                            cliente['nome']!,
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            'CPF: ${cliente['cpf']}\nTelefone: ${cliente['telefone']}',
                            style: TextStyle(color: Colors.grey[300]),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.edit, color: Colors.green[600]),
                            onPressed: () => _mostrarDialogo_edicao(context, cliente),
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