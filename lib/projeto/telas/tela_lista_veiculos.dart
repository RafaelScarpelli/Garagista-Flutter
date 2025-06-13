import 'package:flutter/material.dart';
import 'package:projeto_ddm/projeto/entidades/lista_veiculo.dart';

class ListaVeiculosPage extends StatelessWidget {
  final ListaVeiculo _listaVeiculo = ListaVeiculo();

  @override
  Widget build(BuildContext context) {
    final veiculos = _listaVeiculo.getVeiculos();

    return Scaffold(
      appBar: AppBar(title: Text('Veículos')),
      backgroundColor: Colors.grey[900],
      body: veiculos.isEmpty
          ? Center(
              child: Text(
                'Nenhum veículo registrado',
                style: TextStyle(color: Colors.grey[300], fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: veiculos.length,
              itemBuilder: (context, index) {
                final veiculo = veiculos[index];
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
                        Text('Ano: ${veiculo.ano}',
                            style: TextStyle(color: Colors.grey[300])),
                        Text('Cor: ${veiculo.cor}',
                            style: TextStyle(color: Colors.grey[300])),
                        Text('Placa: ${veiculo.placa}',
                            style: TextStyle(color: Colors.grey[300])),
                        Text('Status: ${veiculo.status}',
                            style: TextStyle(color: Colors.grey[300])),
                      ],
                    ),
                    leading: Icon(Icons.directions_car,
                        color: Colors.green[600], size: 40),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/cadastrar_veiculo'),
        backgroundColor: Colors.green[600],
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
