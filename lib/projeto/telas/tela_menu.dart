import 'package:flutter/material.dart';
import 'package:projeto_ddm/projeto/telas/tela_cadastrar_veiculo.dart';
import 'package:projeto_ddm/projeto/telas/tela_cadastrar_cliente.dart';
import 'package:projeto_ddm/projeto/telas/tela_cadastrar_aluguel.dart';
import 'package:projeto_ddm/projeto/telas/tela_cadastrar_venda.dart';
import 'package:projeto_ddm/projeto/telas/tela_cadastrar_agendamento_revisao.dart';
import 'package:projeto_ddm/projeto/telas/tela_listagem/tela_lista_cliente.dart';
import 'package:projeto_ddm/projeto/telas/tela_listagem/tela_lista_veiculos.dart';
import 'package:projeto_ddm/projeto/telas/tela_listagem/tela_lista_aluguel.dart';
import 'package:projeto_ddm/projeto/telas/tela_listagem/tela_lista_venda.dart';
import 'package:projeto_ddm/projeto/telas/tela_listagem/tela_lista_agendamento_revisao.dart';
import 'package:projeto_ddm/projeto/telas/tela_listagem/tela_lista_observacao.dart';
import 'package:projeto_ddm/projeto/telas/tela_listagem/tela_lista_marca.dart';
import 'package:projeto_ddm/projeto/telas/tela_listagem/tela_lista_fornecedor.dart';
import 'package:projeto_ddm/projeto/telas/tela_listagem/tela_lista_peca.dart';
import 'package:projeto_ddm/projeto/telas/tela_listagem/tela_lista_revisao.dart';

class TelaMenuPrincipal extends StatefulWidget {
  const TelaMenuPrincipal({super.key});

  @override
  State<TelaMenuPrincipal> createState() => _TelaMenuPrincipalState();
}

class _TelaMenuPrincipalState extends State<TelaMenuPrincipal> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
          backgroundColor: Colors.green[600],
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[600],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            alignment: Alignment.centerLeft,
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Menu Principal'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _selectedIndex == 0
              ? _buildCadastros()
              : _selectedIndex == 1
                  ? _buildListagens()
                  : _buildOutros(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.green[600],
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white70,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle),
              label: 'Cadastros',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Listagens',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'Outros',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCadastros() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Cadastros',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TelaCadastrarVeiculo()),
              );
            },
            icon: const Icon(Icons.directions_car),
            label: const Text(
              'Cadastrar Veículo',
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TelaCadastrarCliente()),
              );
            },
            icon: const Icon(Icons.person_add),
            label: const Text(
              'Cadastrar Cliente',
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TelaCadastrarAluguel()),
              );
            },
            icon: const Icon(Icons.car_rental),
            label: const Text(
              'Cadastrar Aluguel',
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TelaCadastrarVenda()),
              );
            },
            icon: const Icon(Icons.shopping_cart),
            label: const Text(
              'Cadastrar Venda',
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const TelaCadastrarAgendamentoRevisao()),
              );
            },
            icon: const Icon(Icons.schedule),
            label: const Text(
              'Cadastrar Agendamento de Revisão',
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListagens() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Listagens',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TelaListaVeiculos()),
              );
            },
            icon: const Icon(Icons.list_alt),
            label: const Text(
              'Listar Veículos',
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TelaListaClientes()),
              );
            },
            icon: const Icon(Icons.people),
            label: const Text(
              'Listar Clientes',
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TelaListaAluguel()),
              );
            },
            icon: const Icon(Icons.car_rental),
            label: const Text(
              'Listar Aluguéis',
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TelaListaVenda()),
              );
            },
            icon: const Icon(Icons.receipt),
            label: const Text(
              'Listar Vendas',
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TelaListaAgendamentoRevisao()),
              );
            },
            icon: const Icon(Icons.event),
            label: const Text(
              'Listar Agendamentos de Revisão',
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOutros() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Outros',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TelaListaObservacao()),
              );
            },
            icon: const Icon(Icons.notes),
            label: const Text(
              'Listar Observações',
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TelaListaMarcaVeiculo()),
              );
            },
            icon: const Icon(Icons.branding_watermark),
            label: const Text(
              'Listar Marcas',
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TelaListaFornecedor()),
              );
            },
            icon: const Icon(Icons.business),
            label: const Text(
              'Listar Fornecedores',
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TelaListaPeca()),
              );
            },
            icon: const Icon(Icons.build_circle),
            label: const Text(
              'Listar Peças',
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TelaListaRevisao()),
              );
            },
            icon: const Icon(Icons.build_circle),
            label: const Text(
              'Listar Revisões',
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
