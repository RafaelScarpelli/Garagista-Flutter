import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_ddm/projeto/dto/aluguel.dart';
import 'package:projeto_ddm/projeto/dto/cliente.dart';
import 'package:projeto_ddm/projeto/dto/lista_aluguel.dart';
import 'package:projeto_ddm/projeto/dto/lista_cliente.dart';
import 'package:projeto_ddm/projeto/dto/lista_veiculo.dart';
import 'package:projeto_ddm/projeto/dto/lista_venda.dart';
import 'package:projeto_ddm/projeto/dto/veiculo.dart';
import 'package:projeto_ddm/projeto/dto/venda.dart';
import '../rotas.dart';

class VendasPage extends StatelessWidget {
  final ListaVenda _listaVenda = ListaVenda();
  final ListaCliente _listaCliente = ListaCliente();
  final ListaVeiculo _listaVeiculo = ListaVeiculo();

  @override
  Widget build(BuildContext context) {
    final vendas = _listaVenda.getVendas();

    return Scaffold(
      appBar: AppBar(title: Text('Vendas')),
      backgroundColor: Colors.grey[900],
      body: vendas.isEmpty
          ? Center(
              child: Text(
                'Nenhuma venda registrada',
                style: TextStyle(color: Colors.grey[300], fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: vendas.length,
              itemBuilder: (context, index) {
                final venda = vendas[index];
                final cliente = _listaCliente.getClientes().firstWhere(
                      (c) => c.id == venda.clienteId,
                      orElse: () => Cliente(
                          nome: 'Desconhecido',
                          cpf: '',
                          telefone: '',
                          email: '',
                          endereco: '',
                          dataCadastro: DateTime.now()),
                    );
                final veiculo = _listaVeiculo.getVeiculos().firstWhere(
                      (v) => v.id == venda.veiculoId,
                      orElse: () => Veiculo(
                        marca: 'Desconhecido',
                        modelo: '',
                        ano: 0,
                        cor: '',
                        quilometragem: 0,
                        tipo: '',
                        valorVenda: 0,
                        valorAluguelDia: 0,
                        status: '',
                        dataCadastro: DateTime.now(),
                        placa: '',
                      ),
                    );
                final dataVenda = venda.dataVenda != null
                    ? DateFormat('dd/MM/yyyy').format(venda.dataVenda)
                    : 'Não informado';

                return Card(
                  color: Colors.grey[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.orange[600]!, width: 1.5),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16.0),
                    title: Text(
                      '${veiculo.marca} ${veiculo.modelo}',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        Text('Cliente: ${cliente.nome}',
                            style: TextStyle(color: Colors.grey[300])),
                        Text('Data: $dataVenda',
                            style: TextStyle(color: Colors.grey[300])),
                        Text('Valor: R\$ ${venda.valor.toStringAsFixed(2)}',
                            style: TextStyle(color: Colors.grey[300])),
                      ],
                    ),
                    leading:
                        Icon(Icons.sell, color: Colors.green[600], size: 40),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/cadastrar_venda'),
        backgroundColor: Colors.green[600],
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
    );
  }
}
