import 'package:flutter/material.dart';
import 'package:projeto_ddm/projeto/banco/sqlite/dao/dao_cliente.dart';
import 'package:projeto_ddm/projeto/banco/sqlite/dao/dao_venda.dart';
import 'package:projeto_ddm/projeto/banco/sqlite/dao/dao_veiculo.dart';
import 'package:projeto_ddm/projeto/dto/veiculo.dart';
import 'package:projeto_ddm/projeto/dto/venda.dart';
import 'package:projeto_ddm/projeto/telas/tela_cadastrar_venda.dart';
import 'package:intl/intl.dart';

class TelaListaVenda extends StatefulWidget {
  const TelaListaVenda({super.key});

  @override
  State<TelaListaVenda> createState() => _TelaListaVendaState();
}

class _TelaListaVendaState extends State<TelaListaVenda> {
  Future<List<Venda>> _carregarVendas() async {
    final dao = DAOVenda();
    try {
      return await dao.consultarTodos();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao carregar vendas: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
      return [];
    }
  }

  Future<String> _getClienteNome(int clienteId) async {
    final dao = DAOCliente();
    final cliente = await dao.consultarPorId(clienteId);
    return cliente?.nome ?? 'Desconhecido';
  }

  Future<String> _getVeiculosNomes(List<int> veiculoIds) async {
    final dao = DAOVeiculo();
    final nomes = <String>[];
    for (final id in veiculoIds) {
      final veiculo = await dao.consultarPorId(id);
      if (veiculo != null) {
        nomes.add('${veiculo.marca} ${veiculo.modelo} (${veiculo.placa})');
      }
    }
    return nomes.join(', ');
  }

  Future<void> _excluirVenda(int id) async {
    bool? confirmar = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar Exclusão'),
        content: const Text('Deseja excluir esta venda?'),
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
        final dao = DAOVenda();
        await dao.excluir(id);
        setState(() {});
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Venda excluída com sucesso!'),
            backgroundColor: Colors.green,
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao excluir venda: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _editarVenda(Venda venda) async {
    try {
      final daoCliente = DAOCliente();
      final cliente = await daoCliente.consultarPorId(venda.clienteId);
      if (cliente == null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Cliente não encontrado.'),
              backgroundColor: Colors.red,
            ),
          );
        }
        return;
      }

      final daoVeiculo = DAOVeiculo();
      final veiculosSelecionados = <Veiculo>[];
      for (final veiculoId in venda.veiculoIds) {
        final veiculo = await daoVeiculo.consultarPorId(veiculoId);
        if (veiculo != null) {
          veiculosSelecionados.add(veiculo);
        }
      }

      if (veiculosSelecionados.isEmpty) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Nenhum veículo encontrado para esta venda.'),
              backgroundColor: Colors.red,
            ),
          );
        }
        return;
      }

      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TelaCadastrarVenda(
              venda: venda,
              initialCliente: cliente,
              initialVeiculos: veiculosSelecionados,
            ),
          ),
        );
      }

      print('Erro no try Cliente ID: ${venda.clienteId}, Veículo IDs: ${venda.veiculoIds}');

    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao carregar dados para edição: $e'),
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
          title: const Text('Lista de Vendas'),
        ),
        body: FutureBuilder<List<Venda>>(
          future: _carregarVendas(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(child: Text('Erro ao carregar vendas'));
            }
            final vendas = snapshot.data ?? [];
            if (vendas.isEmpty) {
              return const Center(child: Text('Nenhuma venda cadastrada'));
            }
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: vendas.length,
              itemBuilder: (context, index) {
                final venda = vendas[index];
                return Card(
                  color: Colors.grey[850],
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: FutureBuilder<String>(
                      future: _getClienteNome(venda.clienteId),
                      builder: (context, snapshot) {
                        return Text(
                          'Cliente: ${snapshot.data ?? 'Carregando...'}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                    subtitle: FutureBuilder<String>(
                      future: _getVeiculosNomes(venda.veiculoIds),
                      builder: (context, snapshot) {
                        return Text(
                          'Veículos: ${snapshot.data ?? 'Carregando...'}\nData: ${DateFormat('dd/MM/yyyy').format(venda.dataVenda)}',
                          style: const TextStyle(color: Colors.white70),
                        );
                      },
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'R\$ ${venda.valor.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Colors.orange[600],
                          ),
                        ),
                        PopupMenuButton<String>(
                          onSelected: (value) {
                            if (value == 'editar') {
                              _editarVenda(venda);
                            } else if (value == 'excluir') {
                              _excluirVenda(venda.id!);
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
                builder: (context) => const TelaCadastrarVenda(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}