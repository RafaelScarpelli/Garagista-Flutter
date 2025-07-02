import 'package:flutter/material.dart';
import 'package:projeto_ddm/projeto/rotas.dart';

class MenuPrincipalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark().copyWith(
        primaryColor: Colors.green[600],
        colorScheme: ColorScheme.dark(
          primary: Colors.green[600]!,
          secondary: Colors.orange[600]!,
        ),
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[850],
          foregroundColor: Colors.white,
          elevation: 4,
        ),
        cardTheme: CardThemeData(
          color: Colors.grey[800],
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: const Text('Menu Principal')),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Card(
              child: ListTile(
                title: const Text('Listar Veículos',
                    style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.directions_car, color: Colors.green[600]),
                onTap: () =>
                    Navigator.pushNamed(context, Rotas.listar_veiculos),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Cadastrar Veículo',
                    style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.add_circle, color: Colors.green[600]),
                onTap: () =>
                    Navigator.pushNamed(context, Rotas.cadastrar_veiculo),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Listar Clientes',
                    style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.person, color: Colors.green[600]),
                onTap: () =>
                    Navigator.pushNamed(context, Rotas.listar_clientes),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Cadastrar Cliente',
                    style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.person_add, color: Colors.green[600]),
                onTap: () =>
                    Navigator.pushNamed(context, Rotas.cadastrar_cliente),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Listar Vendas',
                    style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.shopping_cart, color: Colors.green[600]),
                onTap: () => Navigator.pushNamed(context, Rotas.listar_vendas),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Cadastrar Venda',
                    style: TextStyle(color: Colors.white)),
                trailing:
                    Icon(Icons.add_shopping_cart, color: Colors.green[600]),
                onTap: () =>
                    Navigator.pushNamed(context, Rotas.cadastrar_venda),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
