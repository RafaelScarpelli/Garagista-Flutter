import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:projeto_ddm/projeto/banco/sqlite/dao/dao_veiculo.dart';
import 'package:projeto_ddm/projeto/dto/veiculo.dart';
import 'package:projeto_ddm/projeto/telas/tela_lista_veiculos.dart';

class TelaCadastrarVeiculo extends StatefulWidget {
  final Veiculo? veiculo;
  const TelaCadastrarVeiculo({super.key, this.veiculo});

  @override
  State<TelaCadastrarVeiculo> createState() => _TelaCadastrarVeiculoState();
}

class _TelaCadastrarVeiculoState extends State<TelaCadastrarVeiculo> {
  final _formKey = GlobalKey<FormState>();
  final _marcaController = TextEditingController();
  final _modeloController = TextEditingController();
  final _anoController = TextEditingController();
  final _corController = TextEditingController();
  final _quilometragemController = TextEditingController();
  final _valorVendaController = TextEditingController();
  final _valorAluguelDiaController = TextEditingController();
  final _placaController = TextEditingController();
  String? _tipoSelecionado;
  String? _statusSelecionado;

  final _placaFormatter = MaskTextInputFormatter(
    mask: 'AAA-####',
    filter: {
      'A': RegExp(r'[A-Z]'),
      '#': RegExp(r'[0-9]'),
      '-': RegExp(r'[-]'),
    },
    type: MaskAutoCompletionType.eager,
  );

  final _anoFormatter = MaskTextInputFormatter(
    mask: '####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final _tipoOpcoes = ['Venda', 'Aluguel', 'Ambos'];
  final _statusOpcoes = ['disponível', 'vendido', 'alugado', 'revisão'];

  @override
  void initState() {
    super.initState();
    if (widget.veiculo != null) {
      _marcaController.text = widget.veiculo!.marca;
      _modeloController.text = widget.veiculo!.modelo;
      _anoController.text = widget.veiculo!.ano.toString();
      _corController.text = widget.veiculo!.cor;
      _quilometragemController.text = widget.veiculo!.quilometragem.toString();
      _valorVendaController.text = widget.veiculo!.valorVenda.toString();
      _valorAluguelDiaController.text =
          widget.veiculo!.valorAluguelDia.toString();
      _placaController.text = widget.veiculo!.placa;
      _tipoSelecionado = widget.veiculo!.tipo;
      _statusSelecionado = widget.veiculo!.status;
    }
  }

  @override
  void dispose() {
    _marcaController.dispose();
    _modeloController.dispose();
    _anoController.dispose();
    _corController.dispose();
    _quilometragemController.dispose();
    _valorVendaController.dispose();
    _valorAluguelDiaController.dispose();
    _placaController.dispose();
    super.dispose();
  }

  Future<void> _salvarOuAtualizarVeiculo() async {
    if (_formKey.currentState!.validate()) {
      try {
        final veiculo = Veiculo(
          id: widget.veiculo?.id,
          marca: _marcaController.text.trim(),
          modelo: _modeloController.text.trim(),
          ano: int.parse(_anoController.text),
          cor: _corController.text.trim(),
          quilometragem: double.parse(_quilometragemController.text),
          tipo: _tipoSelecionado!,
          valorVenda: double.parse(_valorVendaController.text),
          valorAluguelDia: double.parse(_valorAluguelDiaController.text),
          status: _statusSelecionado!,
          dataCadastro: widget.veiculo?.dataCadastro ?? DateTime.now(),
          placa: _placaController.text,
        );

        final dao = DAOVeiculo();
        if (widget.veiculo == null) {
          await dao.salvar(veiculo);
        } else {
          await dao.atualizar(veiculo);
        }

        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(widget.veiculo == null
                ? 'Veículo cadastrado com sucesso!'
                : 'Veículo atualizado com sucesso!'),
            backgroundColor: Colors.green,
          ),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TelaListaVeiculos()),
        );
      } catch (e) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Erro ao ${widget.veiculo == null ? 'cadastrar' : 'atualizar'} veículo: $e'),
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
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: Colors.grey[900],
          labelStyle: const TextStyle(color: Colors.white70),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange[600],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              widget.veiculo == null ? 'Cadastrar Veículo' : 'Editar Veículo'),
          backgroundColor: Colors.green[600],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _marcaController,
                  decoration: const InputDecoration(labelText: 'Marca'),
                  validator: (value) =>
                      value!.trim().isEmpty ? 'Informe a marca' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _modeloController,
                  decoration: const InputDecoration(labelText: 'Modelo'),
                  validator: (value) =>
                      value!.trim().isEmpty ? 'Informe o modelo' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _anoController,
                  decoration: const InputDecoration(labelText: 'Ano'),
                  keyboardType: TextInputType.number,
                  inputFormatters: [_anoFormatter],
                  validator: (value) {
                    if (value!.trim().isEmpty) return 'Informe o ano';
                    final ano = int.tryParse(value);
                    if (ano == null || ano < 1900 || ano > 2025) {
                      return 'Ano inválido (1900-2025)';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _corController,
                  decoration: const InputDecoration(labelText: 'Cor'),
                  validator: (value) =>
                      value!.trim().isEmpty ? 'Informe a cor' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _quilometragemController,
                  decoration:
                      const InputDecoration(labelText: 'Quilometragem (km)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.trim().isEmpty) return 'Informe a quilometragem';
                    final km = double.tryParse(value);
                    if (km == null || km < 0) return 'Quilometragem inválida';
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _tipoSelecionado,
                  decoration: const InputDecoration(labelText: 'Tipo'),
                  items: _tipoOpcoes
                      .map((tipo) => DropdownMenuItem(
                            value: tipo,
                            child: Text(tipo),
                          ))
                      .toList(),
                  onChanged: (value) =>
                      setState(() => _tipoSelecionado = value),
                  validator: (value) =>
                      value == null ? 'Selecione o tipo' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _valorVendaController,
                  decoration:
                      const InputDecoration(labelText: 'Valor de Venda (R\$)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.trim().isEmpty)
                      return 'Informe o valor de venda';
                    final valor = double.tryParse(value);
                    if (valor == null || valor < 0) return 'Valor inválido';
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _valorAluguelDiaController,
                  decoration: const InputDecoration(
                      labelText: 'Valor de Aluguel/Dia (R\$)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Informe o valor de aluguel';
                    }
                    final valor = double.tryParse(value);
                    if (valor == null || valor < 0) return 'Valor inválido';
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _statusSelecionado,
                  decoration: const InputDecoration(labelText: 'Status'),
                  items: _statusOpcoes
                      .map((status) => DropdownMenuItem(
                            value: status,
                            child: Text(status),
                          ))
                      .toList(),
                  onChanged: (value) =>
                      setState(() => _statusSelecionado = value),
                  validator: (value) =>
                      value == null ? 'Selecione o status' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _placaController,
                  decoration: const InputDecoration(labelText: 'Placa'),
                  inputFormatters: [_placaFormatter],
                  validator: (value) {
                    if (value!.trim().isEmpty) return 'Informe a placa';
                    final placaValida =
                        RegExp(r'^[A-Z]{3}-[0-9]{4}$').hasMatch(value);
                    if (!placaValida) return 'Placa inválida (ex.: AAA-1111)';
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _salvarOuAtualizarVeiculo,
                  child:
                      Text(widget.veiculo == null ? 'Cadastrar' : 'Atualizar'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaListaVeiculos(),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[600],
                  ),
                  child: const Text('Cancelar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
