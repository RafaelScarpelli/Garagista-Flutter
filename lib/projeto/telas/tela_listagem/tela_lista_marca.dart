import 'package:flutter/material.dart';
import 'package:projeto_ddm/projeto/banco/sqlite/dao/dao_marca_veiculo.dart';
import 'package:projeto_ddm/projeto/dto/marca.dart';
import 'package:projeto_ddm/projeto/telas/tela_cadastrar_marca.dart';
import 'package:url_launcher/url_launcher.dart';

class TelaListaMarcaVeiculo extends StatefulWidget {
  const TelaListaMarcaVeiculo({super.key});

  @override
  State<TelaListaMarcaVeiculo> createState() => _TelaListaMarcaVeiculoState();
}

class _TelaListaMarcaVeiculoState extends State<TelaListaMarcaVeiculo> {
  late List<MarcaVeiculo> _marcas;

  @override
  void initState() {
    super.initState();
    _marcas = [];
    _carregarMarcas().then((marcas) {
      if (mounted) {
        setState(() {
          _marcas = marcas;
        });
      }
    });
  }

  Future<List<MarcaVeiculo>> _carregarMarcas() async {
    final dao = DAOMarcaVeiculo();
    try {
      return await dao.consultarTodos();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao carregar marcas: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
      return [];
    }
  }

  Future<void> _excluirMarca(int marcaId) async {
    try {
      final dao = DAOMarcaVeiculo();
      await dao.excluir(marcaId);

      setState(() {
        _marcas.removeWhere((m) => m.id == marcaId);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Marca excluída com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao excluir marca: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _launchURL(String url) async {
    if (url.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Nenhum site oficial disponível para esta marca'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Não foi possível abrir o link: $url'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _editarMarca(MarcaVeiculo marca) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaCadastrarMarcaVeiculo(marca: marca),
      ),
    );
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
          title: const Text('Lista de Marcas'),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: _marcas.length,
          itemBuilder: (context, index) {
            final marca = _marcas[index];
            return Card(
              color: Colors.grey[850],
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text(
                  marca.nome,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Site: ${marca.site_oficial}',
                  style: const TextStyle(color: Colors.white70),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.link, color: Colors.green[600]),
                      onPressed: () => _launchURL(marca.site_oficial),
                    ),
                    PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'editar') {
                          _editarMarca(marca);
                        } else if (value == 'excluir') {
                          _excluirMarca(marca.id!);
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
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange[600],
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TelaCadastrarMarcaVeiculo(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}