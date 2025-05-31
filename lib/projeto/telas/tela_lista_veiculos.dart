import 'package:flutter/material.dart';
import 'package:projeto_ddm/projeto/entidades/lista_veiculo.dart';

class ListarVeiculosPage extends StatefulWidget {
  @override
  _ListarVeiculosPageState createState() => _ListarVeiculosPageState();
}

class _ListarVeiculosPageState extends State<ListarVeiculosPage> {
  final ListaVeiculo _listaVeiculo = ListaVeiculo();

  @override
  Widget build(BuildContext context) {
    final veiculos = _listaVeiculo.getVeiculos();

    return Scaffold(
      appBar: AppBar(title: Text('Listar Veículos')),
      body: veiculos.isEmpty
          ? Center(
              child: Text(
                'Nenhum veículo cadastrado',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: veiculos.length,
              itemBuilder: (context, index) {
                final veiculo = veiculos[index];
                return Card(
                  child: ListTile(
                    leading:
                        Icon(Icons.directions_car, color: Colors.green[600]),
                    title: Text(veiculo.modelo,
                        style: TextStyle(color: Colors.white)),
                    subtitle: Text(
                      'Placa: ${veiculo.placa} | Ano: ${veiculo.ano}',
                      style: TextStyle(color: Colors.grey[300]),
                    ),
                    onTap: () {
                      // Navegar para Detalhes Veículo (futuro)
                      // Navigator.pushNamed(context, Rotas.detalhes_veiculo, arguments: veiculo);
                    },
                  ),
                );
              },
            ),
    );
  }
}
