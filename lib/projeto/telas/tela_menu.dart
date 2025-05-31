import 'package:flutter/material.dart';
import 'package:projeto_ddm/projeto/rotas.dart';

class MenuPrincipalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu Principal')),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Card(
            child: ListTile(
              title: Text('Listar Veículos',
                  style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.directions_car, color: Colors.green[600]),
              onTap: () => Navigator.pushNamed(context, Rotas.listar_veiculos),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Cadastrar Veículo',
                  style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.add_circle, color: Colors.green[600]),
              onTap: () =>
                  Navigator.pushNamed(context, Rotas.cadastrar_veiculo),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Clientes', style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.person, color: Colors.green[600]),
              onTap: () => Navigator.pushNamed(context, Rotas.clientes),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Vendas', style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.attach_money, color: Colors.green[600]),
              onTap: () => Navigator.pushNamed(context, Rotas.vendas),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Aluguéis', style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.calendar_today, color: Colors.green[600]),
              onTap: () => Navigator.pushNamed(context, Rotas.alugueis),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Sair', style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.exit_to_app, color: Colors.orange[600]),
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Rotas.dashboard),
            ),
          ),
        ],
      ),
    );
  }
}
