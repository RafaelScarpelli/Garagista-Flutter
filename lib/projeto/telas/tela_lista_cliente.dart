import 'package:flutter/material.dart';
import 'package:projeto_ddm/projeto/banco/sqlite/dao/dao_cliente.dart';
import 'package:projeto_ddm/projeto/dto/cliente.dart';
import 'package:projeto_ddm/projeto/telas/tela_cadastrar_cliente.dart';

class TelaListaClientes extends StatefulWidget {
  const TelaListaClientes({super.key});

  @override
  State<TelaListaClientes> createState() => _TelaListaClientesState();
}

class _TelaListaClientesState extends State<TelaListaClientes> {
  Future<List<Cliente>> _carregarClientes() async {
    final dao = DAOCliente();
    try {
      return await dao.consultarTodos();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao carregar clientes: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
      return [];
    }
  }

  Future<void> _excluirCliente(int id, String nome) async {
    bool? confirmar = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar Exclusão'),
        content: Text('Deseja excluir o cliente $nome?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Excluir', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmar == true) {
      try {
        final dao = DAOCliente();
        await dao.excluir(id);
        setState(() {});
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Cliente excluído com sucesso!'),
            backgroundColor: Colors.green,
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao excluir cliente: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
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
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Clientes'),
        ),
        body: FutureBuilder<List<Cliente>>(
          future: _carregarClientes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(child: Text('Erro ao carregar clientes'));
            }
            final clientes = snapshot.data ?? [];
            if (clientes.isEmpty) {
              return const Center(child: Text('Nenhum cliente cadastrado'));
            }
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: clientes.length,
              itemBuilder: (context, index) {
                final cliente = clientes[index];
                return Card(
                  color: Colors.grey[850],
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text(
                      cliente.nome,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'CPF: ${cliente.cpf} | Telefone: ${cliente.telefone}',
                      style: const TextStyle(color: Colors.white70),
                    ),
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'editar') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  TelaCadastrarCliente(cliente: cliente),
                            ),
                          );
                        } else if (value == 'excluir') {
                          _excluirCliente(cliente.id!, cliente.nome);
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'editar',
                          child: Text('Editar'),
                        ),
                        const PopupMenuItem(
                          value: 'excluir',
                          child: Text('Excluir', style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange[600],
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TelaCadastrarCliente(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}