import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_ddm/projeto/dto/cliente.dart';
import 'package:projeto_ddm/projeto/dto/lista_aluguel.dart';
import 'package:projeto_ddm/projeto/dto/lista_cliente.dart';
import 'package:projeto_ddm/projeto/dto/lista_veiculo.dart';
import 'package:projeto_ddm/projeto/dto/veiculo.dart';
import '../rotas.dart';

class AlugueisPage extends StatelessWidget {
  final ListaAluguel _listaAluguel = ListaAluguel();
  final ListaCliente _listaCliente = ListaCliente();
  final ListaVeiculo _listaVeiculo = ListaVeiculo();

  @override
  Widget build(BuildContext context) {
    final alugueis = _listaAluguel.getAlugueis();

    return Scaffold(
      appBar: AppBar(title: Text('Aluguéis')),
      backgroundColor: Colors.grey[900],
      body: alugueis.isEmpty
          ? Center(
              child: Text(
                'Nenhum aluguel registrado',
                style: TextStyle(color: Colors.grey[300], fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: alugueis.length,
              itemBuilder: (context, index) {
                final aluguel = alugueis[index];
                final cliente = _listaCliente.getClientes().firstWhere(
                      (c) => c.id == aluguel.clienteId,
                      orElse: () => Cliente(
                          nome: 'Desconhecido',
                          cpf: '',
                          telefone: '',
                          email: '',
                          endereco: '',
                          dataCadastro: DateTime.now()),
                    );
                final veiculo = _listaVeiculo.getVeiculos().firstWhere(
                      (v) => v.id == aluguel.veiculoId,
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
                final dataInicio = aluguel.dataInicio != null
                    ? DateFormat('dd/MM/yyyy').format(aluguel.dataInicio)
                    : 'Não informado';
                final dataFim = aluguel.dataFim != null
                    ? DateFormat('dd/MM/yyyy').format(aluguel.dataFim)
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
                        Text('Início: $dataInicio',
                            style: TextStyle(color: Colors.grey[300])),
                        Text('Fim: $dataFim',
                            style: TextStyle(color: Colors.grey[300])),
                        Text(
                            'Valor Total: R\$ ${aluguel.valorTotal.toStringAsFixed(2)}',
                            style: TextStyle(color: Colors.grey[300])),
                        Text('Status: ${aluguel.status}',
                            style: TextStyle(color: Colors.grey[300])),
                      ],
                    ),
                    leading: Icon(Icons.car_rental,
                        color: Colors.green[600], size: 40),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/agendar_aluguel'),
        backgroundColor: Colors.green[600],
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
    );
  }
}
