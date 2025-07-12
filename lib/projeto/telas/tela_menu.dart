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
            Card(
              child: ListTile(
                title: const Text('Listar Aluguéis',
                    style: TextStyle(color: Colors.white)),
                trailing:
                    Icon(Icons.car_rental_outlined, color: Colors.green[600]),
                onTap: () => Navigator.pushNamed(context, Rotas.listar_aluguel),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Cadastrar Aluguel',
                    style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.app_registration_outlined,
                    color: Colors.green[600]),
                onTap: () =>
                    Navigator.pushNamed(context, Rotas.cadastrar_aluguel),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Listar Observações',
                    style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.assignment_ind_rounded,
                    color: Colors.green[600]),
                onTap: () =>
                    Navigator.pushNamed(context, Rotas.listar_observacao),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Cadastrar Observação',
                    style: TextStyle(color: Colors.white)),
                trailing:
                    Icon(Icons.announcement_rounded, color: Colors.green[600]),
                onTap: () =>
                    Navigator.pushNamed(context, Rotas.cadastrar_observacao),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Listar Revisões',
                    style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.build, color: Colors.green[600]),
                onTap: () => Navigator.pushNamed(context, Rotas.listar_revisao),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Cadastrar Revisão',
                    style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.add_box, color: Colors.green[600]),
                onTap: () =>
                    Navigator.pushNamed(context, Rotas.cadastrar_revisao),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Listar Marcas',
                    style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.branding_watermark, color: Colors.green[600]),
                onTap: () =>
                    Navigator.pushNamed(context, Rotas.listar_marca_veiculo),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Cadastrar Marca',
                    style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.add_business, color: Colors.green[600]),
                onTap: () =>
                    Navigator.pushNamed(context, Rotas.cadastrar_marca_veiculo),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Listar Fornecedores',
                    style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.business, color: Colors.green[600]),
                onTap: () =>
                    Navigator.pushNamed(context, Rotas.listar_fornecedor),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Cadastrar Fornecedor',
                    style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.add_business, color: Colors.green[600]),
                onTap: () =>
                    Navigator.pushNamed(context, Rotas.cadastrar_fornecedor),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Listar Peças',
                    style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.build_circle, color: Colors.green[600]),
                onTap: () => Navigator.pushNamed(context, Rotas.listar_peca),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Cadastrar Peça',
                    style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.add_circle, color: Colors.green[600]),
                onTap: () => Navigator.pushNamed(context, Rotas.cadastrar_peca),
              ),
            ),
          ],
        ),
      ),
    );
  }
}